// ============================================================================
// FILE: wallet_repository_impl.dart
// PURPOSE: Implementation of IWalletRepository
// PATTERN: Returns Either<Failure, Success> for all operations
// ============================================================================

import 'package:bip39/bip39.dart' as bip39;
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import '../../../../core/services/web3_service.dart';
import '../../domain/entities/wallet_entity.dart';
import '../../domain/failures/wallet_failure.dart';
import '../../domain/repositories/i_wallet_repository.dart';
import '../datasources/wallet_local_datasource.dart';

@LazySingleton(as: IWalletRepository)
class WalletRepositoryImpl implements IWalletRepository {
  WalletRepositoryImpl(
    this._localDatasource,
    this._web3Service,
  );

  final WalletLocalDatasource _localDatasource;
  final Web3Service _web3Service;

  @override
  Future<Either<WalletFailure, String>> generateMnemonic() async {
    try {
      // Generate a 12-word mnemonic (128 bits of entropy)
      final mnemonic = bip39.generateMnemonic(strength: 128);
      return right(mnemonic);
    } catch (e) {
      return left(WalletFailure.mnemonicGeneration(
        message: 'Failed to generate seed phrase: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<WalletFailure, bool>> validateMnemonic(String mnemonic) async {
    try {
      final isValid = bip39.validateMnemonic(mnemonic.trim().toLowerCase());
      if (!isValid) {
        return left(const WalletFailure.invalidMnemonic());
      }
      return right(true);
    } catch (e) {
      return left(WalletFailure.invalidMnemonic(
        message: 'Invalid seed phrase: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<WalletFailure, WalletEntity>> createWallet(
    String mnemonic,
  ) async {
    try {
      // Validate mnemonic first
      if (!bip39.validateMnemonic(mnemonic.trim().toLowerCase())) {
        return left(const WalletFailure.invalidMnemonic());
      }

      // Generate address from mnemonic using Web3Service
      final walletResult = await _web3Service.generateWalletFromMnemonic(mnemonic.trim().toLowerCase());
      
      final address = walletResult.fold(
        (failure) => throw Exception('Failed to generate wallet: ${failure.message}'),
        (wallet) => wallet.address.hex,
      );

      // Store wallet securely
      await _localDatasource.storeWallet(
        mnemonic: mnemonic.trim().toLowerCase(),
        address: address,
        isImported: false,
      );

      final wallet = WalletEntity(
        address: address,
        mnemonic: mnemonic.trim().toLowerCase(),
        isImported: false,
        createdAt: DateTime.now(),
      );

      return right(wallet);
    } catch (e) {
      return left(WalletFailure.storageError(
        message: 'Failed to create wallet: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<WalletFailure, WalletEntity>> importWallet(
    String privateKey,
  ) async {
    try {
      // Validate and clean private key
      final cleanKey = privateKey.trim().replaceFirst(RegExp(r'^0x'), '');
      if (!_isValidPrivateKey(cleanKey)) {
        return left(const WalletFailure.invalidPrivateKey());
      }

      // Generate address from private key using Web3Service
      EthPrivateKey ethPrivateKey;
      try {
        ethPrivateKey = EthPrivateKey.fromHex('0x$cleanKey');
      } catch (e) {
        return left(WalletFailure.invalidPrivateKey(
          message: 'Invalid private key format: ${e.toString()}',
        ));
      }

      final address = ethPrivateKey.address.hex;

      // Store wallet securely (use private key as "mnemonic" for imported wallets)
      await _localDatasource.storeWallet(
        mnemonic: cleanKey,
        address: address,
        isImported: true,
      );

      final wallet = WalletEntity(
        address: address,
        mnemonic: cleanKey,
        isImported: true,
        createdAt: DateTime.now(),
      );

      return right(wallet);
    } catch (e) {
      return left(WalletFailure.storageError(
        message: 'Failed to import wallet: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<WalletFailure, WalletEntity>> getWallet() async {
    try {
      final mnemonic = await _localDatasource.getMnemonic();
      if (mnemonic == null || mnemonic.isEmpty) {
        return left(const WalletFailure.walletNotFound());
      }

      final address = await _localDatasource.getAddress();
      final isImported = await _localDatasource.getIsImported();
      final createdAt = await _localDatasource.getCreatedAt();

      final wallet = WalletEntity(
        address: address ?? '',
        mnemonic: mnemonic,
        isImported: isImported,
        createdAt: createdAt,
      );

      return right(wallet);
    } catch (e) {
      return left(WalletFailure.storageError(
        message: 'Failed to retrieve wallet: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<WalletFailure, bool>> hasWallet() async {
    try {
      final exists = await _localDatasource.hasWallet();
      return right(exists);
    } catch (e) {
      return left(WalletFailure.storageError(
        message: 'Failed to check wallet: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<WalletFailure, Unit>> deleteWallet() async {
    try {
      await _localDatasource.deleteWallet();
      return right(unit);
    } catch (e) {
      return left(WalletFailure.storageError(
        message: 'Failed to delete wallet: ${e.toString()}',
      ));
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // PRIVATE HELPERS
  // ══════════════════════════════════════════════════════════════════════════

  /// Validate private key format (hex string, 64 chars)
  bool _isValidPrivateKey(String key) {
    final cleanKey = key.startsWith('0x') ? key.substring(2) : key;
    if (cleanKey.length != 64) return false;
    return RegExp(r'^[0-9a-fA-F]+$').hasMatch(cleanKey);
  }
}


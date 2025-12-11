// ============================================================================
// FILE: i_wallet_repository.dart
// PURPOSE: Wallet repository interface (contract) for dependency inversion
// NOTE: Pure Dart - NO Flutter imports
// PATTERN: All methods return Either<Failure, Success> using fpdart
// ============================================================================

import 'package:fpdart/fpdart.dart';
import '../entities/wallet_entity.dart';
import '../failures/wallet_failure.dart';

/// Repository interface for wallet operations
/// Implementations should be registered with DI: @LazySingleton(as: IWalletRepository)
abstract class IWalletRepository {
  /// Generate a new 12-word mnemonic seed phrase
  /// Returns: Either<WalletFailure, String> - the mnemonic or failure
  Future<Either<WalletFailure, String>> generateMnemonic();

  /// Validate a mnemonic seed phrase
  /// Returns: Either<WalletFailure, bool> - true if valid
  Future<Either<WalletFailure, bool>> validateMnemonic(String mnemonic);

  /// Create a new wallet from a mnemonic and store it securely
  /// Returns: Either<WalletFailure, WalletEntity> - the created wallet
  Future<Either<WalletFailure, WalletEntity>> createWallet(String mnemonic);

  /// Import a wallet using a private key
  /// Returns: Either<WalletFailure, WalletEntity> - the imported wallet
  Future<Either<WalletFailure, WalletEntity>> importWallet(String privateKey);

  /// Get the current stored wallet
  /// Returns: Either<WalletFailure, WalletEntity> - the wallet or failure
  Future<Either<WalletFailure, WalletEntity>> getWallet();

  /// Check if a wallet exists in storage
  /// Returns: Either<WalletFailure, bool> - true if wallet exists
  Future<Either<WalletFailure, bool>> hasWallet();

  /// Delete the stored wallet
  /// Returns: Either<WalletFailure, Unit> - Unit on success
  Future<Either<WalletFailure, Unit>> deleteWallet();
}


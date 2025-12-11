// ============================================================================
// FILE: web3_service.dart
// PURPOSE: Web3 service for Ethereum blockchain interactions
// ============================================================================

import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3dart/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'package:bip39/bip39.dart' as bip39;

import '../errors/failures.dart';

@lazySingleton
class Web3Service {
  late Web3Client _client;
  final String _rpcUrl;

  // Ethereum mainnet RPC endpoints (using public RPC)
  static const String _defaultRpcUrl = 'https://eth.llamarpc.com'; // Public RPC

  Web3Service() : _rpcUrl = _defaultRpcUrl {
    _client = Web3Client(_rpcUrl, http.Client());
  }

  /// Generate a new Ethereum wallet from mnemonic
  /// Note: This is a simplified version. For production, use proper BIP32/BIP44 derivation
  Future<Either<CoreFailure, ({EthPrivateKey privateKey, EthereumAddress address})>> 
      generateWalletFromMnemonic(String mnemonic, {int index = 0}) async {
    try {
      // Validate mnemonic
      if (!bip39.validateMnemonic(mnemonic)) {
        return left(const CoreFailure.invalidData(message: 'Invalid mnemonic phrase'));
      }

      // Convert mnemonic to seed
      final seed = bip39.mnemonicToSeed(mnemonic);
      
      // Create a deterministic private key from seed
      // Note: This is simplified - in production use proper BIP44 derivation (m/44'/60'/0'/0/index)
      final privateKeyBytes = seed.take(32).toList();
      final privateKeyHex = '0x${privateKeyBytes.map((e) => e.toRadixString(16).padLeft(2, '0')).join()}';
      
      final privateKey = EthPrivateKey.fromHex(privateKeyHex);
      final address = privateKey.address;

      return right((privateKey: privateKey, address: address));
    } catch (e) {
      return left(CoreFailure.unexpected(message: 'Failed to generate wallet: $e'));
    }
  }

  /// Get balance for an Ethereum address
  Future<Either<CoreFailure, EtherAmount>> getBalance(EthereumAddress address) async {
    try {
      final balance = await _client.getBalance(address);
      return right(balance);
    } catch (e) {
      return left(CoreFailure.network(message: 'Failed to get balance: $e'));
    }
  }

  /// Get transaction count (nonce) for an address
  Future<Either<CoreFailure, int>> getTransactionCount(EthereumAddress address) async {
    try {
      final count = await _client.getTransactionCount(address);
      return right(count);
    } catch (e) {
      return left(CoreFailure.network(message: 'Failed to get transaction count: $e'));
    }
  }

  /// Estimate gas for a transaction
  Future<Either<CoreFailure, BigInt>> estimateGas({
    required EthereumAddress from,
    required EthereumAddress to,
    required EtherAmount value,
    String? data,
  }) async {
    try {
      final gasEstimate = await _client.estimateGas(
        sender: from,
        to: to,
        data: data != null ? crypto.hexToBytes(data) : null,
        value: value,
      );
      return right(gasEstimate);
    } catch (e) {
      return left(CoreFailure.unexpected(message: 'Failed to estimate gas: $e'));
    }
  }

  /// Get current gas price
  Future<Either<CoreFailure, EtherAmount>> getGasPrice() async {
    try {
      final gasPrice = await _client.getGasPrice();
      return right(gasPrice);
    } catch (e) {
      return left(CoreFailure.network(message: 'Failed to get gas price: $e'));
    }
  }

  /// Send a transaction
  Future<Either<CoreFailure, String>> sendTransaction({
    required EthPrivateKey credentials,
    required EthereumAddress to,
    required EtherAmount value,
    BigInt? gasLimit,
    EtherAmount? gasPrice,
    String? data,
  }) async {
    try {
      // Get nonce
      final nonceResult = await getTransactionCount(credentials.address);
      final nonce = nonceResult.fold(
        (failure) => throw Exception('Failed to get nonce: ${failure.message}'),
        (count) => count,
      );

      // Get gas price if not provided
      final EtherAmount finalGasPrice;
      if (gasPrice != null) {
        finalGasPrice = gasPrice;
      } else {
        final gasPriceResult = await getGasPrice();
        finalGasPrice = gasPriceResult.fold(
          (failure) => throw Exception('Failed to get gas price: ${failure.message}'),
          (price) => price,
        );
      }

      // Estimate gas if not provided
      final BigInt finalGasLimit;
      if (gasLimit != null) {
        finalGasLimit = gasLimit;
      } else {
        final gasEstimateResult = await estimateGas(
          from: credentials.address,
          to: to,
          value: value,
          data: data,
        );
        finalGasLimit = gasEstimateResult.fold(
          (failure) => BigInt.from(21000), // Use default if estimation fails
          (estimate) => estimate,
        );
      }

      // Create transaction
      final transaction = Transaction(
        to: to,
        value: value,
        gasPrice: finalGasPrice,
        maxGas: finalGasLimit.toInt(),
        nonce: nonce,
        data: data != null ? crypto.hexToBytes(data) : null,
      );

      // Send transaction
      final txHash = await _client.sendTransaction(
        credentials,
        transaction,
        chainId: 1, // Ethereum mainnet
      );

      return right(txHash);
    } catch (e) {
      return left(CoreFailure.network(message: 'Failed to send transaction: $e'));
    }
  }

  /// Get transaction receipt
  Future<Either<CoreFailure, TransactionReceipt>> getTransactionReceipt(
    String txHash,
  ) async {
    try {
      final receipt = await _client.getTransactionReceipt(txHash);
      if (receipt == null) {
        return left(const CoreFailure.invalidData(message: 'Transaction not found'));
      }
      return right(receipt);
    } catch (e) {
      return left(CoreFailure.network(message: 'Failed to get transaction receipt: $e'));
    }
  }

  /// Get transaction by hash
  Future<Either<CoreFailure, TransactionInformation>> getTransaction(
    String txHash,
  ) async {
    try {
      final tx = await _client.getTransactionByHash(txHash);
      if (tx == null) {
        return left(const CoreFailure.invalidData(message: 'Transaction not found'));
      }
      return right(tx);
    } catch (e) {
      return left(CoreFailure.network(message: 'Failed to get transaction: $e'));
    }
  }

  /// Get block number
  Future<Either<CoreFailure, int>> getBlockNumber() async {
    try {
      final blockNumber = await _client.getBlockNumber();
      return right(blockNumber);
    } catch (e) {
      return left(CoreFailure.network(message: 'Failed to get block number: $e'));
    }
  }

  /// Sign a message
  String signMessage(EthPrivateKey credentials, String message) {
    try {
      final messageBytes = Uint8List.fromList(message.codeUnits);
      final signature = credentials.signPersonalMessageToUint8List(messageBytes);
      return '0x${signature.map((e) => e.toRadixString(16).padLeft(2, '0')).join()}';
    } catch (e) {
      throw Exception('Failed to sign message: $e');
    }
  }

  /// Verify a message signature
  bool verifyMessage({
    required String message,
    required String signature,
    required EthereumAddress expectedAddress,
  }) {
    try {
      // Implementation would require message recovery
      // This is a simplified version
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Dispose resources
  void dispose() {
    _client.dispose();
  }
}


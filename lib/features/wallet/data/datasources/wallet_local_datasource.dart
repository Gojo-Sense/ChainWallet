// ============================================================================
// FILE: wallet_local_datasource.dart
// PURPOSE: Local storage operations for wallet data using FlutterSecureStorage
// ============================================================================

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Keys for secure storage
abstract class WalletStorageKeys {
  static const String mnemonic = 'wallet_mnemonic';
  static const String address = 'wallet_address';
  static const String isImported = 'wallet_is_imported';
  static const String createdAt = 'wallet_created_at';
}

/// Local datasource for wallet operations
@lazySingleton
class WalletLocalDatasource {
  WalletLocalDatasource(this._storage);

  final FlutterSecureStorage _storage;

  /// Store wallet data securely
  Future<void> storeWallet({
    required String mnemonic,
    required String address,
    required bool isImported,
  }) async {
    await _storage.write(key: WalletStorageKeys.mnemonic, value: mnemonic);
    await _storage.write(key: WalletStorageKeys.address, value: address);
    await _storage.write(
      key: WalletStorageKeys.isImported,
      value: isImported.toString(),
    );
    await _storage.write(
      key: WalletStorageKeys.createdAt,
      value: DateTime.now().toIso8601String(),
    );
  }

  /// Get stored mnemonic
  Future<String?> getMnemonic() async {
    return _storage.read(key: WalletStorageKeys.mnemonic);
  }

  /// Get stored address
  Future<String?> getAddress() async {
    return _storage.read(key: WalletStorageKeys.address);
  }

  /// Check if wallet is imported
  Future<bool> getIsImported() async {
    final value = await _storage.read(key: WalletStorageKeys.isImported);
    return value == 'true';
  }

  /// Get wallet creation date
  Future<DateTime?> getCreatedAt() async {
    final value = await _storage.read(key: WalletStorageKeys.createdAt);
    if (value == null) return null;
    return DateTime.tryParse(value);
  }

  /// Check if wallet exists
  Future<bool> hasWallet() async {
    final mnemonic = await _storage.read(key: WalletStorageKeys.mnemonic);
    return mnemonic != null && mnemonic.isNotEmpty;
  }

  /// Delete all wallet data
  Future<void> deleteWallet() async {
    await _storage.delete(key: WalletStorageKeys.mnemonic);
    await _storage.delete(key: WalletStorageKeys.address);
    await _storage.delete(key: WalletStorageKeys.isImported);
    await _storage.delete(key: WalletStorageKeys.createdAt);
  }
}

/// Module for registering FlutterSecureStorage
@module
abstract class SecureStorageModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(
          accessibility: KeychainAccessibility.first_unlock_this_device,
        ),
      );
}


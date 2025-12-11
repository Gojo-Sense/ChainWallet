// ============================================================================
// FILE: wallet_failure.dart
// PURPOSE: Wallet-specific failure types using Freezed union
// NOTE: Pure Dart - NO Flutter imports
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/failures.dart';

part 'wallet_failure.freezed.dart';

/// Wallet feature specific failures
@freezed
sealed class WalletFailure with _$WalletFailure implements Failure {
  const WalletFailure._();

  /// Failed to generate mnemonic
  const factory WalletFailure.mnemonicGeneration({
    @Default('Failed to generate seed phrase') String message,
  }) = MnemonicGenerationFailure;

  /// Invalid mnemonic provided
  const factory WalletFailure.invalidMnemonic({
    @Default('Invalid seed phrase') String message,
  }) = InvalidMnemonicFailure;

  /// Invalid private key format
  const factory WalletFailure.invalidPrivateKey({
    @Default('Invalid private key format') String message,
  }) = InvalidPrivateKeyFailure;

  /// Failed to store wallet securely
  const factory WalletFailure.storageError({
    @Default('Failed to store wallet securely') String message,
  }) = WalletStorageFailure;

  /// Wallet not found in storage
  const factory WalletFailure.walletNotFound({
    @Default('No wallet found') String message,
  }) = WalletNotFoundFailure;

  /// Wallet already exists
  const factory WalletFailure.walletExists({
    @Default('Wallet already exists') String message,
  }) = WalletExistsFailure;
}

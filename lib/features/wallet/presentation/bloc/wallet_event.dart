// ============================================================================
// FILE: wallet_event.dart
// PURPOSE: BLoC events for wallet feature using Freezed
// ============================================================================

part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  /// Check if wallet exists on app start
  const factory WalletEvent.checkWalletExists() = CheckWalletExists;

  /// Generate a new mnemonic for wallet creation
  const factory WalletEvent.generateMnemonic() = GenerateMnemonic;

  /// Create wallet from generated mnemonic
  const factory WalletEvent.createWallet(String mnemonic) = CreateWallet;

  /// Import wallet using private key
  const factory WalletEvent.importWallet(String privateKey) = ImportWallet;

  /// Load existing wallet
  const factory WalletEvent.loadWallet() = LoadWallet;

  /// Delete the wallet
  const factory WalletEvent.deleteWallet() = DeleteWallet;

  /// Copy mnemonic/address to clipboard
  const factory WalletEvent.copyToClipboard(String text) = CopyToClipboard;
}


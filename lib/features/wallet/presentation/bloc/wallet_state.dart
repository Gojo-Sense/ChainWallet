// ============================================================================
// FILE: wallet_state.dart
// PURPOSE: BLoC states for wallet feature using Freezed
// STATES: initial, loading, noWallet, mnemonicGenerated, walletLoaded, failure
// ============================================================================

part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const WalletState._();

  /// Initial state before any action
  const factory WalletState.initial() = WalletInitial;

  /// Loading state during async operations
  const factory WalletState.loading() = WalletLoading;

  /// No wallet exists - show landing page
  const factory WalletState.noWallet() = WalletNotExists;

  /// Mnemonic has been generated - show seed phrase page
  const factory WalletState.mnemonicGenerated(String mnemonic) =
      MnemonicGenerated;

  /// Wallet loaded successfully
  const factory WalletState.walletLoaded(WalletEntity wallet) = WalletLoaded;

  /// Wallet created successfully
  const factory WalletState.walletCreated(WalletEntity wallet) = WalletCreated;

  /// Wallet deleted
  const factory WalletState.walletDeleted() = WalletDeleted;

  /// Copied to clipboard
  const factory WalletState.copiedToClipboard() = CopiedToClipboard;

  /// Failure state with error message
  const factory WalletState.failure(WalletFailure failure) = WalletStateFailure;

  /// Helper to check if in loading state
  bool get isLoading => this is WalletLoading;
}


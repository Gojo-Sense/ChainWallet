// ============================================================================
// FILE: swap_event.dart
// PURPOSE: BLoC events for swap feature
// ============================================================================

part of 'swap_bloc.dart';

@freezed
class SwapEvent with _$SwapEvent {
  /// Load available tokens
  const factory SwapEvent.loadTokens() = LoadTokens;

  /// Select from token
  const factory SwapEvent.selectFromToken(SwapToken token) = SelectFromToken;

  /// Select to token
  const factory SwapEvent.selectToToken(SwapToken token) = SelectToToken;

  /// Update swap amount
  const factory SwapEvent.updateAmount(double amount) = UpdateAmount;

  /// Swap from/to tokens
  const factory SwapEvent.swapTokens() = SwapTokens;

  /// Get swap quote
  const factory SwapEvent.getQuote() = GetQuote;

  /// Execute swap
  const factory SwapEvent.executeSwap() = ExecuteSwap;

  /// Load swap history
  const factory SwapEvent.loadHistory() = LoadHistory;

  /// Clear current quote
  const factory SwapEvent.clearQuote() = ClearQuote;
}



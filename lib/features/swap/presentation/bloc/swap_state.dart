// ============================================================================
// FILE: swap_state.dart
// PURPOSE: BLoC state for swap feature
// ============================================================================

part of 'swap_bloc.dart';

@freezed
abstract class SwapState with _$SwapState {
  const SwapState._();

  const factory SwapState.initial({
    @Default([]) List<SwapToken> availableTokens,
    SwapToken? fromToken,
    SwapToken? toToken,
    @Default(0) double amount,
    SwapQuote? quote,
    SwapEntity? lastSwap,
    @Default([]) List<SwapEntity> swapHistory,
    @Default(false) bool isLoadingTokens,
    @Default(false) bool isLoadingQuote,
    @Default(false) bool isSwapping,
    @Default(false) bool isLoadingHistory,
    SwapFailure? failure,
  }) = _SwapState;

  bool get canSwap =>
      fromToken != null &&
      toToken != null &&
      amount > 0 &&
      quote != null &&
      !isSwapping &&
      !quote!.isExpired;

  bool get hasInsufficientBalance =>
      fromToken != null && amount > fromToken!.balance;

  double get estimatedOutput => quote?.toAmount ?? 0;

  String get formattedEstimatedOutput {
    if (quote == null) return '0';
    return '${quote!.toAmount.toStringAsFixed(6)} ${quote!.toToken.symbol}';
  }
}


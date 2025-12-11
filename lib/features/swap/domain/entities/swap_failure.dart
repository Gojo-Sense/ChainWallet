// ============================================================================
// FILE: swap_failure.dart
// PURPOSE: Failure types for swap feature
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'swap_failure.freezed.dart';

@freezed
abstract class SwapFailure with _$SwapFailure {
  const factory SwapFailure.insufficientBalance({
    @Default('Insufficient balance for this swap') String message,
  }) = InsufficientBalance;

  const factory SwapFailure.invalidAmount({
    @Default('Invalid swap amount') String message,
  }) = InvalidAmount;

  const factory SwapFailure.quoteFailed({
    @Default('Failed to get swap quote') String message,
  }) = QuoteFailed;

  const factory SwapFailure.swapFailed({
    @Default('Swap transaction failed') String message,
  }) = SwapFailed;

  const factory SwapFailure.quoteExpired({
    @Default('Swap quote has expired') String message,
  }) = QuoteExpired;

  const factory SwapFailure.networkError({
    @Default('Network error occurred') String message,
  }) = SwapNetworkError;

  const factory SwapFailure.slippageExceeded({
    @Default('Price slippage exceeded tolerance') String message,
  }) = SlippageExceeded;
}


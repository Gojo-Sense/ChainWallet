// ============================================================================
// FILE: market_failure.dart
// PURPOSE: Market-specific failure types using Freezed union
// NOTE: Pure Dart - NO Flutter imports
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/failures.dart';

part 'market_failure.freezed.dart';

/// Market feature specific failures
@freezed
sealed class MarketFailure with _$MarketFailure implements Failure {
  const MarketFailure._();

  /// Network request failed
  const factory MarketFailure.networkError({
    @Default('Failed to fetch market data') String message,
  }) = MarketNetworkFailure;

  /// API rate limit exceeded
  const factory MarketFailure.rateLimitExceeded({
    @Default('API rate limit exceeded. Please try again later.') String message,
  }) = RateLimitExceeded;

  /// Token not found
  const factory MarketFailure.tokenNotFound({
    @Default('Token not found') String message,
  }) = TokenNotFoundFailure;

  /// Invalid response from API
  const factory MarketFailure.invalidResponse({
    @Default('Invalid response from server') String message,
  }) = InvalidResponseFailure;

  /// Payment failed
  const factory MarketFailure.paymentFailed({
    @Default('Payment failed') String message,
  }) = PaymentFailure;

  /// Payment cancelled
  const factory MarketFailure.paymentCancelled({
    @Default('Payment was cancelled') String message,
  }) = PaymentCancelled;
}

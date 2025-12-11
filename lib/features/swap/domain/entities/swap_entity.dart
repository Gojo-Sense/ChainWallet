// ============================================================================
// FILE: swap_entity.dart
// PURPOSE: Domain entities for token swap feature
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'swap_entity.freezed.dart';

/// Represents a token that can be swapped
@freezed
abstract class SwapToken with _$SwapToken {
  const SwapToken._();

  const factory SwapToken({
    required String id,
    required String symbol,
    required String name,
    String? image,
    required double balance,
    required double priceUsd,
  }) = _SwapToken;

  String get formattedBalance {
    if (balance >= 1000000) {
      return '${(balance / 1000000).toStringAsFixed(2)}M';
    } else if (balance >= 1000) {
      return '${(balance / 1000).toStringAsFixed(2)}K';
    } else if (balance >= 1) {
      return balance.toStringAsFixed(4);
    } else {
      return balance.toStringAsFixed(8);
    }
  }

  double get valueUsd => balance * priceUsd;

  String get formattedValueUsd => '\$${valueUsd.toStringAsFixed(2)}';
}

/// Represents a swap transaction
@freezed
abstract class SwapEntity with _$SwapEntity {
  const SwapEntity._();

  const factory SwapEntity({
    required String id,
    required SwapToken fromToken,
    required SwapToken toToken,
    required double fromAmount,
    required double toAmount,
    required double exchangeRate,
    required double fee,
    required SwapStatus status,
    required DateTime createdAt,
    DateTime? completedAt,
    String? txHash,
  }) = _SwapEntity;

  double get totalCost => fromAmount * fromToken.priceUsd;
  double get totalReceived => toAmount * toToken.priceUsd;
  double get priceImpact => ((totalCost - totalReceived) / totalCost * 100).abs();

  String get formattedRate =>
      '1 ${fromToken.symbol} = ${exchangeRate.toStringAsFixed(6)} ${toToken.symbol}';
}

/// Swap transaction status
enum SwapStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled,
}

/// Quote for a potential swap
@freezed
abstract class SwapQuote with _$SwapQuote {
  const SwapQuote._();

  const factory SwapQuote({
    required SwapToken fromToken,
    required SwapToken toToken,
    required double fromAmount,
    required double toAmount,
    required double exchangeRate,
    required double fee,
    required double priceImpact,
    required double minimumReceived,
    required DateTime expiresAt,
  }) = _SwapQuote;

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  String get formattedRate =>
      '1 ${fromToken.symbol} = ${exchangeRate.toStringAsFixed(6)} ${toToken.symbol}';

  String get formattedFee => '\$${fee.toStringAsFixed(2)}';

  String get formattedPriceImpact => '${priceImpact.toStringAsFixed(2)}%';

  String get formattedMinReceived =>
      '${minimumReceived.toStringAsFixed(6)} ${toToken.symbol}';
}


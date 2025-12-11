// ============================================================================
// FILE: token_entity.dart
// PURPOSE: Token/Cryptocurrency entity for domain layer
// NOTE: Pure Dart - NO Flutter imports
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_entity.freezed.dart';

/// Represents a cryptocurrency token
@freezed
sealed class TokenEntity with _$TokenEntity {
  const TokenEntity._();

  const factory TokenEntity({
    required String id,
    required String symbol,
    required String name,
    required double currentPrice,
    required double priceChangePercentage24h,
    String? image,
    double? marketCap,
    double? volume24h,
    double? high24h,
    double? low24h,
  }) = _TokenEntity;

  /// Returns true if price is up in last 24h
  bool get isPositive => priceChangePercentage24h >= 0;

  /// Formatted price change with sign
  String get formattedPriceChange {
    final sign = isPositive ? '+' : '';
    return '$sign${priceChangePercentage24h.toStringAsFixed(2)}%';
  }

  /// Formatted current price
  String get formattedPrice {
    if (currentPrice >= 1000) {
      return '\$${(currentPrice / 1000).toStringAsFixed(2)}K';
    }
    if (currentPrice >= 1) {
      return '\$${currentPrice.toStringAsFixed(2)}';
    }
    return '\$${currentPrice.toStringAsFixed(6)}';
  }
}

/// Represents price chart data point
@freezed
sealed class PricePoint with _$PricePoint {
  const factory PricePoint({
    required DateTime timestamp,
    required double price,
  }) = _PricePoint;
}

/// Represents market chart data
@freezed
sealed class MarketChartEntity with _$MarketChartEntity {
  const MarketChartEntity._();

  const factory MarketChartEntity({
    required String tokenId,
    required List<PricePoint> prices,
    required DateTime startTime,
    required DateTime endTime,
  }) = _MarketChartEntity;

  /// Get min price in chart
  double get minPrice =>
      prices.map((p) => p.price).reduce((a, b) => a < b ? a : b);

  /// Get max price in chart
  double get maxPrice =>
      prices.map((p) => p.price).reduce((a, b) => a > b ? a : b);

  /// Check if overall trend is positive
  bool get isPositiveTrend {
    if (prices.length < 2) return true;
    return prices.last.price >= prices.first.price;
  }
}

/// Represents a candlestick (OHLC) data point
@freezed
sealed class CandlestickEntity with _$CandlestickEntity {
  const CandlestickEntity._();

  const factory CandlestickEntity({
    required DateTime timestamp,
    required double open,
    required double high,
    required double low,
    required double close,
    required double volume,
    required bool isClosed,
  }) = _CandlestickEntity;

  /// Returns true if candle is bullish (close > open)
  bool get isBullish => close > open;

  /// Returns true if candle is bearish (close < open)
  bool get isBearish => close < open;

  /// Get price change for the candle
  double get priceChange => close - open;

  /// Get price change percentage
  double get priceChangePercent => open != 0 ? (priceChange / open) * 100 : 0.0;
}

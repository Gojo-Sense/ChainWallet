// ============================================================================
// FILE: portfolio_entity.dart
// PURPOSE: Domain entities for portfolio analytics
// PATTERN: Freezed classes for immutability
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_entity.freezed.dart';

/// Portfolio summary with total value and breakdown
@freezed
sealed class Portfolio with _$Portfolio {
  const Portfolio._();

  const factory Portfolio({
    required double totalValue,
    required double totalPnL,
    required double pnLPercentage,
    required List<PortfolioAsset> assets,
    required List<PortfolioSnapshot> history,
  }) = _Portfolio;

  /// Get assets sorted by value (highest first)
  List<PortfolioAsset> get sortedByValue =>
      [...assets]..sort((a, b) => b.value.compareTo(a.value));

  /// Get top N assets
  List<PortfolioAsset> topAssets(int n) => sortedByValue.take(n).toList();

  /// Check if portfolio is in profit
  bool get isProfit => totalPnL >= 0;
}

/// Individual asset in the portfolio
@freezed
sealed class PortfolioAsset with _$PortfolioAsset {
  const PortfolioAsset._();

  const factory PortfolioAsset({
    required String id,
    required String symbol,
    required String name,
    required double amount,
    required double value,
    required double price,
    required double pnL,
    required double pnLPercentage,
    required double allocation,
    String? imageUrl,
  }) = _PortfolioAsset;

  /// Check if asset is in profit
  bool get isProfit => pnL >= 0;

  /// Formatted value string
  String get formattedValue => '\$${value.toStringAsFixed(2)}';

  /// Formatted allocation percentage
  String get formattedAllocation => '${(allocation * 100).toStringAsFixed(1)}%';
}

/// Historical snapshot for charts
@freezed
sealed class PortfolioSnapshot with _$PortfolioSnapshot {
  const PortfolioSnapshot._();

  const factory PortfolioSnapshot({
    required DateTime timestamp,
    required double value,
  }) = _PortfolioSnapshot;
}

/// Time range for analytics
enum PortfolioTimeRange {
  day('24H'),
  week('7D'),
  month('30D'),
  threeMonths('90D'),
  year('1Y'),
  all('ALL');

  final String label;
  const PortfolioTimeRange(this.label);
}



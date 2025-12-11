// ============================================================================
// FILE: token_chart.dart
// PURPOSE: Price chart widget using fl_chart with Aether Gradient styling
// DESIGN:
//   - Line Color: Cyan (positive) or Red/Pink (negative)
//   - Below Bar: Gradient fade to transparent
//   - NO Grid lines, NO Titles, NO Borders (Clean look)
// ============================================================================

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/token_entity.dart';

class TokenChart extends StatelessWidget {
  const TokenChart({
    super.key,
    required this.chart,
    this.height = 200,
  });

  final MarketChartEntity chart;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (chart.prices.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            'No chart data available',
            style: AetherTypography.bodyMedium,
          ),
        ),
      );
    }

    final isPositive = chart.isPositiveTrend;
    final primaryColor = isPositive ? AetherColors.cyan : AetherColors.error;
    final secondaryColor =
        isPositive ? AetherColors.purple : AetherColors.magenta;

    // Normalize prices to fit chart
    final minPrice = chart.minPrice;
    final maxPrice = chart.maxPrice;
    final priceRange = maxPrice - minPrice;
    final padding = priceRange * 0.1;

    final spots = chart.prices.asMap().entries.map((entry) {
      return FlSpot(
        entry.key.toDouble(),
        entry.value.price,
      );
    }).toList();

    return SizedBox(
      height: height,
      child: LineChart(
        LineChartData(
          // Remove all grid lines and borders
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),

          // Set y-axis range
          minY: minPrice - padding,
          maxY: maxPrice + padding,

          // Line touch behavior
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              fitInsideHorizontally: true,
              fitInsideVertically: true,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final price = spot.y;
                  return LineTooltipItem(
                    '\$${price.toStringAsFixed(2)}',
                    AetherTypography.labelMedium.copyWith(
                      color: AetherColors.textPrimary,
                    ),
                  );
                }).toList();
              },
            ),
            getTouchedSpotIndicator: (barData, spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  FlLine(
                    color: primaryColor.withOpacity(0.3),
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                  FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, bar, index) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: AetherColors.background,
                        strokeWidth: 2,
                        strokeColor: primaryColor,
                      );
                    },
                  ),
                );
              }).toList();
            },
          ),

          // Main line
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              curveSmoothness: 0.3,
              preventCurveOverShooting: true,
              gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
              ),
              barWidth: 2.5,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),

              // Below bar gradient fill
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor.withOpacity(0.3),
                    secondaryColor.withOpacity(0.1),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    );
  }
}

/// Chart time range selector
class ChartRangeSelector extends StatelessWidget {
  const ChartRangeSelector({
    super.key,
    required this.selectedDays,
    required this.onChanged,
  });

  final int selectedDays;
  final ValueChanged<int> onChanged;

  static const _ranges = [
    (1, '24H'),
    (7, '7D'),
    (30, '1M'),
    (90, '3M'),
    (365, '1Y'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _ranges.map((range) {
        final isSelected = range.$1 == selectedDays;
        return GestureDetector(
          onTap: () => onChanged(range.$1),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(
              horizontal: AetherSpacing.md,
              vertical: AetherSpacing.sm,
            ),
            decoration: BoxDecoration(
              gradient: isSelected ? AetherColors.aetherGradient : null,
              color: isSelected ? null : AetherColors.glassBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : AetherColors.glassBorder,
              ),
            ),
            child: Text(
              range.$2,
              style: AetherTypography.labelMedium.copyWith(
                color: isSelected
                    ? AetherColors.background
                    : AetherColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}


// ============================================================================
// FILE: portfolio_chart.dart
// PURPOSE: Line chart showing portfolio value history
// DESIGN: Aether Gradient with glass styling
// ============================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/portfolio_entity.dart';

class PortfolioChart extends StatelessWidget {
  final List<PortfolioSnapshot> history;
  final PortfolioTimeRange range;
  final double height;

  const PortfolioChart({
    super.key,
    required this.history,
    required this.range,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return SizedBox(
        height: height,
        child: const Center(
          child: Text(
            'No data available',
            style: TextStyle(color: Colors.white54),
          ),
        ),
      );
    }

    final spots = history.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.value);
    }).toList();

    final minY = history.map((s) => s.value).reduce(math.min) * 0.95;
    final maxY = history.map((s) => s.value).reduce(math.max) * 1.05;

    final isPositive = history.last.value >= history.first.value;
    final lineColor = isPositive ? AppColors.neonGreen : AppColors.error;

    return SizedBox(
      height: height,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: _getInterval(),
                getTitlesWidget: (value, meta) => _buildBottomTitle(value.toInt()),
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (history.length - 1).toDouble(),
          minY: minY,
          maxY: maxY,
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => AppColors.glassBg,
              tooltipBorder: BorderSide(color: AppColors.glassBorder),
              tooltipRoundedRadius: 12,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final snapshot = history[spot.x.toInt()];
                  return LineTooltipItem(
                    '\$${snapshot.value.toStringAsFixed(2)}\n',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: _formatDate(snapshot.timestamp),
                        style: TextStyle(
                          color: Colors.white.withAlpha(150),
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  );
                }).toList();
              },
            ),
            handleBuiltInTouches: true,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              curveSmoothness: 0.3,
              color: lineColor,
              barWidth: 2.5,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lineColor.withAlpha(80),
                    lineColor.withAlpha(20),
                    lineColor.withAlpha(0),
                  ],
                ),
              ),
              shadow: Shadow(
                color: lineColor.withAlpha(100),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ),
    );
  }

  double _getInterval() {
    final count = history.length;
    if (count <= 7) return 1;
    if (count <= 30) return 7;
    if (count <= 90) return 14;
    return 30;
  }

  Widget _buildBottomTitle(int index) {
    if (index < 0 || index >= history.length) {
      return const SizedBox.shrink();
    }

    final date = history[index].timestamp;
    String label;

    switch (range) {
      case PortfolioTimeRange.day:
        label = '${date.hour}:00';
        break;
      case PortfolioTimeRange.week:
      case PortfolioTimeRange.month:
        label = '${date.day}/${date.month}';
        break;
      case PortfolioTimeRange.threeMonths:
      case PortfolioTimeRange.year:
      case PortfolioTimeRange.all:
        label = '${_monthName(date.month)}';
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withAlpha(100),
          fontSize: 10,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day} ${_monthName(date.month)} ${date.year}';
  }

  String _monthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }
}



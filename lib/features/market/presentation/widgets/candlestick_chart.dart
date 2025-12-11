// ============================================================================
// FILE: candlestick_chart.dart
// PURPOSE: Live candlestick chart widget with real-time OHLC data
// DESIGN: Deep Glassmorphism with green/red candlesticks matching Aether theme
// ============================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/token_entity.dart';

class CandlestickChart extends StatefulWidget {
  const CandlestickChart({
    super.key,
    required this.candles,
    this.height = 300,
    this.onCandleTapped,
  });

  final List<CandlestickEntity> candles;
  final double height;
  final ValueChanged<CandlestickEntity>? onCandleTapped;

  @override
  State<CandlestickChart> createState() => _CandlestickChartState();
}

class _CandlestickChartState extends State<CandlestickChart> {
  CandlestickEntity? _selectedCandle;

  @override
  Widget build(BuildContext context) {
    if (widget.candles.isEmpty) {
      return SizedBox(
        height: widget.height,
        child: Center(
          child: Text(
            'No chart data available',
            style: AetherTypography.bodyMedium,
          ),
        ),
      );
    }

    return SizedBox(
      height: widget.height,
      child: GestureDetector(
        onTapDown: (details) {
          final renderBox = context.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            final localPosition = renderBox.globalToLocal(details.globalPosition);
            _handleTap(localPosition, renderBox.size);
          }
        },
        child: CustomPaint(
          painter: _CandlestickPainter(
            candles: widget.candles,
            selectedCandle: _selectedCandle,
            onCandleSelected: (candle) {
              setState(() {
                _selectedCandle = candle;
              });
              widget.onCandleTapped?.call(candle);
            },
          ),
          child: Container(),
        ),
      ),
    );
  }

  void _handleTap(Offset position, Size size) {
    if (widget.candles.isEmpty) return;

    final priceRange = _CandlestickPainter._calculatePriceRange(widget.candles);
    final padding = priceRange * 0.1;
    final minPrice = _CandlestickPainter._calculateMinPrice(widget.candles) - padding;
    final maxPrice = _CandlestickPainter._calculateMaxPrice(widget.candles) + padding;

    final candleSpacing = 2.0;
    final availableWidth = size.width - (widget.candles.length * candleSpacing);
    final candleWidth = math.max(2.0, availableWidth / widget.candles.length);

    for (int i = 0; i < widget.candles.length; i++) {
      final x = (i * (candleWidth + candleSpacing)) + (candleWidth / 2);
      final distance = (position.dx - x).abs();

      if (distance < candleWidth) {
        setState(() {
          _selectedCandle = widget.candles[i];
        });
        widget.onCandleTapped?.call(widget.candles[i]);
        break;
      }
    }
  }
}

class _CandlestickPainter extends CustomPainter {
  _CandlestickPainter({
    required this.candles,
    this.selectedCandle,
    this.onCandleSelected,
  });

  final List<CandlestickEntity> candles;
  final CandlestickEntity? selectedCandle;
  final ValueChanged<CandlestickEntity>? onCandleSelected;

  // Calculate price range
  double get _minPrice => _calculateMinPrice(candles);
  double get _maxPrice => _calculateMaxPrice(candles);

  static double _calculateMinPrice(List<CandlestickEntity> candles) {
    if (candles.isEmpty) return 0;
    return candles.map((c) => c.low).reduce(math.min);
  }

  static double _calculateMaxPrice(List<CandlestickEntity> candles) {
    if (candles.isEmpty) return 0;
    return candles.map((c) => c.high).reduce(math.max);
  }

  static double _calculatePriceRange(List<CandlestickEntity> candles) {
    return _calculateMaxPrice(candles) - _calculateMinPrice(candles);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (candles.isEmpty) return;

    final priceRange = _maxPrice - _minPrice;
    final padding = priceRange * 0.1;
    final minY = _minPrice - padding;
    final maxY = _maxPrice + padding;
    final priceHeight = maxY - minY;

    // Calculate candle width
    final candleSpacing = 2.0;
    final availableWidth = size.width - (candles.length * candleSpacing);
    final candleWidth = math.max(2.0, availableWidth / candles.length);

    // Draw candlesticks
    for (int i = 0; i < candles.length; i++) {
      final candle = candles[i];
      final x = (i * (candleWidth + candleSpacing)) + (candleWidth / 2);

      // Calculate Y positions
      final highY = size.height - ((candle.high - minY) / priceHeight * size.height);
      final lowY = size.height - ((candle.low - minY) / priceHeight * size.height);
      final openY = size.height - ((candle.open - minY) / priceHeight * size.height);
      final closeY = size.height - ((candle.close - minY) / priceHeight * size.height);

      final isBullish = candle.isBullish;
      final color = isBullish ? AetherColors.success : AetherColors.error;

      // Draw wick (high-low line)
      final wickPaint = Paint()
        ..color = color
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;

      canvas.drawLine(
        Offset(x, highY),
        Offset(x, lowY),
        wickPaint,
      );

      // Draw body (open-close rectangle)
      final bodyTop = math.min(openY, closeY);
      final bodyBottom = math.max(openY, closeY);
      final bodyHeight = bodyBottom - bodyTop;
      
      // Ensure minimum body height for visibility
      final minBodyHeight = 1.0;
      final actualBodyHeight = math.max(minBodyHeight, bodyHeight);
      final actualBodyTop = bodyTop - (actualBodyHeight - bodyHeight) / 2;

      final bodyPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      final bodyRect = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(x, (actualBodyTop + bodyBottom) / 2),
          width: candleWidth * 0.7,
          height: actualBodyHeight,
        ),
        const Radius.circular(1.0),
      );

      canvas.drawRRect(bodyRect, bodyPaint);

      // Draw outline for body
      final outlinePaint = Paint()
        ..color = color
        ..strokeWidth = 0.5
        ..style = PaintingStyle.stroke;

      canvas.drawRRect(bodyRect, outlinePaint);

      // Highlight selected candle
      if (selectedCandle == candle) {
        final highlightPaint = Paint()
          ..color = color.withOpacity(0.3)
          ..style = PaintingStyle.fill;

        canvas.drawCircle(
          Offset(x, (highY + lowY) / 2),
          candleWidth * 0.8,
          highlightPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CandlestickPainter oldDelegate) {
    return candles != oldDelegate.candles ||
        selectedCandle != oldDelegate.selectedCandle;
  }

  @override
  bool hitTest(Offset position) {
    // Handle tap detection - this is called by the gesture detector
    return true;
  }
}

/// Interval selector for candlestick charts
class ChartIntervalSelector extends StatelessWidget {
  const ChartIntervalSelector({
    super.key,
    required this.selectedInterval,
    required this.onChanged,
  });

  final String selectedInterval;
  final ValueChanged<String> onChanged;

  static const _intervals = [
    ('1m', '1m'),
    ('5m', '5m'),
    ('15m', '15m'),
    ('1h', '1h'),
    ('4h', '4h'),
    ('1d', '1d'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _intervals.map((interval) {
        final isSelected = interval.$1 == selectedInterval;
        return GestureDetector(
          onTap: () => onChanged(interval.$1),
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
              interval.$2,
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

/// Chart type toggle (Line / Candlestick)
class ChartTypeToggle extends StatelessWidget {
  const ChartTypeToggle({
    super.key,
    required this.isCandlestick,
    required this.onChanged,
  });

  final bool isCandlestick;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AetherColors.glassBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AetherColors.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleButton(
            label: 'Line',
            isSelected: !isCandlestick,
            onTap: () => onChanged(false),
          ),
          _buildToggleButton(
            label: 'Candle',
            isSelected: isCandlestick,
            onTap: () => onChanged(true),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AetherSpacing.md,
          vertical: AetherSpacing.sm,
        ),
        decoration: BoxDecoration(
          gradient: isSelected ? AetherColors.aetherGradient : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: AetherTypography.labelMedium.copyWith(
            color: isSelected
                ? AetherColors.background
                : AetherColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}


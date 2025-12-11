// ============================================================================
// FILE: portfolio_pie_chart.dart
// PURPOSE: Animated pie chart for portfolio allocation
// DESIGN: Deep Glassmorphism with neon glow effects
// ============================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/portfolio_entity.dart';

class PortfolioPieChart extends StatefulWidget {
  final List<PortfolioAsset> assets;
  final double size;

  const PortfolioPieChart({
    super.key,
    required this.assets,
    this.size = 200,
  });

  @override
  State<PortfolioPieChart> createState() => _PortfolioPieChartState();
}

class _PortfolioPieChartState extends State<PortfolioPieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int? _selectedIndex;

  static const List<Color> _chartColors = [
    Color(0xFF00F0FF), // Cyan
    Color(0xFF7CFF00), // Neon Green
    Color(0xFF7000FF), // Purple
    Color(0xFFFF00FF), // Magenta
    Color(0xFFFFE600), // Yellow
    Color(0xFFFF3399), // Pink
    Color(0xFF00FF94), // Mint
    Color(0xFFFFAA00), // Orange
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pie Chart
        SizedBox(
          width: widget.size,
          height: widget.size,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _PieChartPainter(
                  assets: widget.assets,
                  colors: _chartColors,
                  progress: _controller.value,
                  selectedIndex: _selectedIndex,
                ),
                child: GestureDetector(
                  onTapDown: (details) => _handleTap(details.localPosition),
                ),
              );
            },
          ),
        )
            .animate()
            .scale(begin: const Offset(0.8, 0.8), duration: 600.ms, curve: Curves.easeOutBack),

        const SizedBox(height: 24),

        // Legend
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: widget.assets.asMap().entries.map((entry) {
            final index = entry.key;
            final asset = entry.value;
            final color = _chartColors[index % _chartColors.length];
            final isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = isSelected ? null : index;
              }),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 12 : 8,
                  vertical: isSelected ? 8 : 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? color.withAlpha(40) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected
                      ? Border.all(color: color.withAlpha(100))
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: color.withAlpha(100),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${asset.symbol} ${asset.formattedAllocation}',
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            )
                .animate(delay: (100 * index).ms)
                .fadeIn()
                .slideX(begin: -0.2, end: 0);
          }).toList(),
        ),
      ],
    );
  }

  void _handleTap(Offset position) {
    final center = Offset(widget.size / 2, widget.size / 2);
    final distance = (position - center).distance;
    final outerRadius = widget.size / 2;
    final innerRadius = outerRadius * 0.6;

    if (distance < innerRadius || distance > outerRadius) {
      setState(() => _selectedIndex = null);
      return;
    }

    final angle = math.atan2(position.dy - center.dy, position.dx - center.dx);
    var normalizedAngle = angle + math.pi / 2;
    if (normalizedAngle < 0) normalizedAngle += 2 * math.pi;

    var currentAngle = 0.0;
    for (int i = 0; i < widget.assets.length; i++) {
      final sweepAngle = widget.assets[i].allocation * 2 * math.pi;
      if (normalizedAngle >= currentAngle && normalizedAngle < currentAngle + sweepAngle) {
        setState(() => _selectedIndex = _selectedIndex == i ? null : i);
        return;
      }
      currentAngle += sweepAngle;
    }
  }
}

class _PieChartPainter extends CustomPainter {
  final List<PortfolioAsset> assets;
  final List<Color> colors;
  final double progress;
  final int? selectedIndex;

  _PieChartPainter({
    required this.assets,
    required this.colors,
    required this.progress,
    this.selectedIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius * 0.6;

    var startAngle = -math.pi / 2;

    for (int i = 0; i < assets.length; i++) {
      final asset = assets[i];
      final color = colors[i % colors.length];
      final sweepAngle = asset.allocation * 2 * math.pi * progress;
      final isSelected = selectedIndex == i;

      // Draw segment
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = color;

      final path = Path();
      final segmentCenter = isSelected ? _offsetCenter(center, startAngle + sweepAngle / 2, 8) : center;
      final adjustedOuterRadius = isSelected ? outerRadius + 4 : outerRadius;

      path.moveTo(
        segmentCenter.dx + innerRadius * math.cos(startAngle),
        segmentCenter.dy + innerRadius * math.sin(startAngle),
      );

      path.arcTo(
        Rect.fromCircle(center: segmentCenter, radius: adjustedOuterRadius),
        startAngle,
        sweepAngle,
        false,
      );

      path.arcTo(
        Rect.fromCircle(center: segmentCenter, radius: innerRadius),
        startAngle + sweepAngle,
        -sweepAngle,
        false,
      );

      path.close();

      // Draw glow for selected segment
      if (isSelected) {
        final glowPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = color.withAlpha(60)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);
        canvas.drawPath(path, glowPaint);
      }

      canvas.drawPath(path, paint);

      // Draw segment border
      final borderPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? 2 : 1
        ..color = Colors.white.withAlpha(isSelected ? 80 : 30);
      canvas.drawPath(path, borderPaint);

      startAngle += sweepAngle;
    }

    // Draw center circle (donut hole)
    final centerPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = AppColors.abyss;
    canvas.drawCircle(center, innerRadius - 2, centerPaint);

    // Draw center border
    final centerBorderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.white.withAlpha(20);
    canvas.drawCircle(center, innerRadius - 2, centerBorderPaint);
  }

  Offset _offsetCenter(Offset center, double angle, double distance) {
    return Offset(
      center.dx + distance * math.cos(angle),
      center.dy + distance * math.sin(angle),
    );
  }

  @override
  bool shouldRepaint(covariant _PieChartPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        selectedIndex != oldDelegate.selectedIndex;
  }
}



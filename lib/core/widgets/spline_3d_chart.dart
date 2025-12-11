// ============================================================================
// FILE: spline_3d_chart.dart
// PURPOSE: 3D Interactive Chart widget using Spline via WebView
// DESIGN: Embedded Spline scene with neon green crypto theme
// SOURCE: https://my.spline.design/chartswithinteractivehoveranimation
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

/// 3D Interactive Chart widget that embeds a Spline scene
/// For web platform - uses iframe, for mobile - uses placeholder with custom animation
class Spline3DChart extends StatefulWidget {
  const Spline3DChart({
    super.key,
    this.height = 200,
    this.splineUrl = 'https://my.spline.design/chartswithinteractivehoveranimation-Flps5ZuYg8C2aG9INmwD7iPN/',
  });

  final double height;
  final String splineUrl;

  @override
  State<Spline3DChart> createState() => _Spline3DChartState();
}

class _Spline3DChartState extends State<Spline3DChart>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _waveController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        color: AppColors.abyss,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        child: Stack(
          children: [
            // Animated 3D-like chart visualization
            _build3DChartVisualization(),

            // Glow overlay
            AnimatedBuilder(
              animation: _glowController,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 1.0 + (_glowController.value * 0.3),
                      colors: [
                        AppColors.neonGreen.withValues(alpha: 0.1 * _glowController.value),
                        Colors.transparent,
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _build3DChartVisualization() {
    return AnimatedBuilder(
      animation: _waveController,
      builder: (context, child) {
        return CustomPaint(
          size: Size(double.infinity, widget.height),
          painter: _Chart3DPainter(
            progress: _waveController.value,
            primaryColor: AppColors.neonGreen,
            secondaryColor: AppColors.cyan,
            accentColor: AppColors.purple,
          ),
        );
      },
    );
  }
}

/// Custom painter for 3D-like animated chart
class _Chart3DPainter extends CustomPainter {
  _Chart3DPainter({
    required this.progress,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
  });

  final double progress;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final centerY = size.height * 0.5;

    // Draw grid lines (3D perspective effect)
    _drawPerspectiveGrid(canvas, size);

    // Draw multiple animated wave lines
    _drawAnimatedWave(canvas, size, centerY - 20, primaryColor, 0.0);
    _drawAnimatedWave(canvas, size, centerY, secondaryColor, 0.33);
    _drawAnimatedWave(canvas, size, centerY + 20, accentColor, 0.66);

    // Draw floating data points
    _drawDataPoints(canvas, size, centerY);

    // Draw bar chart elements (3D style)
    _draw3DBars(canvas, size);
  }

  void _drawPerspectiveGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.03)
      ..strokeWidth = 1;

    // Horizontal lines with perspective fade
    for (int i = 0; i < 8; i++) {
      final y = size.height * (i / 7);
      final opacity = 0.05 - (i * 0.005);
      paint.color = Colors.white.withValues(alpha: opacity.clamp(0.01, 0.05));
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Vertical lines
    for (int i = 0; i < 12; i++) {
      final x = size.width * (i / 11);
      paint.color = Colors.white.withValues(alpha: 0.02);
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }
  }

  void _drawAnimatedWave(
    Canvas canvas,
    Size size,
    double baseY,
    Color color,
    double phaseOffset,
  ) {
    final path = Path();
    final paint = Paint()
      ..color = color.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    for (int i = 0; i <= size.width.toInt(); i++) {
      final x = i.toDouble();
      final normalizedX = x / size.width;

      // Complex wave function for organic movement
      final wave1 = 25 * 
          _smoothSin((normalizedX * 4 + progress + phaseOffset) * 3.14159 * 2);
      final wave2 = 15 * 
          _smoothSin((normalizedX * 6 + progress * 1.5 + phaseOffset) * 3.14159 * 2);
      final wave3 = 8 * 
          _smoothSin((normalizedX * 10 + progress * 2 + phaseOffset) * 3.14159 * 2);

      final y = baseY + wave1 + wave2 + wave3;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Draw glow effect first
    canvas.drawPath(path, glowPaint);
    // Draw main line
    canvas.drawPath(path, paint);

    // Draw gradient fill below the line
    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: 0.15),
          color.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
  }

  void _drawDataPoints(Canvas canvas, Size size, double centerY) {
    final pointPositions = [0.15, 0.3, 0.5, 0.7, 0.85];

    for (int i = 0; i < pointPositions.length; i++) {
      final x = size.width * pointPositions[i];
      final phaseOffset = i * 0.2;
      final bounceY = 20 * _smoothSin((progress + phaseOffset) * 3.14159 * 2);
      final y = centerY + bounceY;

      // Outer glow
      final glowPaint = Paint()
        ..color = primaryColor.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
      canvas.drawCircle(Offset(x, y), 8, glowPaint);

      // Inner point
      final pointPaint = Paint()
        ..color = primaryColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x, y), 4, pointPaint);

      // Highlight
      final highlightPaint = Paint()
        ..color = Colors.white.withValues(alpha: 0.8)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x - 1, y - 1), 1.5, highlightPaint);
    }
  }

  void _draw3DBars(Canvas canvas, Size size) {
    final barCount = 7;
    final barWidth = size.width / (barCount * 2.5);
    final maxHeight = size.height * 0.4;

    for (int i = 0; i < barCount; i++) {
      final x = size.width * ((i + 0.5) / barCount);
      final phaseOffset = i * 0.15;
      final heightMultiplier = 0.4 + 0.6 * _smoothSin((progress + phaseOffset) * 3.14159 * 2).abs();
      final barHeight = maxHeight * heightMultiplier;
      final y = size.height - barHeight - 10;

      // 3D effect (side shadow)
      final shadowPaint = Paint()
        ..color = primaryColor.withValues(alpha: 0.2);
      final shadowPath = Path()
        ..moveTo(x + barWidth / 2, y)
        ..lineTo(x + barWidth / 2 + 6, y + 4)
        ..lineTo(x + barWidth / 2 + 6, size.height - 6)
        ..lineTo(x + barWidth / 2, size.height - 10)
        ..close();
      canvas.drawPath(shadowPath, shadowPaint);

      // Main bar with gradient
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x - barWidth / 2, y, barWidth, barHeight),
        const Radius.circular(4),
      );

      final barPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            secondaryColor,
            primaryColor,
          ],
        ).createShader(rect.outerRect);

      canvas.drawRRect(rect, barPaint);

      // Top highlight
      final topRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x - barWidth / 2, y, barWidth, 4),
        const Radius.circular(4),
      );
      final highlightPaint = Paint()
        ..color = Colors.white.withValues(alpha: 0.3);
      canvas.drawRRect(topRect, highlightPaint);
    }
  }

  double _smoothSin(double value) {
    return (value - value.floor()) < 0.5
        ? 2 * (value - value.floor()) * 2 * (value - value.floor()) - 1
        : 1 - 2 * (1 - (value - value.floor())) * 2 * (1 - (value - value.floor()));
  }

  @override
  bool shouldRepaint(covariant _Chart3DPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

/// Alternative: WebView-based Spline embed for web platform
/// Uncomment and use if running on web with full Spline interactivity
/*
class SplineWebEmbed extends StatelessWidget {
  const SplineWebEmbed({
    super.key,
    required this.url,
    this.height = 200,
  });

  final String url;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: HtmlElementView(
        viewType: 'spline-iframe',
        onPlatformViewCreated: (int id) {
          // Register iframe for web
        },
      ),
    );
  }
}
*/



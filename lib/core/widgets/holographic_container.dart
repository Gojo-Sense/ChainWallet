// ============================================================================
// FILE: holographic_container.dart
// PURPOSE: Holographic/iridescent border effects and scanner overlays
// ============================================================================

import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

/// A container with animated holographic/iridescent border effect
class HolographicContainer extends StatefulWidget {
  const HolographicContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.borderWidth = 2.0,
    this.animationDuration = const Duration(seconds: 3),
    this.enableAnimation = true,
    this.padding,
    this.backgroundColor,
    this.blur = 0,
  });

  final Widget child;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final Duration animationDuration;
  final bool enableAnimation;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double blur;

  @override
  State<HolographicContainer> createState() => _HolographicContainerState();
}

class _HolographicContainerState extends State<HolographicContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    if (widget.enableAnimation) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = widget.borderRadius ?? AppSpacing.borderRadiusXl;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _HolographicBorderPainter(
            progress: _controller.value,
            borderRadius: effectiveBorderRadius,
            borderWidth: widget.borderWidth,
          ),
          child: child,
        );
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: EdgeInsets.all(widget.borderWidth),
        child: ClipRRect(
          borderRadius: effectiveBorderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: widget.blur,
              sigmaY: widget.blur,
            ),
            child: Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: effectiveBorderRadius,
                color: widget.backgroundColor ?? AppColors.darkGlass,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class _HolographicBorderPainter extends CustomPainter {
  _HolographicBorderPainter({
    required this.progress,
    required this.borderRadius,
    required this.borderWidth,
  });

  final double progress;
  final BorderRadius borderRadius;
  final double borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = borderRadius.toRRect(rect);

    // Create holographic gradient that rotates
    final gradient = SweepGradient(
      center: Alignment.center,
      startAngle: 0,
      endAngle: math.pi * 2,
      transform: GradientRotation(progress * math.pi * 2),
      colors: const [
        AppColors.neonGreen,
        AppColors.neonMagenta,
        AppColors.neonYellow,
        AppColors.mintNeon,
        AppColors.neonGreen,
      ],
      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _HolographicBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

/// A scanline effect widget for the QR scanner
class ScanlineEffect extends StatefulWidget {
  const ScanlineEffect({
    super.key,
    required this.child,
    this.scanlineColor = AppColors.neonGreen,
    this.scanlineHeight = 3.0,
    this.duration = const Duration(seconds: 2),
    this.isActive = true,
  });

  final Widget child;
  final Color scanlineColor;
  final double scanlineHeight;
  final Duration duration;
  final bool isActive;

  @override
  State<ScanlineEffect> createState() => _ScanlineEffectState();
}

class _ScanlineEffectState extends State<ScanlineEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isActive) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(ScanlineEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.isActive)
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  heightFactor: _animation.value,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: widget.scanlineHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            widget.scanlineColor.withValues(alpha: 0.0),
                            widget.scanlineColor,
                            widget.scanlineColor.withValues(alpha: 0.0),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: widget.scanlineColor.withValues(alpha: 0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

/// Corner brackets for scanner overlay
class ScannerCorners extends StatelessWidget {
  const ScannerCorners({
    super.key,
    required this.size,
    this.cornerLength = 30,
    this.cornerWidth = 4,
    this.color = AppColors.neonGreen,
    this.borderRadius = 12,
  });

  final double size;
  final double cornerLength;
  final double cornerWidth;
  final Color color;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ScannerCornersPainter(
          cornerLength: cornerLength,
          cornerWidth: cornerWidth,
          color: color,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class _ScannerCornersPainter extends CustomPainter {
  _ScannerCornersPainter({
    required this.cornerLength,
    required this.cornerWidth,
    required this.color,
    required this.borderRadius,
  });

  final double cornerLength;
  final double cornerWidth;
  final Color color;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = cornerWidth
      ..strokeCap = StrokeCap.round;

    // Top-left corner
    _drawCorner(canvas, paint, 0, 0, 1, 1);

    // Top-right corner
    _drawCorner(canvas, paint, size.width, 0, -1, 1);

    // Bottom-left corner
    _drawCorner(canvas, paint, 0, size.height, 1, -1);

    // Bottom-right corner
    _drawCorner(canvas, paint, size.width, size.height, -1, -1);
  }

  void _drawCorner(
      Canvas canvas, Paint paint, double x, double y, int dx, int dy) {
    final path = Path();

    // Horizontal line
    path.moveTo(x, y + (dy * cornerWidth / 2));
    path.lineTo(x + (dx * cornerLength), y + (dy * cornerWidth / 2));

    // Vertical line
    path.moveTo(x + (dx * cornerWidth / 2), y);
    path.lineTo(x + (dx * cornerWidth / 2), y + (dy * cornerLength));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}



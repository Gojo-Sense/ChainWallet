// ============================================================================
// FILE: avatar_3d.dart
// PURPOSE: 3D-style avatar widget with glowing ring effect
// DESIGN: Animated gradient ring with Dicebear avatar
// ============================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// 3D-style avatar with animated glowing ring
class Avatar3D extends StatefulWidget {
  const Avatar3D({
    super.key,
    this.size = 50,
    this.seed = 'aether',
    this.style = AvatarStyle.notionists,
    this.enableGlow = true,
    this.enableRingAnimation = true,
    this.ringWidth = 3,
    this.onTap,
  });

  final double size;
  final String seed;
  final AvatarStyle style;
  final bool enableGlow;
  final bool enableRingAnimation;
  final double ringWidth;
  final VoidCallback? onTap;

  @override
  State<Avatar3D> createState() => _Avatar3DState();
}

class _Avatar3DState extends State<Avatar3D>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    if (widget.enableRingAnimation) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get _avatarUrl {
    final styleStr = widget.style.name;
    return 'https://api.dicebear.com/7.x/$styleStr/png?seed=${widget.seed}&backgroundColor=transparent&size=${widget.size.toInt() * 2}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: widget.enableGlow
              ? [
                  BoxShadow(
                    color: AppColors.neonGreen.withValues(alpha: 0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: AppColors.cyan.withValues(alpha: 0.2),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ]
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Animated gradient ring
            if (widget.enableRingAnimation)
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(widget.size, widget.size),
                    painter: _GradientRingPainter(
                      progress: _controller.value,
                      strokeWidth: widget.ringWidth,
                    ),
                  );
                },
              )
            else
              Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      AppColors.neonGreen,
                      AppColors.cyan,
                      AppColors.purple,
                      AppColors.neonMagenta,
                      AppColors.neonGreen,
                    ],
                  ),
                ),
              ),

            // Inner circle with avatar
            Container(
              width: widget.size - (widget.ringWidth * 2),
              height: widget.size - (widget.ringWidth * 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.charcoal,
                border: Border.all(
                  color: AppColors.abyss,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  _avatarUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildFallbackAvatar(),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _buildLoadingAvatar();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFallbackAvatar() {
    return Container(
      color: AppColors.slate,
      child: Center(
        child: Text(
          '👤',
          style: TextStyle(fontSize: widget.size * 0.4),
        ),
      ),
    );
  }

  Widget _buildLoadingAvatar() {
    return Container(
      color: AppColors.slate,
      child: Center(
        child: SizedBox(
          width: widget.size * 0.3,
          height: widget.size * 0.3,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(AppColors.neonGreen),
          ),
        ),
      ),
    );
  }
}

class _GradientRingPainter extends CustomPainter {
  _GradientRingPainter({
    required this.progress,
    required this.strokeWidth,
  });

  final double progress;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: math.pi * 2,
      transform: GradientRotation(progress * math.pi * 2),
      colors: const [
        AppColors.neonGreen,
        AppColors.cyan,
        AppColors.purple,
        AppColors.neonMagenta,
        AppColors.neonYellow,
        AppColors.neonGreen,
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientRingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

/// Available avatar styles from Dicebear
enum AvatarStyle {
  notionists,
  funEmoji,
  lorelei,
  micah,
  adventurer,
  avataaars,
  bigEars,
  bigSmile,
  bottts,
  croodles,
  thumbs,
  openPeeps,
  personas,
  pixelArt,
}

/// 3D Emoji widget for displaying large emoji icons
class Emoji3D extends StatelessWidget {
  const Emoji3D({
    super.key,
    required this.emoji,
    this.size = 40,
    this.enableShadow = true,
  });

  final String emoji;
  final double size;
  final bool enableShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: enableShadow
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            )
          : null,
      child: Text(
        emoji,
        style: TextStyle(
          fontSize: size,
          height: 1,
        ),
      ),
    );
  }
}

/// 3D Icon badge with emoji and background
class IconBadge3D extends StatelessWidget {
  const IconBadge3D({
    super.key,
    required this.emoji,
    this.size = 48,
    this.backgroundColor,
    this.enableGlow = true,
  });

  final String emoji;
  final double size;
  final Color? backgroundColor;
  final bool enableGlow;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.neonGreen;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(size * 0.3),
        boxShadow: enableGlow
            ? [
                BoxShadow(
                  color: bgColor.withValues(alpha: 0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          emoji,
          style: TextStyle(fontSize: size * 0.5),
        ),
      ),
    );
  }
}



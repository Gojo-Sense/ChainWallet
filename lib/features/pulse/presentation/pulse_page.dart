// ============================================================================
// FILE: pulse_page.dart
// PURPOSE: Pulse Pay - NFC/Proximity payment with pulse animation
// DESIGN: Ripple animation, peer discovery, slide-to-send
// ============================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/neon_button.dart';

class PulsePage extends StatefulWidget {
  const PulsePage({super.key});

  @override
  State<PulsePage> createState() => _PulsePageState();
}

class _PulsePageState extends State<PulsePage> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  bool _isSearching = true;
  bool _peerFound = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _rotationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    // Simulate peer discovery
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _peerFound = true;
          _isSearching = false;
        });
        HapticFeedback.heavyImpact();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: Stack(
        children: [
          // Animated background
          _buildAnimatedBackground(),

          SafeArea(
            child: Column(
              children: [
                // App Bar
                _buildAppBar()
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: -0.2, end: 0, duration: 400.ms),

                const Spacer(),

                // Pulse Animation
                _buildPulseAnimation()
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1.0, 1.0),
                      duration: 600.ms,
                      curve: Curves.easeOutBack,
                    ),

                AppSpacing.gapV48,

                // Status Text
                _buildStatusText()
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 400.ms),

                const Spacer(),

                // Action Section
                if (_peerFound) _buildSlideToSend(),

                if (!_peerFound)
                  _buildSimulatePeerButton()
                      .animate()
                      .fadeIn(delay: 600.ms, duration: 400.ms)
                      .slideY(begin: 0.2, end: 0, duration: 400.ms),

                AppSpacing.gapV48,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return AnimatedBuilder(
      animation: _rotationController,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: _BackgroundPainter(
            rotation: _rotationController.value * math.pi * 2,
            color: AppColors.neonGreen,
          ),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlassContainer(
            blur: 10,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.textPrimary,
                size: 22,
              ),
            ),
          ),
          Text(
            'Pulse Pay',
            style: AppTypography.headlineMedium,
          ),
          GlassContainer(
            blur: 10,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              HapticFeedback.lightImpact();
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.info_outline_rounded,
                color: AppColors.textPrimary,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPulseAnimation() {
    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Ripple effects
          ...List.generate(3, (index) {
            return AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                final delay = index * 0.33;
                final progress = (_pulseController.value + delay) % 1.0;
                final scale = 0.5 + (progress * 0.8);
                final opacity = (1.0 - progress) * (_isSearching ? 0.5 : 0.3);

                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: (_peerFound ? AppColors.neonGreen : AppColors.neonMagenta)
                            .withValues(alpha: opacity),
                        width: 2,
                      ),
                    ),
                  ),
                );
              },
            );
          }),

          // Center circle
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  (_peerFound ? AppColors.neonGreen : AppColors.neonMagenta)
                      .withValues(alpha: 0.3),
                  (_peerFound ? AppColors.neonGreen : AppColors.neonMagenta)
                      .withValues(alpha: 0.1),
                  Colors.transparent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: (_peerFound ? AppColors.neonGreen : AppColors.neonMagenta)
                      .withValues(alpha: 0.4),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _peerFound ? AppColors.neonGreen : AppColors.glassWhite,
                  boxShadow: [
                    BoxShadow(
                      color: (_peerFound ? AppColors.neonGreen : AppColors.neonMagenta)
                          .withValues(alpha: 0.5),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Icon(
                  _peerFound ? Icons.check_rounded : Icons.nfc_rounded,
                  color: _peerFound ? AppColors.abyss : AppColors.neonMagenta,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusText() {
    return Column(
      children: [
        Text(
          _peerFound ? 'Peer Found!' : 'Searching for Peers',
          style: AppTypography.headlineLarge.copyWith(
            color: _peerFound ? AppColors.neonGreen : AppColors.textPrimary,
          ),
        ),
        AppSpacing.gapV8,
        Text(
          _peerFound
              ? 'Device: iPhone 15 Pro\nDistance: ~2m'
              : 'Hold your device close to another\nAether Wallet user',
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSlideToSend() {
    return Padding(
      padding: AppSpacing.screenPaddingHorizontal,
      child: GlassCard(
        blur: 20,
        opacity: 0.1,
        borderColor: AppColors.neonGreen.withValues(alpha: 0.3),
        padding: const EdgeInsets.all(8),
        child: _SlideToSendButton(
          onSlideComplete: () {
            HapticFeedback.heavyImpact();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Transaction sent!',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                backgroundColor: AppColors.darkGlass,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      )
          .animate()
          .fadeIn(duration: 500.ms)
          .slideY(begin: 0.3, end: 0, duration: 500.ms),
    );
  }

  Widget _buildSimulatePeerButton() {
    return Padding(
      padding: AppSpacing.screenPaddingHorizontal,
      child: NeonOutlineButton(
        onPressed: () {
          setState(() {
            _peerFound = true;
            _isSearching = false;
          });
          HapticFeedback.heavyImpact();
        },
        label: 'Simulate Peer Discovery',
        icon: Icons.bluetooth_searching_rounded,
        color: AppColors.neonMagenta,
      ),
    );
  }
}

/// Slide to Send button widget
class _SlideToSendButton extends StatefulWidget {
  const _SlideToSendButton({
    required this.onSlideComplete,
  });

  final VoidCallback onSlideComplete;

  @override
  State<_SlideToSendButton> createState() => _SlideToSendButtonState();
}

class _SlideToSendButtonState extends State<_SlideToSendButton> {
  double _dragPosition = 0;
  bool _isDragging = false;
  bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxDrag = constraints.maxWidth - 60;

        return Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: AppColors.glassWhite,
          ),
          child: Stack(
            children: [
              // Background text
              Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isComplete ? 0 : 1,
                  child: Text(
                    'Slide to Send \$100',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),

              // Sliding button
              AnimatedPositioned(
                duration: _isDragging ? Duration.zero : const Duration(milliseconds: 200),
                left: _dragPosition,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onHorizontalDragStart: (_) {
                    setState(() => _isDragging = true);
                  },
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _dragPosition = (_dragPosition + details.delta.dx)
                          .clamp(0, maxDrag);
                    });
                  },
                  onHorizontalDragEnd: (_) {
                    setState(() => _isDragging = false);
                    
                    if (_dragPosition >= maxDrag * 0.8) {
                      setState(() {
                        _isComplete = true;
                        _dragPosition = maxDrag;
                      });
                      widget.onSlideComplete();
                    } else {
                      setState(() => _dragPosition = 0);
                    }
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.neonGreen,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.neonGreen.withValues(alpha: 0.5),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Icon(
                      _isComplete ? Icons.check_rounded : Icons.arrow_forward_rounded,
                      color: AppColors.abyss,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Background painter for animated gradient
class _BackgroundPainter extends CustomPainter {
  _BackgroundPainter({
    required this.rotation,
    required this.color,
  });

  final double rotation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.8;

    final gradient = SweepGradient(
      center: Alignment.center,
      startAngle: rotation,
      endAngle: rotation + math.pi * 2,
      colors: [
        color.withValues(alpha: 0.02),
        color.withValues(alpha: 0.05),
        color.withValues(alpha: 0.02),
        Colors.transparent,
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      );

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) {
    return oldDelegate.rotation != rotation;
  }
}



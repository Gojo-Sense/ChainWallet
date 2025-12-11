// ============================================================================
// FILE: neon_button.dart
// PURPOSE: Neon-glowing buttons with haptic feedback
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_typography.dart';

/// Primary gradient button with neon glow
class NeonButton extends StatefulWidget {
  const NeonButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.color = AppColors.neonGreen,
    this.textColor,
    this.width,
    this.height = AppSpacing.buttonHeight,
    this.isLoading = false,
    this.isDisabled = false,
    this.enableHaptic = true,
    this.borderRadius,
    this.glowIntensity = 1.0,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final Color color;
  final Color? textColor;
  final double? width;
  final double height;
  final bool isLoading;
  final bool isDisabled;
  final bool enableHaptic;
  final BorderRadius? borderRadius;
  final double glowIntensity;

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _glowAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.isDisabled && !widget.isLoading) {
      _controller.forward();
      if (widget.enableHaptic) {
        HapticFeedback.lightImpact();
      }
    }
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveTextColor =
        widget.textColor ?? _getContrastColor(widget.color);
    final isActive = !widget.isDisabled && !widget.isLoading;
    final effectiveBorderRadius =
        widget.borderRadius ?? AppSpacing.borderRadiusFull;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.width ?? double.infinity,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: effectiveBorderRadius,
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: widget.color.withValues(
                          alpha: 0.4 * widget.glowIntensity * _glowAnimation.value,
                        ),
                        blurRadius: 20 * _glowAnimation.value,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: widget.color.withValues(
                          alpha: 0.2 * widget.glowIntensity * _glowAnimation.value,
                        ),
                        blurRadius: 40 * _glowAnimation.value,
                        spreadRadius: 0,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : null,
            ),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isActive ? widget.onPressed : null,
            borderRadius: effectiveBorderRadius,
            splashColor: Colors.white.withValues(alpha: 0.2),
            child: Ink(
              decoration: BoxDecoration(
                color: widget.isDisabled
                    ? widget.color.withValues(alpha: 0.3)
                    : widget.color,
                borderRadius: effectiveBorderRadius,
              ),
              child: Center(
                child: widget.isLoading
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(effectiveTextColor),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.icon != null) ...[
                            Icon(
                              widget.icon,
                              color: effectiveTextColor,
                              size: AppSpacing.iconMd,
                            ),
                            AppSpacing.gapH8,
                          ],
                          Text(
                            widget.label,
                            style: AppTypography.buttonText.copyWith(
                              color: effectiveTextColor,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getContrastColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? AppColors.abyss : AppColors.textPrimary;
  }
}

/// Outlined variant of NeonButton
class NeonOutlineButton extends StatefulWidget {
  const NeonOutlineButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.color = AppColors.neonGreen,
    this.width,
    this.height = AppSpacing.buttonHeight,
    this.isLoading = false,
    this.isDisabled = false,
    this.enableHaptic = true,
    this.borderRadius,
    this.borderWidth = 1.5,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final Color color;
  final double? width;
  final double height;
  final bool isLoading;
  final bool isDisabled;
  final bool enableHaptic;
  final BorderRadius? borderRadius;
  final double borderWidth;

  @override
  State<NeonOutlineButton> createState() => _NeonOutlineButtonState();
}

class _NeonOutlineButtonState extends State<NeonOutlineButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.isDisabled && !widget.isLoading) {
      _controller.forward();
      if (widget.enableHaptic) {
        HapticFeedback.lightImpact();
      }
    }
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final isActive = !widget.isDisabled && !widget.isLoading;
    final effectiveBorderRadius =
        widget.borderRadius ?? AppSpacing.borderRadiusFull;
    final effectiveColor =
        widget.isDisabled ? widget.color.withValues(alpha: 0.3) : widget.color;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isActive ? widget.onPressed : null,
            borderRadius: effectiveBorderRadius,
            splashColor: widget.color.withValues(alpha: 0.1),
            child: Container(
              width: widget.width ?? double.infinity,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: effectiveBorderRadius,
                border: Border.all(
                  color: effectiveColor,
                  width: widget.borderWidth,
                ),
              ),
              child: Center(
                child: widget.isLoading
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(effectiveColor),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.icon != null) ...[
                            Icon(
                              widget.icon,
                              color: effectiveColor,
                              size: AppSpacing.iconMd,
                            ),
                            AppSpacing.gapH8,
                          ],
                          Text(
                            widget.label,
                            style: AppTypography.buttonText.copyWith(
                              color: effectiveColor,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Icon-only neon button
class NeonIconButton extends StatefulWidget {
  const NeonIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color = AppColors.neonGreen,
    this.backgroundColor,
    this.size = 48,
    this.iconSize,
    this.enableHaptic = true,
    this.enableGlow = true,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color color;
  final Color? backgroundColor;
  final double size;
  final double? iconSize;
  final bool enableHaptic;
  final bool enableGlow;

  @override
  State<NeonIconButton> createState() => _NeonIconButtonState();
}

class _NeonIconButtonState extends State<NeonIconButton> {
  void _handleTap() {
    if (widget.enableHaptic) {
      HapticFeedback.lightImpact();
    }
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundColor ?? widget.color,
        boxShadow: widget.enableGlow
            ? [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.4),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          customBorder: const CircleBorder(),
          splashColor: Colors.white.withValues(alpha: 0.2),
          child: Center(
            child: Icon(
              widget.icon,
              color: widget.backgroundColor != null
                  ? widget.color
                  : _getContrastColor(widget.color),
              size: widget.iconSize ?? widget.size * 0.5,
            ),
          ),
        ),
      ),
    );
  }

  Color _getContrastColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? AppColors.abyss : AppColors.textPrimary;
  }
}



// ============================================================================
// FILE: glass_card.dart
// PURPOSE: Glassmorphism card widgets with blur effect and neon accents
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

/// A beautiful glassmorphism card widget with blur effect
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.blur = 20.0,
    this.opacity = 0.1,
    this.borderRadius,
    this.padding,
    this.margin,
    this.borderColor,
    this.borderWidth = 1.0,
    this.gradient,
    this.shadows,
    this.width,
    this.height,
    this.onTap,
    this.enableGlow = false,
    this.glowColor,
  });

  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double borderWidth;
  final Gradient? gradient;
  final List<BoxShadow>? shadows;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool enableGlow;
  final Color? glowColor;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? AppSpacing.borderRadiusXl;
    final effectiveShadows = shadows ??
        (enableGlow
            ? AppColors.neonGlow(
                color: glowColor ?? AppColors.neonGreen,
                blur: 30,
              )
            : AppColors.cardShadow);

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: effectiveBorderRadius,
        boxShadow: effectiveShadows,
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: effectiveBorderRadius,
              splashColor: AppColors.neonGreen.withValues(alpha: 0.1),
              highlightColor: AppColors.glassWhite,
              child: Container(
                padding: padding ?? AppSpacing.cardPadding,
                decoration: BoxDecoration(
                  borderRadius: effectiveBorderRadius,
                  gradient: gradient ?? _defaultGradient(opacity),
                  border: Border.all(
                    color: borderColor ?? AppColors.glassBorder,
                    width: borderWidth,
                  ),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient _defaultGradient(double opacity) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withValues(alpha: opacity),
        Colors.white.withValues(alpha: opacity * 0.5),
      ],
    );
  }
}

/// A variant of GlassCard with a neon border effect
class NeonGlassCard extends StatelessWidget {
  const NeonGlassCard({
    super.key,
    required this.child,
    this.neonColor = AppColors.neonGreen,
    this.blur = 20.0,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.glowIntensity = 0.5,
  });

  final Widget child;
  final Color neonColor;
  final double blur;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final double glowIntensity;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: borderRadius,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      onTap: onTap,
      blur: blur,
      borderColor: neonColor.withValues(alpha: 0.5),
      borderWidth: 1.5,
      enableGlow: true,
      glowColor: neonColor,
      shadows: [
        BoxShadow(
          color: neonColor.withValues(alpha: glowIntensity * 0.3),
          blurRadius: 20,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: neonColor.withValues(alpha: glowIntensity * 0.15),
          blurRadius: 40,
          spreadRadius: 0,
        ),
      ],
      child: child,
    );
  }
}

/// A simple glass container without interaction
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.08,
    this.borderRadius,
    this.padding,
    this.margin,
    this.border,
    this.width,
    this.height,
    this.onTap,
  });

  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? AppSpacing.borderRadiusMd;

    Widget container = ClipRRect(
      borderRadius: effectiveBorderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: effectiveBorderRadius,
            color: Colors.white.withValues(alpha: opacity),
            border: border ??
                Border.all(
                  color: AppColors.glassBorder,
                  width: 0.5,
                ),
          ),
          child: child,
        ),
      ),
    );

    if (onTap != null) {
      container = GestureDetector(onTap: onTap, child: container);
    }

    if (margin != null) {
      container = Padding(padding: margin!, child: container);
    }

    return container;
  }
}

/// Glass card with gradient border (Aether style)
class GlassContainerGradient extends StatelessWidget {
  const GlassContainerGradient({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.borderWidth = 2.0,
    this.onTap,
    this.gradient,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final VoidCallback? onTap;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius ?? AppSpacing.borderRadiusXl;

    Widget container = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: effectiveRadius,
        gradient: gradient ?? AppColors.neonGreenGradient,
      ),
      child: Container(
        margin: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          color: AppColors.abyss,
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusXl - borderWidth,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusXl - borderWidth,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: padding ?? AppSpacing.cardPadding,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );

    if (onTap != null) {
      container = GestureDetector(onTap: onTap, child: container);
    }

    return container;
  }
}



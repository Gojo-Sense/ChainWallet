// ============================================================================
// FILE: app_spacing.dart
// PURPOSE: Aether Wallet Spacing System - 4px grid
// ============================================================================

import 'package:flutter/material.dart';

abstract class AppSpacing {
  // ═══════════════════════════════════════════════════════════════════════════
  // BASE SPACING UNITS
  // ═══════════════════════════════════════════════════════════════════════════
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double huge = 48.0;
  static const double massive = 64.0;

  // ═══════════════════════════════════════════════════════════════════════════
  // SCREEN PADDING
  // ═══════════════════════════════════════════════════════════════════════════
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: xl,
  );

  static const EdgeInsets screenPaddingHorizontal = EdgeInsets.symmetric(
    horizontal: lg,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // CARD PADDING
  // ═══════════════════════════════════════════════════════════════════════════
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets cardPaddingLarge = EdgeInsets.all(xl);
  static const EdgeInsets cardPaddingSmall = EdgeInsets.all(md);

  // ═══════════════════════════════════════════════════════════════════════════
  // BUTTON PADDING
  // ═══════════════════════════════════════════════════════════════════════════
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: xxl,
    vertical: lg,
  );

  static const EdgeInsets buttonPaddingSmall = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: sm,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // BORDER RADIUS
  // ═══════════════════════════════════════════════════════════════════════════
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 20.0;
  static const double radiusXxl = 24.0;
  static const double radiusFull = 999.0;
  static const double glassRadius = 20.0;
  static const double glassBlur = 10.0;

  static BorderRadius get borderRadiusSm => BorderRadius.circular(radiusSm);
  static BorderRadius get borderRadiusMd => BorderRadius.circular(radiusMd);
  static BorderRadius get borderRadiusLg => BorderRadius.circular(radiusLg);
  static BorderRadius get borderRadiusXl => BorderRadius.circular(radiusXl);
  static BorderRadius get borderRadiusXxl => BorderRadius.circular(radiusXxl);
  static BorderRadius get borderRadiusFull => BorderRadius.circular(radiusFull);

  // ═══════════════════════════════════════════════════════════════════════════
  // GAP WIDGETS (SizedBox shortcuts)
  // ═══════════════════════════════════════════════════════════════════════════
  static const SizedBox gapH4 = SizedBox(width: xs);
  static const SizedBox gapH8 = SizedBox(width: sm);
  static const SizedBox gapH12 = SizedBox(width: md);
  static const SizedBox gapH16 = SizedBox(width: lg);
  static const SizedBox gapH20 = SizedBox(width: xl);
  static const SizedBox gapH24 = SizedBox(width: xxl);
  static const SizedBox gapH32 = SizedBox(width: xxxl);

  static const SizedBox gapV4 = SizedBox(height: xs);
  static const SizedBox gapV8 = SizedBox(height: sm);
  static const SizedBox gapV12 = SizedBox(height: md);
  static const SizedBox gapV16 = SizedBox(height: lg);
  static const SizedBox gapV20 = SizedBox(height: xl);
  static const SizedBox gapV24 = SizedBox(height: xxl);
  static const SizedBox gapV32 = SizedBox(height: xxxl);
  static const SizedBox gapV48 = SizedBox(height: huge);
  static const SizedBox gapV64 = SizedBox(height: massive);

  // ═══════════════════════════════════════════════════════════════════════════
  // ICON SIZES
  // ═══════════════════════════════════════════════════════════════════════════
  static const double iconSm = 16.0;
  static const double iconMd = 20.0;
  static const double iconLg = 24.0;
  static const double iconXl = 32.0;
  static const double iconXxl = 48.0;

  // ═══════════════════════════════════════════════════════════════════════════
  // COMPONENT SIZES
  // ═══════════════════════════════════════════════════════════════════════════
  static const double buttonHeight = 56.0;
  static const double buttonHeightSmall = 44.0;
  static const double chipHeight = 32.0;
  static const double avatarSm = 32.0;
  static const double avatarMd = 40.0;
  static const double avatarLg = 56.0;
  static const double avatarXl = 72.0;
  static const double navBarHeight = 80.0;
  static const double cardMinHeight = 120.0;
}



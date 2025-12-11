// ============================================================================
// FILE: app_theme.dart
// PURPOSE: Deep Glassmorphism theme system for AetherWallet
// DESIGN SPEC:
//   - Background: Pure Black (#000000)
//   - Glass: white @ 5% opacity with blur(10,10)
//   - Border: white @ 10% opacity
//   - Aether Gradient: Cyan (#00F0FF) → Purple (#7000FF)
//   - Typography: Inter font family
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Core color constants for Deep Glassmorphism design
abstract class AetherColors {
  // ══════════════════════════════════════════════════════════════════════════
  // BACKGROUNDS
  // ══════════════════════════════════════════════════════════════════════════
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF0A0A0A);
  static const Color surfaceVariant = Color(0xFF121212);

  // ══════════════════════════════════════════════════════════════════════════
  // AETHER GRADIENT COLORS
  // ══════════════════════════════════════════════════════════════════════════
  static const Color cyan = Color(0xFF00F0FF);
  static const Color purple = Color(0xFF7000FF);
  static const Color magenta = Color(0xFFFF00FF);

  // ══════════════════════════════════════════════════════════════════════════
  // GLASS EFFECT COLORS
  // ══════════════════════════════════════════════════════════════════════════
  static Color get glassBackground => Colors.white.withOpacity(0.05);
  static Color get glassBorder => Colors.white.withOpacity(0.1);
  static Color get glassHighlight => Colors.white.withOpacity(0.15);

  // ══════════════════════════════════════════════════════════════════════════
  // TEXT COLORS
  // ══════════════════════════════════════════════════════════════════════════
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textTertiary = Color(0xFF707070);
  static const Color textMuted = Color(0xFF505050);

  // ══════════════════════════════════════════════════════════════════════════
  // STATUS COLORS
  // ══════════════════════════════════════════════════════════════════════════
  static const Color success = Color(0xFF00FF88);
  static const Color error = Color(0xFFFF4466);
  static const Color warning = Color(0xFFFFAA00);

  // ══════════════════════════════════════════════════════════════════════════
  // GRADIENTS
  // ══════════════════════════════════════════════════════════════════════════
  static const LinearGradient aetherGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cyan, purple],
  );

  static const LinearGradient aetherGradientVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [cyan, purple],
  );

  static LinearGradient get aetherGradientFade => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          cyan.withOpacity(0.3),
          purple.withOpacity(0.1),
          Colors.transparent,
        ],
      );

  static const LinearGradient negativeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [error, magenta],
  );
}

/// Typography system using Inter font
abstract class AetherTypography {
  static const String _fontFamily = 'Inter';

  // ══════════════════════════════════════════════════════════════════════════
  // DISPLAY STYLES
  // ══════════════════════════════════════════════════════════════════════════
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AetherColors.textPrimary,
    height: 1.1,
    letterSpacing: -1.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AetherColors.textPrimary,
    height: 1.2,
    letterSpacing: -1.0,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AetherColors.textPrimary,
    height: 1.2,
  );

  // ══════════════════════════════════════════════════════════════════════════
  // HEADING STYLES
  // ══════════════════════════════════════════════════════════════════════════
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AetherColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AetherColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AetherColors.textPrimary,
    height: 1.4,
  );

  // ══════════════════════════════════════════════════════════════════════════
  // BODY STYLES
  // ══════════════════════════════════════════════════════════════════════════
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AetherColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AetherColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AetherColors.textTertiary,
    height: 1.5,
  );

  // ══════════════════════════════════════════════════════════════════════════
  // LABEL STYLES
  // ══════════════════════════════════════════════════════════════════════════
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AetherColors.textPrimary,
    height: 1.4,
    letterSpacing: 0.5,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AetherColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AetherColors.textTertiary,
    height: 1.4,
  );

  // ══════════════════════════════════════════════════════════════════════════
  // SPECIAL STYLES
  // ══════════════════════════════════════════════════════════════════════════
  static const TextStyle balance = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 42,
    fontWeight: FontWeight.w700,
    color: AetherColors.textPrimary,
    height: 1.1,
    letterSpacing: -1.5,
  );

  static const TextStyle seedWord = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AetherColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0.5,
  );
}

/// Spacing constants
abstract class AetherSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double huge = 48.0;

  static const double glassRadius = 20.0;
  static const double glassBlur = 10.0;

  static const EdgeInsets screenPadding = EdgeInsets.all(lg);
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
}

/// Main theme configuration
class AetherTheme {
  AetherTheme._();

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AetherColors.background,
      primaryColor: AetherColors.cyan,
      fontFamily: 'Inter',
      colorScheme: const ColorScheme.dark(
        primary: AetherColors.cyan,
        secondary: AetherColors.purple,
        surface: AetherColors.surface,
        error: AetherColors.error,
        onPrimary: AetherColors.background,
        onSecondary: AetherColors.textPrimary,
        onSurface: AetherColors.textPrimary,
      ),
      textTheme: const TextTheme(
        displayLarge: AetherTypography.displayLarge,
        displayMedium: AetherTypography.displayMedium,
        displaySmall: AetherTypography.displaySmall,
        headlineLarge: AetherTypography.headlineLarge,
        headlineMedium: AetherTypography.headlineMedium,
        headlineSmall: AetherTypography.headlineSmall,
        bodyLarge: AetherTypography.bodyLarge,
        bodyMedium: AetherTypography.bodyMedium,
        bodySmall: AetherTypography.bodySmall,
        labelLarge: AetherTypography.labelLarge,
        labelMedium: AetherTypography.labelMedium,
        labelSmall: AetherTypography.labelSmall,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AetherColors.cyan,
          foregroundColor: AetherColors.background,
          elevation: 0,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AetherSpacing.glassRadius),
          ),
          textStyle: AetherTypography.button,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AetherColors.glassBackground,
        contentPadding: AetherSpacing.cardPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AetherSpacing.glassRadius),
          borderSide: BorderSide(color: AetherColors.glassBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AetherSpacing.glassRadius),
          borderSide: BorderSide(color: AetherColors.glassBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AetherSpacing.glassRadius),
          borderSide: const BorderSide(color: AetherColors.cyan, width: 2),
        ),
        hintStyle: AetherTypography.bodyMedium.copyWith(
          color: AetherColors.textMuted,
        ),
      ),
    );
  }

  static SystemUiOverlayStyle get systemOverlay {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AetherColors.background,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }
}

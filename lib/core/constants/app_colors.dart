// ============================================================================
// FILE: app_colors.dart
// PURPOSE: Aether Wallet Color Palette - Deep Glassmorphism with Neon Accents
// DESIGN: OLED optimized blacks with Neon Green primary accent
// ============================================================================

import 'package:flutter/material.dart';

abstract class AppColors {
  // ═══════════════════════════════════════════════════════════════════════════
  // PRIMARY BACKGROUNDS - OLED Optimized Blacks
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color abyss = Color(0xFF000000);
  static const Color obsidian = Color(0xFF0A0A0A);
  static const Color charcoal = Color(0xFF121212);
  static const Color slate = Color(0xFF1A1A1A);
  static const Color graphite = Color(0xFF232323);
  static const Color darkGlass = Color(0xFF1E1E24);

  // ═══════════════════════════════════════════════════════════════════════════
  // NEON ACCENT - Electric Green (Primary Brand Color)
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color neonGreen = Color(0xFF7CFF00);
  static const Color limeGlow = Color(0xFFAAFF00);
  static const Color mintNeon = Color(0xFF00FF94);
  static const Color greenShade100 = Color(0xFF1A3D00);
  static const Color greenShade200 = Color(0xFF2D5A00);
  static const Color greenShade300 = Color(0xFF4A8500);

  // ═══════════════════════════════════════════════════════════════════════════
  // SECONDARY ACCENT - Magenta/Pink
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color neonMagenta = Color(0xFFFF00FF);
  static const Color electricPink = Color(0xFFFF3399);
  static const Color fuschiaPulse = Color(0xFFEA00FF);
  static const Color softPink = Color(0xFFFF66B2);

  // ═══════════════════════════════════════════════════════════════════════════
  // TERTIARY ACCENT - Electric Yellow
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color neonYellow = Color(0xFFFFE600);
  static const Color goldGlow = Color(0xFFFFD700);
  static const Color amberPulse = Color(0xFFFFAA00);

  // ═══════════════════════════════════════════════════════════════════════════
  // AETHER GRADIENT (Cyan → Purple for buttons/charts)
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color cyan = Color(0xFF00F0FF);
  static const Color purple = Color(0xFF7000FF);

  // Aliases for backward compatibility
  static const Color neonCyan = cyan;
  static const Color neonPurple = purple;
  static const Color background = abyss;
  static Color get glassBg => glassOverlay;

  // ═══════════════════════════════════════════════════════════════════════════
  // GLASS EFFECTS
  // ═══════════════════════════════════════════════════════════════════════════
  static Color get glassWhite => Colors.white.withValues(alpha: 0.1);
  static Color get glassBorder => Colors.white.withValues(alpha: 0.1);
  static Color get glassHighlight => Colors.white.withValues(alpha: 0.15);
  static Color get glassDark => Colors.black.withValues(alpha: 0.2);
  static Color get glassOverlay => Colors.white.withValues(alpha: 0.05);

  // ═══════════════════════════════════════════════════════════════════════════
  // TEXT COLORS
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textTertiary = Color(0xFF808080);
  static const Color textMuted = Color(0xFF4D4D4D);

  // ═══════════════════════════════════════════════════════════════════════════
  // STATUS COLORS
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color success = Color(0xFF00FF94);
  static const Color warning = Color(0xFFFFAA00);
  static const Color error = Color(0xFFFF4444);
  static const Color info = Color(0xFF00BFFF);

  // ═══════════════════════════════════════════════════════════════════════════
  // GRADIENTS
  // ═══════════════════════════════════════════════════════════════════════════
  static const LinearGradient neonGreenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [neonGreen, limeGlow],
  );

  static const LinearGradient aetherGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cyan, purple],
  );

  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x1AFFFFFF),
      Color(0x0DFFFFFF),
    ],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [charcoal, abyss],
  );

  static const LinearGradient holographicGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [neonGreen, neonMagenta, neonYellow, neonGreen],
    stops: [0.0, 0.33, 0.66, 1.0],
  );

  static const RadialGradient pulseGradient = RadialGradient(
    center: Alignment.center,
    radius: 1.0,
    colors: [
      Color(0x807CFF00),
      Color(0x407CFF00),
      Color(0x007CFF00),
    ],
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // SHADOWS
  // ═══════════════════════════════════════════════════════════════════════════
  static List<BoxShadow> neonGlow({
    Color color = neonGreen,
    double blur = 20,
    double spread = 0,
  }) {
    return [
      BoxShadow(
        color: color.withValues(alpha: 0.6),
        blurRadius: blur,
        spreadRadius: spread,
      ),
      BoxShadow(
        color: color.withValues(alpha: 0.3),
        blurRadius: blur * 2,
        spreadRadius: spread,
      ),
    ];
  }

  static List<BoxShadow> get subtleGlow => [
        BoxShadow(
          color: neonGreen.withValues(alpha: 0.15),
          blurRadius: 30,
          spreadRadius: 0,
          offset: const Offset(0, 10),
        ),
      ];

  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: abyss.withValues(alpha: 0.5),
          blurRadius: 20,
          spreadRadius: 0,
          offset: const Offset(0, 10),
        ),
      ];
}


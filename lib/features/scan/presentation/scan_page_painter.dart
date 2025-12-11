// ============================================================================
// FILE: scan_page_painter.dart
// PURPOSE: Custom painter for scanner overlay with transparent center
// ============================================================================

import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Painter that creates a dark overlay with transparent center for scanner
class ScannerOverlayPainter extends CustomPainter {
  final double cutoutSize;
  final Size screenSize;

  ScannerOverlayPainter({
    required this.cutoutSize,
    required this.screenSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final cutoutLeft = (size.width - cutoutSize) / 2;
    final cutoutTop = (size.height - cutoutSize) / 2;
    final cutoutRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(cutoutLeft, cutoutTop, cutoutSize, cutoutSize),
      const Radius.circular(24),
    );

    final cutoutPath = Path()
      ..addRRect(cutoutRect);

    final overlayPath = Path.combine(
      PathOperation.difference,
      path,
      cutoutPath,
    );

    canvas.drawPath(overlayPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


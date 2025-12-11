// ============================================================================
// FILE: scan_page.dart
// PURPOSE: Smart QR Scanner with holographic overlay and live camera feed
// DESIGN: Holographic border, scanline animation, neon green accents
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/holographic_container.dart';
import 'scan_page_painter.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late MobileScannerController _scannerController;
  bool _isScanning = true;
  bool _flashEnabled = false;
  String? _scannedCode;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    
    // Initialize camera scanner
    _scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _scannerController.dispose();
    super.dispose();
  }

  void _handleQRCode(BarcodeCapture barcodeCapture) {
    if (barcodeCapture.barcodes.isEmpty) return;
    final String? code = barcodeCapture.barcodes.first.rawValue;
    if (code != null && code != _scannedCode) {
      setState(() {
        _scannedCode = code;
        _isScanning = false;
      });
      
      HapticFeedback.mediumImpact();
      
      // Stop scanning
      _scannerController.stop();
      
      // Show result and handle the QR code
      _showQRResult(code);
    }
  }

  void _showQRResult(String code) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.glassBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.glassBorder),
        ),
        title: Row(
          children: [
            Icon(Icons.qr_code_scanner, color: AppColors.neonGreen),
            const SizedBox(width: 12),
            const Text('QR Code Detected'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.abyss,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: SelectableText(
                code,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'What would you like to do?',
              style: AppTypography.bodyMedium,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resumeScanning();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _processQRCode(code);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neonGreen,
              foregroundColor: AppColors.abyss,
            ),
            child: const Text('Process'),
          ),
        ],
      ),
    );
  }

  void _processQRCode(String code) {
    // Handle different QR code types
    if (code.startsWith('ethereum:') || code.startsWith('0x')) {
      // Ethereum address
      context.push('/wallet?address=$code');
    } else if (code.startsWith('bitcoin:')) {
      // Bitcoin address
      context.push('/wallet?address=$code');
    } else {
      // Generic QR code - copy to clipboard
      Clipboard.setData(ClipboardData(text: code));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('QR code copied to clipboard'),
          backgroundColor: AppColors.neonGreen,
        ),
      );
    }
    _resumeScanning();
  }

  void _resumeScanning() {
    setState(() {
      _isScanning = true;
      _scannedCode = null;
    });
    _scannerController.start();
  }

  void _toggleFlash() {
    setState(() {
      _flashEnabled = !_flashEnabled;
    });
    _scannerController.toggleTorch();
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scannerSize = screenSize.width * 0.7;

    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [
                  AppColors.neonGreen.withValues(alpha: 0.05),
                  AppColors.abyss,
                ],
              ),
            ),
          ),

          // Camera Preview
          Positioned.fill(
            child: MobileScanner(
              controller: _scannerController,
              onDetect: _handleQRCode,
            ),
          ),

          // Dark overlay with transparent center
          Positioned.fill(
            child: CustomPaint(
              painter: ScannerOverlayPainter(
                cutoutSize: scannerSize,
                screenSize: screenSize,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // App Bar
                _buildAppBar()
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: -0.2, end: 0, duration: 400.ms),

                const Spacer(),

                // Scanner Container with overlay
                _buildScannerOverlay(scannerSize)
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 500.ms)
                    .scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1.0, 1.0),
                      duration: 500.ms,
                      curve: Curves.easeOutBack,
                    ),

                AppSpacing.gapV32,

                // Instructions
                _buildInstructions()
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 400.ms),

                const Spacer(),

                // Action Buttons
                _buildActionButtons()
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 400.ms)
                    .slideY(begin: 0.2, end: 0, duration: 400.ms),

                AppSpacing.gapV32,
              ],
            ),
          ),
        ],
      ),
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
            'Smart Scanner',
            style: AppTypography.headlineMedium,
          ),
          GlassContainer(
            blur: 10,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(12),
            onTap: _toggleFlash,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                _flashEnabled ? Icons.flash_on_rounded : Icons.flash_off_rounded,
                color: _flashEnabled ? AppColors.neonGreen : AppColors.textPrimary,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerOverlay(double size) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Holographic border
          HolographicContainer(
            width: size,
            height: size,
            borderRadius: BorderRadius.circular(24),
            borderWidth: 3,
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            child: Container(),
          ),

          // Scanner corners
          Positioned.fill(
            child: ScannerCorners(
              size: size,
              cornerLength: 40,
              cornerWidth: 4,
              color: AppColors.neonGreen,
            ),
          ),

          // Scanline effect
          if (_isScanning)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: ScanlineEffect(
                  scanlineColor: AppColors.neonGreen,
                  scanlineHeight: 3,
                  duration: const Duration(seconds: 2),
                  isActive: _isScanning,
                  child: Container(),
                ),
              ),
            ),

          // Center icon
          Center(
            child: AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.glassWhite,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neonGreen.withValues(
                          alpha: 0.3 + (_pulseController.value * 0.2),
                        ),
                        blurRadius: 20 + (_pulseController.value * 10),
                        spreadRadius: _pulseController.value * 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.qr_code_rounded,
                    color: AppColors.neonGreen,
                    size: 40,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions() {
    return Column(
      children: [
        Text(
          'Align QR code within frame',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        AppSpacing.gapV8,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isScanning ? AppColors.neonGreen : AppColors.textMuted,
                boxShadow: _isScanning
                    ? [
                        BoxShadow(
                          color: AppColors.neonGreen.withValues(alpha: 0.5),
                          blurRadius: 8,
                        ),
                      ]
                    : null,
              ),
            ),
            AppSpacing.gapH8,
            Text(
              _isScanning ? 'Scanning...' : 'Paused',
              style: AppTypography.labelMedium.copyWith(
                color: _isScanning ? AppColors.neonGreen : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: AppSpacing.screenPaddingHorizontal,
      child: Row(
        children: [
          Expanded(
            child: GlassCard(
              blur: 15,
              opacity: 0.08,
              padding: const EdgeInsets.symmetric(vertical: 16),
              onTap: () {
                HapticFeedback.lightImpact();
              },
              child: Column(
                children: [
                  const Icon(
                    Icons.photo_library_rounded,
                    color: AppColors.textPrimary,
                    size: 28,
                  ),
                  AppSpacing.gapV8,
                  Text(
                    'Gallery',
                    style: AppTypography.labelMedium,
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.gapH16,
          Expanded(
            child: GlassCard(
              blur: 15,
              opacity: 0.08,
              padding: const EdgeInsets.symmetric(vertical: 16),
              onTap: () {
                HapticFeedback.lightImpact();
              },
              child: Column(
                children: [
                  const Icon(
                    Icons.qr_code_2_rounded,
                    color: AppColors.neonGreen,
                    size: 28,
                  ),
                  AppSpacing.gapV8,
                  Text(
                    'My QR',
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.neonGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// ============================================================================
// FILE: lock_screen.dart
// PURPOSE: Biometric lock screen with animated fingerprint
// DESIGN: Deep Glassmorphism with pulsing neon effects
// ============================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/biometric_service.dart';
import '../../../../core/services/lock_service.dart';
import '../../../../core/constants/app_colors.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> with TickerProviderStateMixin {
  final BiometricService _biometricService = getIt<BiometricService>();
  final LockService _lockService = getIt<LockService>();
  
  bool _isAuthenticating = false;
  bool _authFailed = false;
  String _errorMessage = '';
  String _biometricType = 'Biometric';
  bool _biometricsEnabled = false;
  
  late AnimationController _pulseController;
  late AnimationController _ringController;

  @override
  void initState() {
    super.initState();
    
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    
    _ringController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    
    _initBiometrics();
  }

  Future<void> _initBiometrics() async {
    // Check if biometrics are enabled
    final enabled = await _lockService.isBiometricsEnabled();
    setState(() {
      _biometricsEnabled = enabled;
    });
    
    if (!enabled) {
      // If not enabled, allow skip to home
      return;
    }
    
    final biometrics = await _biometricService.getAvailableBiometrics();
    if (biometrics.isNotEmpty) {
      setState(() {
        _biometricType = _biometricService.getBiometricTypeName(biometrics.first);
      });
    }
    
    // Auto-authenticate on launch
    await Future.delayed(const Duration(milliseconds: 500));
    _authenticate();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _ringController.dispose();
    super.dispose();
  }

  Future<void> _authenticate() async {
    if (_isAuthenticating) return;
    
    setState(() {
      _isAuthenticating = true;
      _authFailed = false;
      _errorMessage = '';
    });
    
    HapticFeedback.lightImpact();
    
    final result = await _biometricService.authenticate(
      reason: 'Unlock Aether Wallet',
    );
    
    result.fold(
      (failure) {
        setState(() {
          _isAuthenticating = false;
          _authFailed = true;
          _errorMessage = failure.message;
        });
        HapticFeedback.heavyImpact();
      },
      (success) {
        if (success) {
          HapticFeedback.mediumImpact();
          // Save unlock time
          _lockService.saveUnlockTime();
          context.go('/home');
        } else {
          setState(() {
            _isAuthenticating = false;
            _authFailed = true;
            _errorMessage = 'Authentication failed';
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.5,
            colors: [
              AppColors.neonCyan.withAlpha(15),
              AppColors.background,
              AppColors.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Spacer(flex: 2),
                
                // Logo & Title
                _buildHeader(),
                
                const Spacer(flex: 1),
                
                // Fingerprint/Face Button
                _buildBiometricButton(),
                
                const SizedBox(height: 32),
                
                // Status Text
                _buildStatusText(),
                
                const Spacer(flex: 2),
                
                // Skip button (for testing/web)
                _buildSkipButton(),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Aether Logo
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: AppColors.aetherGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.neonCyan.withAlpha(80),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Æ',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .scale(begin: const Offset(0.8, 0.8)),
        
        const SizedBox(height: 24),
        
        Text(
          'Aether Wallet',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
        
        const SizedBox(height: 8),
        
        Text(
          'Your secure crypto vault',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white54,
          ),
        )
            .animate()
            .fadeIn(delay: 400.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildBiometricButton() {
    return GestureDetector(
      onTap: _authenticate,
      child: AnimatedBuilder(
        animation: _ringController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Outer rotating ring
              Transform.rotate(
                angle: _ringController.value * 2 * math.pi,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [
                        AppColors.neonCyan.withAlpha(0),
                        AppColors.neonCyan.withAlpha(100),
                        AppColors.neonPurple.withAlpha(100),
                        AppColors.neonCyan.withAlpha(0),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Pulsing glow
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Container(
                    width: 140 + (_pulseController.value * 10),
                    height: 140 + (_pulseController.value * 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: (_authFailed ? AppColors.error : AppColors.neonCyan)
                              .withAlpha((50 + _pulseController.value * 50).toInt()),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
              
              // Main button
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.glassBg,
                  border: Border.all(
                    color: _authFailed 
                        ? AppColors.error.withAlpha(150)
                        : AppColors.glassBorder,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: _isAuthenticating
                      ? SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            color: AppColors.neonCyan,
                            strokeWidth: 2,
                          ),
                        )
                      : Icon(
                          _biometricType.contains('Face') 
                              ? Icons.face 
                              : Icons.fingerprint,
                          size: 56,
                          color: _authFailed 
                              ? AppColors.error 
                              : AppColors.neonCyan,
                        ),
                ),
              ),
            ],
          );
        },
      ),
    )
        .animate()
        .fadeIn(delay: 600.ms, duration: 800.ms)
        .scale(begin: const Offset(0.5, 0.5));
  }

  Widget _buildStatusText() {
    return Column(
      children: [
        Text(
          _isAuthenticating 
              ? 'Authenticating...'
              : _authFailed 
                  ? 'Try again'
                  : 'Tap to unlock with $_biometricType',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: _authFailed ? AppColors.error : Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
        
        if (_authFailed && _errorMessage.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            _errorMessage,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.error.withAlpha(180),
            ),
            textAlign: TextAlign.center,
          )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .shimmer(color: AppColors.error.withAlpha(50)),
        ],
      ],
    );
  }

  Widget _buildSkipButton() {
    if (_biometricsEnabled) {
      // Don't show skip if biometrics are enabled
      return const SizedBox.shrink();
    }
    
    return TextButton(
      onPressed: () {
        _lockService.saveUnlockTime(); // Save time even when skipping
        context.go('/home');
      },
      child: Text(
        'Skip for now',
        style: TextStyle(
          color: Colors.white.withAlpha(100),
          fontSize: 14,
        ),
      ),
    );
  }
}


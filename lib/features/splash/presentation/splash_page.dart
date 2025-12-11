// ============================================================================
// FILE: splash_page.dart
// PURPOSE: Splash page with animated logo reveal and biometric auth
// DESIGN: Neon green glow with OLED black background
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../wallet/presentation/bloc/wallet_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.abyss,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    await Future.delayed(const Duration(milliseconds: 2500));

    if (mounted) {
      // Check if wallet exists
      context.read<WalletBloc>().add(const WalletEvent.checkWalletExists());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: BlocListener<WalletBloc, WalletState>(
        listener: (context, state) {
          state.maybeWhen(
            walletLoaded: (_) => context.go('/home'),
            noWallet: () => context.go('/onboarding'),
            orElse: () {},
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.5,
              colors: [
                Color(0xFF0D1A0D),
                AppColors.abyss,
              ],
            ),
          ),
          child: Stack(
            children: [
              // Background glow effect
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: 0,
                right: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        AppColors.neonGreen.withValues(alpha: 0.15),
                        AppColors.neonGreen.withValues(alpha: 0.05),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 1000.ms, curve: Curves.easeOut)
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.2, 1.2),
                    duration: 2000.ms,
                    curve: Curves.easeOut,
                  ),

              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo container with glow
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.neonGreen,
                            AppColors.limeGlow,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.neonGreen.withValues(alpha: 0.5),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: AppColors.abyss,
                          size: 56,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .scale(
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(1.0, 1.0),
                          duration: 600.ms,
                          curve: Curves.elasticOut,
                        )
                        .then(delay: 200.ms)
                        .shimmer(
                          duration: 1500.ms,
                          color: Colors.white.withValues(alpha: 0.3),
                        ),

                    AppSpacing.gapV32,

                    // App name
                    Text(
                      'Aether',
                      style: AppTypography.displayLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -2,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 500.ms)
                        .slideY(begin: 0.3, end: 0, duration: 500.ms),

                    AppSpacing.gapV8,

                    // Tagline
                    Text(
                      'Wallet',
                      style: AppTypography.headlineMedium.copyWith(
                        color: AppColors.neonGreen,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 8,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 500.ms)
                        .slideY(begin: 0.3, end: 0, duration: 500.ms),

                    AppSpacing.gapV64,

                    // Loading indicator
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.neonGreen.withValues(alpha: 0.8),
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 800.ms, duration: 400.ms)
                        .scale(
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(1.0, 1.0),
                          duration: 400.ms,
                        ),
                  ],
                ),
              ),

              // Bottom tagline
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Text(
                  'The Future of Secure Crypto Storage',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textMuted,
                    letterSpacing: 1,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 1000.ms, duration: 600.ms),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



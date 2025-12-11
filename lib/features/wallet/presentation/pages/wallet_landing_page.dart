// ============================================================================
// FILE: wallet_landing_page.dart
// PURPOSE: Landing page with "Create Wallet" vs "Import Wallet" options
// DESIGN: Deep Glassmorphism with neon green accents
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/neon_button.dart';
import '../bloc/wallet_bloc.dart';
import '../widgets/import_wallet_sheet.dart';

class WalletLandingPage extends StatelessWidget {
  const WalletLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: BlocListener<WalletBloc, WalletState>(
        listener: (context, state) {
          state.maybeWhen(
            mnemonicGenerated: (mnemonic) {
              context.go('/seed-display', extra: mnemonic);
            },
            walletCreated: (wallet) {
              context.go('/home');
            },
            failure: (failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(failure.message),
                  backgroundColor: AppColors.error,
                ),
              );
            },
            orElse: () {},
          );
        },
        child: SafeArea(
          child: Padding(
            padding: AppSpacing.screenPadding,
            child: Column(
              children: [
                const Spacer(flex: 2),

                // Logo and Title
                _buildHeader()
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: -0.2, end: 0),

                const Spacer(flex: 3),

                // Action Buttons
                _buildActions(context)
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 500.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: AppSpacing.xxxl),
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
        // Aether Logo with neon green glow
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.neonGreenGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.neonGreen.withValues(alpha: 0.4),
                blurRadius: 40,
                spreadRadius: 5,
              ),
              BoxShadow(
                color: AppColors.limeGlow.withValues(alpha: 0.3),
                blurRadius: 60,
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
        ),

        const SizedBox(height: AppSpacing.xxxl),

        // App Name with gradient
        ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.neonGreenGradient.createShader(bounds),
          child: Text(
            'Aether',
            style: AppTypography.displayLarge.copyWith(
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        Text(
          'Wallet',
          style: AppTypography.headlineMedium.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w300,
            letterSpacing: 8,
          ),
        ),

        const SizedBox(height: AppSpacing.xxl),

        Text(
          'The Future of Secure Crypto Storage',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textTertiary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      children: [
        // Create Wallet Button
        BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            return NeonButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                context.read<WalletBloc>().add(
                      const WalletEvent.generateMnemonic(),
                    );
              },
              label: 'Create New Wallet',
              icon: Icons.add_circle_outline_rounded,
              isLoading: state.isLoading,
            );
          },
        ),

        const SizedBox(height: AppSpacing.lg),

        // Import Wallet Button
        NeonOutlineButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            _showImportSheet(context);
          },
          label: 'Import Existing Wallet',
          icon: Icons.download_rounded,
        ),
      ],
    );
  }

  void _showImportSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return BlocProvider.value(
          value: context.read<WalletBloc>(),
          child: const ImportWalletSheet(),
        );
      },
    );
  }
}

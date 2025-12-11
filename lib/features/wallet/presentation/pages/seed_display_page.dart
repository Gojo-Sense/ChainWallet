// ============================================================================
// FILE: seed_display_page.dart
// PURPOSE: Display generated seed phrase in Phantom Wallet style
// DESIGN: Words in wrapped glass containers with neon green accents
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/neon_button.dart';
import '../bloc/wallet_bloc.dart';

class SeedDisplayPage extends StatefulWidget {
  const SeedDisplayPage({
    super.key,
    required this.mnemonic,
  });

  final String mnemonic;

  @override
  State<SeedDisplayPage> createState() => _SeedDisplayPageState();
}

class _SeedDisplayPageState extends State<SeedDisplayPage> {
  bool _hasConfirmed = false;

  List<String> get words => widget.mnemonic.split(' ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocListener<WalletBloc, WalletState>(
        listener: (context, state) {
          state.maybeWhen(
            walletCreated: (wallet) {
              context.go('/home');
            },
            copiedToClipboard: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Seed phrase copied to clipboard'),
                  backgroundColor: AppColors.charcoal,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader()
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideX(begin: -0.1, end: 0),

                const SizedBox(height: AppSpacing.xxl),

                // Seed Phrase Grid
                Expanded(
                  child: _buildSeedGrid()
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 500.ms),
                ),

                // Warning
                _buildWarning()
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 400.ms),

                const SizedBox(height: AppSpacing.lg),

                // Actions
                _buildActions(context)
                    .animate()
                    .fadeIn(delay: 500.ms, duration: 400.ms)
                    .slideY(begin: 0.2, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: AppColors.neonGreenGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.key_rounded,
                color: AppColors.abyss,
                size: 24,
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            Text(
              'Your Secret Phrase',
              style: AppTypography.headlineLarge,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Write down these 12 words in order and keep them safe. This is the only way to recover your wallet.',
          style: AppTypography.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildSeedGrid() {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.5,
                crossAxisSpacing: AppSpacing.sm,
                mainAxisSpacing: AppSpacing.sm,
              ),
              itemCount: words.length,
              itemBuilder: (context, index) {
                return _buildWordChip(index + 1, words[index])
                    .animate(delay: Duration(milliseconds: 50 * index))
                    .fadeIn(duration: 200.ms)
                    .scale(
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1, 1));
              },
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Copy Button
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.read<WalletBloc>().add(
                    WalletEvent.copyToClipboard(widget.mnemonic),
                  );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.glassOverlay,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.copy_rounded,
                    color: AppColors.neonGreen,
                    size: 18,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Copy to Clipboard',
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

  Widget _buildWordChip(int number, String word) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.glassOverlay,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Text(
            '$number.',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              word,
              style: AppTypography.seedWord,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarning() {
    return GlassContainer(
      opacity: 0.03,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.warning_rounded,
              color: AppColors.warning,
              size: 20,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              'Never share your seed phrase with anyone. Anyone with this phrase can access your wallet.',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.warning,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      children: [
        // Confirmation Checkbox
        GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            setState(() => _hasConfirmed = !_hasConfirmed);
          },
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: _hasConfirmed
                        ? AppColors.neonGreen
                        : AppColors.glassBorder,
                    width: 2,
                  ),
                  gradient: _hasConfirmed ? AppColors.neonGreenGradient : null,
                ),
                child: _hasConfirmed
                    ? const Icon(
                        Icons.check_rounded,
                        size: 16,
                        color: AppColors.abyss,
                      )
                    : null,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  'I have saved my seed phrase securely',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        // Continue Button
        BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            return NeonButton(
              onPressed: _hasConfirmed
                  ? () {
                      HapticFeedback.mediumImpact();
                      context.read<WalletBloc>().add(
                            WalletEvent.createWallet(widget.mnemonic),
                          );
                    }
                  : null,
              label: 'Continue',
              isLoading: state.isLoading,
              isDisabled: !_hasConfirmed,
            );
          },
        ),
      ],
    );
  }
}

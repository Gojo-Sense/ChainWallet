// ============================================================================
// FILE: import_wallet_sheet.dart
// PURPOSE: Glass Modal Bottom Sheet for importing wallet via private key
// DESIGN: Deep Glassmorphism with neon green accents
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/neon_button.dart';
import '../bloc/wallet_bloc.dart';

class ImportWalletSheet extends StatefulWidget {
  const ImportWalletSheet({super.key});

  @override
  State<ImportWalletSheet> createState() => _ImportWalletSheetState();
}

class _ImportWalletSheetState extends State<ImportWalletSheet> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _validateInput() {
    final text = _controller.text.trim();
    final isHexValid = RegExp(r'^(0x)?[0-9a-fA-F]{64}$').hasMatch(text);
    setState(() => _isValid = isHexValid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletBloc, WalletState>(
      listener: (context, state) {
        state.maybeWhen(
          walletCreated: (wallet) {
            Navigator.of(context).pop();
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
      child: Container(
        margin: const EdgeInsets.all(AppSpacing.lg),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.glassBorder,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: AppColors.neonGreenGradient,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.download_rounded,
                          color: AppColors.abyss,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Text(
                        'Import Wallet',
                        style: AppTypography.headlineMedium,
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.md),

                  Text(
                    'Enter your private key to import an existing wallet.',
                    style: AppTypography.bodyMedium,
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  // Private Key Input
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.glassOverlay,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
                      border: Border.all(
                        color: _focusNode.hasFocus
                            ? AppColors.neonGreen
                            : AppColors.glassBorder,
                        width: _focusNode.hasFocus ? 2 : 1,
                      ),
                    ),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                        fontFamily: 'monospace',
                      ),
                      decoration: InputDecoration(
                        hintText: '0x...',
                        hintStyle: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textMuted,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(AppSpacing.lg),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.paste_rounded,
                            color: AppColors.neonGreen,
                          ),
                          onPressed: () async {
                            final data =
                                await Clipboard.getData(Clipboard.kTextPlain);
                            if (data?.text != null) {
                              _controller.text = data!.text!;
                              HapticFeedback.lightImpact();
                            }
                          },
                        ),
                      ),
                      maxLines: 2,
                      onTap: () => setState(() {}),
                      onEditingComplete: () {
                        _focusNode.unfocus();
                        setState(() {});
                      },
                    ),
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  // Validation hint
                  if (_controller.text.isNotEmpty && !_isValid)
                    Padding(
                      padding: const EdgeInsets.only(left: AppSpacing.sm),
                      child: Text(
                        'Private key must be 64 hex characters',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                    ),

                  const SizedBox(height: AppSpacing.xxl),

                  // Import Button
                  BlocBuilder<WalletBloc, WalletState>(
                    builder: (context, state) {
                      return NeonButton(
                        onPressed: _isValid
                            ? () {
                                HapticFeedback.mediumImpact();
                                context.read<WalletBloc>().add(
                                      WalletEvent.importWallet(
                                        _controller.text.trim(),
                                      ),
                                    );
                              }
                            : null,
                        label: 'Import Wallet',
                        isLoading: state.isLoading,
                        isDisabled: !_isValid,
                      );
                    },
                  ),

                  // Bottom padding for keyboard
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

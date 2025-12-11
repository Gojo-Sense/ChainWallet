// ============================================================================
// FILE: swap_detail_sheet.dart
// PURPOSE: Bottom sheet for executing token swaps
// DESIGN: Deep Glassmorphism modal with swap interface
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../domain/entities/swap_entity.dart';
import '../bloc/swap_bloc.dart';

class SwapDetailSheet extends StatefulWidget {
  const SwapDetailSheet({
    super.key,
    required this.initialFromToken,
    required this.availableTokens,
  });

  final SwapToken initialFromToken;
  final List<SwapToken> availableTokens;

  @override
  State<SwapDetailSheet> createState() => _SwapDetailSheetState();
}

class _SwapDetailSheetState extends State<SwapDetailSheet> {
  final _amountController = TextEditingController();
  SwapToken? _fromToken;
  SwapToken? _toToken;

  @override
  void initState() {
    super.initState();
    _fromToken = widget.initialFromToken;
    // Default to USDC or first different token
    _toToken = widget.availableTokens.firstWhere(
      (t) => t.id != widget.initialFromToken.id,
      orElse: () => widget.availableTokens.first,
    );

    context.read<SwapBloc>().add(SwapEvent.selectFromToken(_fromToken!));
    context.read<SwapBloc>().add(SwapEvent.selectToToken(_toToken!));
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _swapTokens() {
    HapticFeedback.mediumImpact();
    setState(() {
      final temp = _fromToken;
      _fromToken = _toToken;
      _toToken = temp;
    });
    context.read<SwapBloc>().add(const SwapEvent.swapTokens());
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXxl),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXxl),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle
                  Container(
                    margin: const EdgeInsets.only(top: AppSpacing.md),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.glassBorder,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Row(
                      children: [
                        Text(
                          'Swap Tokens',
                          style: AppTypography.headlineLarge,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close_rounded),
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                  ),

                  // From Token Section
                  _buildTokenSection(
                    label: 'You Pay',
                    token: _fromToken,
                    showInput: true,
                    onTokenTap: () => _showTokenPicker(true),
                  ).animate().fadeIn(delay: 100.ms, duration: 300.ms),

                  // Swap Button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    child: GestureDetector(
                      onTap: _swapTokens,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.slate,
                          border: Border.all(
                            color: AppColors.neonGreen.withValues(alpha: 0.5),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.neonGreen.withValues(alpha: 0.2),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.swap_vert_rounded,
                          color: AppColors.neonGreen,
                          size: 24,
                        ),
                      ),
                    ),
                  ).animate().fadeIn(delay: 200.ms, duration: 300.ms),

                  // To Token Section
                  _buildTokenSection(
                    label: 'You Receive',
                    token: _toToken,
                    showInput: false,
                    onTokenTap: () => _showTokenPicker(false),
                  ).animate().fadeIn(delay: 300.ms, duration: 300.ms),

                  const SizedBox(height: AppSpacing.lg),

                  // Quote Details
                  _buildQuoteDetails()
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 300.ms),

                  // Swap Button
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: BlocConsumer<SwapBloc, SwapState>(
                      listener: (context, state) {
                        if (state.lastSwap != null) {
                          Navigator.pop(context);
                          _showSuccessSnackbar(context, state.lastSwap!);
                        }
                      },
                      builder: (context, state) {
                        String buttonText = 'Swap';
                        bool isDisabled = false;

                        if (state.amount <= 0) {
                          buttonText = 'Enter Amount';
                          isDisabled = true;
                        } else if (state.hasInsufficientBalance) {
                          buttonText = 'Insufficient Balance';
                          isDisabled = true;
                        } else if (state.isLoadingQuote) {
                          buttonText = 'Getting Quote...';
                          isDisabled = true;
                        }

                        return NeonButton(
                          onPressed: isDisabled
                              ? null
                              : () {
                                  HapticFeedback.heavyImpact();
                                  context.read<SwapBloc>().add(
                                        const SwapEvent.executeSwap(),
                                      );
                                },
                          label: buttonText,
                          isLoading: state.isSwapping,
                          isDisabled: isDisabled,
                        );
                      },
                    ),
                  ).animate().fadeIn(delay: 500.ms, duration: 300.ms),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTokenSection({
    required String label,
    required SwapToken? token,
    required bool showInput,
    required VoidCallback onTokenTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.glassOverlay,
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                // Token selector
                GestureDetector(
                  onTap: onTokenTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (token != null) ...[
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.neonGreen.withValues(alpha: 0.2),
                            ),
                            child: token.image != null
                                ? ClipOval(
                                    child: Image.network(
                                      token.image!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => Center(
                                        child: Text(
                                          token.symbol.substring(0, 2),
                                          style: AppTypography.labelSmall.copyWith(
                                            color: AppColors.neonGreen,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      token.symbol.substring(0, 2),
                                      style: AppTypography.labelSmall.copyWith(
                                        color: AppColors.neonGreen,
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            token.symbol,
                            style: AppTypography.titleMedium,
                          ),
                        ] else
                          Text(
                            'Select',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        const SizedBox(width: AppSpacing.xs),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.textSecondary,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                // Amount input or display
                if (showInput)
                  Expanded(
                    child: BlocBuilder<SwapBloc, SwapState>(
                      builder: (context, state) {
                        return TextField(
                          controller: _amountController,
                          onChanged: (value) {
                            final amount = double.tryParse(value) ?? 0;
                            context.read<SwapBloc>().add(
                                  SwapEvent.updateAmount(amount),
                                );
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          style: AppTypography.headlineLarge,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: '0.00',
                            hintStyle: AppTypography.headlineLarge.copyWith(
                              color: AppColors.textMuted,
                            ),
                            border: InputBorder.none,
                          ),
                        );
                      },
                    ),
                  )
                else
                  BlocBuilder<SwapBloc, SwapState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (state.isLoadingQuote)
                            SizedBox(
                              width: 60,
                              child: LinearProgressIndicator(
                                backgroundColor: AppColors.glassOverlay,
                                valueColor: AlwaysStoppedAnimation(
                                  AppColors.neonGreen,
                                ),
                              ),
                            )
                          else
                            Text(
                              state.quote?.toAmount.toStringAsFixed(6) ?? '0.00',
                              style: AppTypography.headlineLarge,
                            ),
                        ],
                      );
                    },
                  ),
              ],
            ),
            if (token != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balance: ${token.formattedBalance}',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  if (showInput)
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        _amountController.text = token.balance.toString();
                        context.read<SwapBloc>().add(
                              SwapEvent.updateAmount(token.balance),
                            );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.neonGreen.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'MAX',
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.neonGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteDetails() {
    return BlocBuilder<SwapBloc, SwapState>(
      builder: (context, state) {
        if (state.quote == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.glassOverlay,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Column(
              children: [
                _buildDetailRow('Rate', state.quote!.formattedRate),
                Divider(color: AppColors.glassBorder, height: 20),
                _buildDetailRow('Fee', state.quote!.formattedFee),
                Divider(color: AppColors.glassBorder, height: 20),
                _buildDetailRow(
                  'Price Impact',
                  state.quote!.formattedPriceImpact,
                  isWarning: state.quote!.priceImpact > 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isWarning = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
        Text(
          value,
          style: AppTypography.bodySmall.copyWith(
            color: isWarning ? AppColors.warning : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  void _showTokenPicker(bool isFromToken) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.charcoal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXxl),
        ),
      ),
      builder: (ctx) => _TokenPickerContent(
        tokens: widget.availableTokens,
        selectedToken: isFromToken ? _fromToken : _toToken,
        onSelected: (token) {
          Navigator.pop(ctx);
          setState(() {
            if (isFromToken) {
              _fromToken = token;
              context.read<SwapBloc>().add(SwapEvent.selectFromToken(token));
            } else {
              _toToken = token;
              context.read<SwapBloc>().add(SwapEvent.selectToToken(token));
            }
          });
        },
      ),
    );
  }

  void _showSuccessSnackbar(BuildContext context, SwapEntity swap) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.neonGreen),
            const SizedBox(width: 12),
            Text(
              'Swapped ${swap.fromAmount.toStringAsFixed(4)} ${swap.fromToken.symbol}',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: AppColors.charcoal,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _TokenPickerContent extends StatelessWidget {
  const _TokenPickerContent({
    required this.tokens,
    required this.selectedToken,
    required this.onSelected,
  });

  final List<SwapToken> tokens;
  final SwapToken? selectedToken;
  final ValueChanged<SwapToken> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: AppSpacing.md),
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.glassBorder,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(
            'Select Token',
            style: AppTypography.headlineMedium,
          ),
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tokens.length,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            itemBuilder: (context, index) {
              final token = tokens[index];
              final isSelected = token.id == selectedToken?.id;

              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.neonGreen.withValues(alpha: 0.2),
                  ),
                  child: token.image != null
                      ? ClipOval(
                          child: Image.network(
                            token.image!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Center(
                              child: Text(
                                token.symbol.substring(0, 2),
                                style: AppTypography.labelMedium.copyWith(
                                  color: AppColors.neonGreen,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            token.symbol.substring(0, 2),
                            style: AppTypography.labelMedium.copyWith(
                              color: AppColors.neonGreen,
                            ),
                          ),
                        ),
                ),
                title: Text(token.symbol, style: AppTypography.titleMedium),
                subtitle: Text(token.name, style: AppTypography.bodySmall),
                trailing: isSelected
                    ? const Icon(Icons.check_circle, color: AppColors.neonGreen)
                    : Text(
                        token.formattedBalance,
                        style: AppTypography.bodySmall,
                      ),
                onTap: () {
                  HapticFeedback.lightImpact();
                  onSelected(token);
                },
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}



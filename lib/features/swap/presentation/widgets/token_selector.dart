// ============================================================================
// FILE: token_selector.dart
// PURPOSE: Token selection widget for swap feature
// DESIGN: Glass card with token icon, symbol, and balance
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/swap_entity.dart';

class TokenSelector extends StatelessWidget {
  const TokenSelector({
    super.key,
    required this.token,
    required this.availableTokens,
    required this.onTokenSelected,
    required this.label,
    this.amount,
    this.onAmountChanged,
    this.showAmountInput = false,
    this.isLoading = false,
  });

  final SwapToken? token;
  final List<SwapToken> availableTokens;
  final ValueChanged<SwapToken> onTokenSelected;
  final String label;
  final double? amount;
  final ValueChanged<double>? onAmountChanged;
  final bool showAmountInput;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label
              Text(
                label,
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Token selector and amount
              Row(
                children: [
                  // Token selector button
                  Expanded(
                    flex: 2,
                    child: _buildTokenButton(context),
                  ),
                  const SizedBox(width: AppSpacing.md),

                  // Amount input or display
                  if (showAmountInput)
                    Expanded(
                      flex: 3,
                      child: _buildAmountInput(),
                    )
                  else if (amount != null)
                    Expanded(
                      flex: 3,
                      child: _buildAmountDisplay(),
                    ),
                ],
              ),

              // Balance
              if (token != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Balance: ${token!.formattedBalance} ${token!.symbol}',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                    if (showAmountInput)
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          onAmountChanged?.call(token!.balance);
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
      ),
    );
  }

  Widget _buildTokenButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        _showTokenPicker(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.glassOverlay,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (token != null) ...[
              // Token icon
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.neonGreen.withValues(alpha: 0.2),
                ),
                child: token!.image != null
                    ? ClipOval(
                        child: Image.network(
                          token!.image!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _buildDefaultIcon(),
                        ),
                      )
                    : _buildDefaultIcon(),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                token!.symbol,
                style: AppTypography.headlineSmall,
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
    );
  }

  Widget _buildDefaultIcon() {
    return Center(
      child: Text(
        token?.symbol.substring(0, 2) ?? '?',
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.neonGreen,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return TextField(
      onChanged: (value) {
        final parsed = double.tryParse(value) ?? 0;
        onAmountChanged?.call(parsed);
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      style: AppTypography.headlineLarge.copyWith(
        color: AppColors.textPrimary,
      ),
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: '0.00',
        hintStyle: AppTypography.headlineLarge.copyWith(
          color: AppColors.textMuted,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildAmountDisplay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isLoading)
          SizedBox(
            width: 80,
            child: LinearProgressIndicator(
              backgroundColor: AppColors.glassOverlay,
              valueColor: AlwaysStoppedAnimation(AppColors.neonGreen),
            ),
          )
        else
          Text(
            amount?.toStringAsFixed(6) ?? '0.00',
            style: AppTypography.headlineLarge.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.right,
          ),
        if (token != null && amount != null)
          Text(
            '≈ \$${(amount! * token!.priceUsd).toStringAsFixed(2)}',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
      ],
    );
  }

  void _showTokenPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _TokenPickerSheet(
        tokens: availableTokens,
        selectedToken: token,
        onSelected: (selected) {
          Navigator.pop(context);
          onTokenSelected(selected);
        },
      ),
    );
  }
}

class _TokenPickerSheet extends StatelessWidget {
  const _TokenPickerSheet({
    required this.tokens,
    required this.selectedToken,
    required this.onSelected,
  });

  final List<SwapToken> tokens;
  final SwapToken? selectedToken;
  final ValueChanged<SwapToken> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXxl),
        ),
      ),
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
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text(
              'Select Token',
              style: AppTypography.headlineMedium,
            ),
          ),

          // Token list
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: tokens.length,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              itemBuilder: (context, index) {
                final token = tokens[index];
                final isSelected = token.id == selectedToken?.id;

                return _TokenListItem(
                  token: token,
                  isSelected: isSelected,
                  onTap: () => onSelected(token),
                );
              },
            ),
          ),

          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

class _TokenListItem extends StatelessWidget {
  const _TokenListItem({
    required this.token,
    required this.isSelected,
    required this.onTap,
  });

  final SwapToken token;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.neonGreen.withValues(alpha: 0.1)
              : AppColors.glassOverlay,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: isSelected ? AppColors.neonGreen : AppColors.glassBorder,
          ),
        ),
        child: Row(
          children: [
            // Token icon
            Container(
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
                        errorBuilder: (_, __, ___) => _buildDefaultIcon(),
                      ),
                    )
                  : _buildDefaultIcon(),
            ),
            const SizedBox(width: AppSpacing.md),

            // Token info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    token.symbol,
                    style: AppTypography.titleLarge,
                  ),
                  Text(
                    token.name,
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ),

            // Balance
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  token.formattedBalance,
                  style: AppTypography.titleMedium,
                ),
                Text(
                  token.formattedValueUsd,
                  style: AppTypography.bodySmall,
                ),
              ],
            ),

            if (isSelected) ...[
              const SizedBox(width: AppSpacing.sm),
              Icon(
                Icons.check_circle,
                color: AppColors.neonGreen,
                size: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultIcon() {
    return Center(
      child: Text(
        token.symbol.substring(0, 2),
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.neonGreen,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}



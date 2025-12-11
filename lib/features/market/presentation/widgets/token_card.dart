// ============================================================================
// FILE: token_card.dart
// PURPOSE: Token list item card with glassmorphism styling
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/token_entity.dart';

class TokenCard extends StatelessWidget {
  const TokenCard({
    super.key,
    required this.token,
    required this.onTap,
  });

  final TokenEntity token;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      margin: const EdgeInsets.only(bottom: AetherSpacing.md),
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Row(
        children: [
          // Token Icon
          _buildTokenIcon(),
          const SizedBox(width: AetherSpacing.md),

          // Token Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  token.symbol,
                  style: AetherTypography.headlineSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  token.name,
                  style: AetherTypography.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Price Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                token.formattedPrice,
                style: AetherTypography.headlineSmall,
              ),
              const SizedBox(height: 2),
              _buildPriceChange(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTokenIcon() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: token.isPositive
            ? AetherColors.aetherGradient
            : AetherColors.negativeGradient,
      ),
      child: token.image != null
          ? ClipOval(
              child: Image.network(
                token.image!,
                width: 44,
                height: 44,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildDefaultIcon(),
              ),
            )
          : _buildDefaultIcon(),
    );
  }

  Widget _buildDefaultIcon() {
    return Center(
      child: Text(
        token.symbol.substring(0, token.symbol.length > 2 ? 2 : token.symbol.length),
        style: AetherTypography.labelLarge.copyWith(
          color: AetherColors.background,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildPriceChange() {
    final color = token.isPositive ? AetherColors.success : AetherColors.error;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AetherSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            token.isPositive
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 2),
          Text(
            token.formattedPriceChange,
            style: AetherTypography.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


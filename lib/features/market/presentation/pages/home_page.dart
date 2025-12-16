// ============================================================================
// FILE: home_page.dart
// PURPOSE: Main dashboard with neon green design, wallet balance & market data
// DESIGN: Deep Glassmorphism with neon green accents (original design)
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
import '../../../../core/widgets/spline_3d_chart.dart';
import '../../../../core/widgets/avatar_3d.dart';
import '../../../../core/widgets/price_ticker.dart';
import '../../../wallet/presentation/bloc/wallet_bloc.dart';
import '../bloc/market_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBalanceObscured = false;

  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(const WalletEvent.loadWallet());
    context.read<MarketBloc>().add(const MarketEvent.loadTopTokens());
  }

  void _toggleBalanceVisibility() {
    HapticFeedback.lightImpact();
    setState(() {
      _isBalanceObscured = !_isBalanceObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A120A),
              AppColors.abyss,
              AppColors.abyss,
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Price Ticker Banner
              SliverToBoxAdapter(
                child: _buildPriceTicker(),
              ),

              // App Bar
              SliverToBoxAdapter(
                child: _buildAppBar()
                    .animate()
                    .fadeIn(duration: 400.ms),
              ),

              // Balance Card
              SliverToBoxAdapter(
                child: _buildBalanceCard()
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.1, end: 0, duration: 500.ms),
              ),

              // Quick Actions
              SliverToBoxAdapter(
                child: _buildQuickActions()
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 500.ms)
                    .slideY(begin: 0.1, end: 0, duration: 500.ms),
              ),

              // Feature Grid
              SliverToBoxAdapter(
                child: _buildFeatureGrid()
                    .animate()
                    .fadeIn(delay: 250.ms, duration: 500.ms),
              ),

              // Popular Crypto Section
              SliverToBoxAdapter(
                child: _buildSectionHeader('Popular Crypto', Icons.add)
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 400.ms),
              ),

              // Crypto List
              _buildTokenList(),

              // Bottom spacing
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 3D Profile Avatar with animated ring
          Row(
            children: [
              const Avatar3D(
                size: 50,
                seed: 'aether-wallet',
                style: AvatarStyle.notionists,
                enableGlow: true,
                enableRingAnimation: true,
              ),
              const SizedBox(width: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Welcome back',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('👋', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Text(
                    'Crypto King',
                    style: AppTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Action buttons with emojis
          Row(
            children: [
              _buildEmojiButton('🔔', () {
                HapticFeedback.lightImpact();
                context.push('/alerts');
              }),
              AppSpacing.gapH12,
              _buildEmojiButton('🤖', () {
                HapticFeedback.lightImpact();
                context.push('/chat');
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceTicker() {
    return BlocBuilder<MarketBloc, MarketState>(
      builder: (context, state) {
        final items = state.tokens.take(10).map((token) => TickerItem(
          symbol: token.symbol.toUpperCase(),
          price: token.currentPrice,
          changePercent: token.priceChangePercentage24h,
          id: token.id,
        )).toList();

        if (items.isEmpty) {
          // Default items while loading
          return const PriceTicker(items: [
            TickerItem(symbol: 'BTC', price: 98500, changePercent: 2.34),
            TickerItem(symbol: 'ETH', price: 3680, changePercent: 1.23),
            TickerItem(symbol: 'SOL', price: 225, changePercent: -0.45),
            TickerItem(symbol: 'DOGE', price: 0.42, changePercent: 5.67),
          ]);
        }

        return PriceTicker(items: items);
      },
    );
  }

  Widget _buildEmojiButton(String emoji, VoidCallback onTap) {
    return GlassContainer(
      blur: 10,
      opacity: 0.1,
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      padding: const EdgeInsets.all(10),
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return GlassContainer(
      blur: 10,
      opacity: 0.1,
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(
          icon,
          color: AppColors.textPrimary,
          size: 22,
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Padding(
      padding: AppSpacing.screenPaddingHorizontal,
      child: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          return GlassContainerGradient(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Balance',
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _toggleBalanceVisibility,
                          child: Icon(
                            _isBalanceObscured
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            color: AppColors.textSecondary,
                            size: 20,
                          ),
                        ),
                        AppSpacing.gapH16,
                        const Icon(
                          Icons.bar_chart_rounded,
                          color: AppColors.textSecondary,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                AppSpacing.gapV16,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _isBalanceObscured ? '••••••••' : '\$4,011.00',
                      style: AppTypography.balance,
                    ),
                    AppSpacing.gapH12,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.neonGreen.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_upward_rounded,
                            color: AppColors.neonGreen,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '7.3%',
                            style: AppTypography.percentChange.copyWith(
                              color: AppColors.neonGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                AppSpacing.gapV16,
                state.maybeWhen(
                  walletLoaded: (wallet) => Text(
                    wallet.shortAddress,
                    style: AppTypography.addressText,
                  ),
                  orElse: () => Text(
                    '0x4Hlojd87h...9988',
                    style: AppTypography.addressText,
                  ),
                ),
                AppSpacing.gapV16,
                // Portfolio quick link
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push('/portfolio');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.neonGreen.withValues(alpha: 0.2),
                          AppColors.neonGreen.withValues(alpha: 0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.neonGreen.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('📊', style: TextStyle(fontSize: 20)),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'View Portfolio',
                                  style: AppTypography.labelMedium.copyWith(
                                    color: AppColors.neonGreen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Analytics & Charts',
                                  style: AppTypography.labelSmall.copyWith(
                                    color: AppColors.textTertiary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.neonGreen,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacing.gapV16,
                // 3D Interactive Chart (Spline-inspired)
                const Spline3DChart(height: 160),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Row(
        children: [
          Expanded(
            child: NeonButton(
              onPressed: () {
                context.push('/send');
              },
              label: 'Send',
              icon: Icons.send_rounded,
            ),
          ),
          AppSpacing.gapH12,
          Expanded(
            child: NeonButton(
              onPressed: () {
                context.push('/scan');
              },
              label: 'Scan',
              icon: Icons.qr_code_scanner_rounded,
            ),
          ),
          AppSpacing.gapH12,
          Expanded(
            child: NeonOutlineButton(
              onPressed: () {
                context.push('/pulse');
              },
              label: 'Pulse',
              icon: Icons.nfc_rounded,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureGrid() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Access',
                style: AppTypography.headlineSmall,
              ),
              Text(
                '✨ New Features',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.neonGreen,
                ),
              ),
            ],
          ),
          AppSpacing.gapV16,
          Row(
            children: [
              Expanded(
                child: _buildFeatureTile('📊', 'Portfolio', '/portfolio'),
              ),
              AppSpacing.gapH8,
              Expanded(
                child: _buildFeatureTile('📜', 'History', '/transactions'),
              ),
            ],
          ),
          AppSpacing.gapV12,
          Row(
            children: [
              Expanded(
                child: _buildFeatureTile('🎨', 'NFTs', '/nft'),
              ),
              AppSpacing.gapH8,
              Expanded(
                child: _buildFeatureTile('🏆', 'Badges', '/achievements'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(String emoji, String label, String route) {
    return GlassContainer(
      blur: 10,
      opacity: 0.1,
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        HapticFeedback.lightImpact();
        context.push(route);
      },
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData actionIcon) {
    return Padding(
      padding: AppSpacing.screenPaddingHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTypography.headlineSmall,
          ),
          GlassContainer(
            blur: 10,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              HapticFeedback.lightImpact();
            },
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                actionIcon,
                color: AppColors.textPrimary,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTokenList() {
    return BlocBuilder<MarketBloc, MarketState>(
      builder: (context, state) {
        if (state.isLoading && state.tokens.isEmpty) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: AppSpacing.screenPadding,
              child: Column(
                children: List.generate(
                  3,
                  (index) => _buildSkeletonCard(index),
                ),
              ),
            ),
          );
        }

        if (state.tokens.isEmpty) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: AppSpacing.screenPadding,
              child: Center(
                child: Text(
                  'No tokens available',
                  style: AppTypography.bodyMedium,
                ),
              ),
            ),
          );
        }

        // Show first 6 tokens
        final displayTokens = state.tokens.take(6).toList();

        return SliverPadding(
          padding: AppSpacing.screenPadding,
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final token = displayTokens[index];
                return _buildCryptoCard(token)
                    .animate()
                    .fadeIn(
                      delay: Duration(milliseconds: 50 * index),
                      duration: 300.ms,
                    )
                    .slideY(begin: 0.1, end: 0);
              },
              childCount: displayTokens.length,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCryptoCard(dynamic token) {
    final isPositive = token.priceChangePercentage24h >= 0;

    return GlassCard(
      blur: 15,
      opacity: 0.06,
      padding: const EdgeInsets.all(16),
      onTap: () {
        HapticFeedback.lightImpact();
        context.push('/token/${token.id}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                token.symbol.toUpperCase(),
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color:
                      isPositive ? AppColors.neonGreen : AppColors.neonMagenta,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  color: AppColors.abyss,
                  size: 16,
                ),
              ),
            ],
          ),
          AppSpacing.gapV12,
          Text(
            token.formattedPrice,
            style: AppTypography.headlineMedium,
          ),
          const Spacer(),
          // Mini chart placeholder
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomPaint(
              size: const Size(double.infinity, 40),
              painter: _MiniChartPainter(
                color:
                    isPositive ? AppColors.neonGreen : AppColors.neonMagenta,
                isPositive: isPositive,
              ),
            ),
          ),
          AppSpacing.gapV12,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: (isPositive ? AppColors.neonGreen : AppColors.error)
                  .withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositive
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded,
                  color: isPositive ? AppColors.neonGreen : AppColors.error,
                  size: 10,
                ),
                const SizedBox(width: 4),
                Text(
                  token.formattedPriceChange,
                  style: AppTypography.labelSmall.copyWith(
                    color: isPositive ? AppColors.neonGreen : AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: AppSpacing.cardPadding,
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.glassOverlay,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(color: AppColors.glassBorder),
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          delay: Duration(milliseconds: 100 * index),
          duration: 1500.ms,
          color: AppColors.glassHighlight,
        );
  }

}

/// Custom painter for mini chart
class _MiniChartPainter extends CustomPainter {
  _MiniChartPainter({
    required this.color,
    required this.isPositive,
  });

  final Color color;
  final bool isPositive;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // Generate sample chart data
    final points = isPositive
        ? [0.3, 0.5, 0.4, 0.7, 0.6, 0.8, 0.75, 0.9]
        : [0.7, 0.6, 0.65, 0.4, 0.5, 0.3, 0.35, 0.2];

    for (int i = 0; i < points.length; i++) {
      final x = (i / (points.length - 1)) * size.width;
      final y = size.height - (points[i] * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    // Draw gradient fill
    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: 0.3),
          color.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


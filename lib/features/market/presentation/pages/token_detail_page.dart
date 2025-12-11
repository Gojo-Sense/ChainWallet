// ============================================================================
// FILE: token_detail_page.dart
// PURPOSE: Token detail page with price chart and buy options
// DESIGN: Deep Glassmorphism with neon green/magenta accents, fl_chart
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
import '../bloc/market_bloc.dart';
import '../widgets/token_chart.dart';
import '../widgets/candlestick_chart.dart';

class TokenDetailPage extends StatefulWidget {
  const TokenDetailPage({
    super.key,
    required this.tokenId,
  });

  final String tokenId;

  @override
  State<TokenDetailPage> createState() => _TokenDetailPageState();
}

class _TokenDetailPageState extends State<TokenDetailPage> {
  bool _isCandlestickChart = true;
  String _selectedInterval = '15m';

  @override
  void initState() {
    super.initState();
    context.read<MarketBloc>().add(MarketEvent.selectToken(widget.tokenId));
    // Start live chart when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MarketBloc>().add(
        MarketEvent.startLiveChart(
          tokenId: widget.tokenId,
          interval: _selectedInterval,
        ),
      );
    });
  }

  @override
  void dispose() {
    // Stop live chart when page is disposed
    context.read<MarketBloc>().add(const MarketEvent.stopLiveChart());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            context.read<MarketBloc>().add(const MarketEvent.clearSelection());
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border_rounded),
            onPressed: () {
              HapticFeedback.lightImpact();
            },
          ),
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {
              HapticFeedback.lightImpact();
            },
          ),
        ],
      ),
      body: BlocBuilder<MarketBloc, MarketState>(
        builder: (context, state) {
          if (state.isLoading && state.selectedToken == null) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.neonGreen,
              ),
            );
          }

          final token = state.selectedToken;
          if (token == null) {
            return Center(
              child: Text(
                'Token not found',
                style: AppTypography.bodyMedium,
              ),
            );
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: AppSpacing.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Token Header
                  _buildTokenHeader(token)
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: -0.1, end: 0),

                  const SizedBox(height: AppSpacing.xxl),

                  // Price Chart
                  _buildChartSection(state)
                      .animate()
                      .fadeIn(delay: 100.ms, duration: 500.ms),

                  const SizedBox(height: AppSpacing.xxl),

                  // Stats Grid
                  _buildStatsGrid(token)
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms),

                  const SizedBox(height: AppSpacing.xxl),

                  // Buy Section
                  _buildBuySection()
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 400.ms)
                      .slideY(begin: 0.1, end: 0),

                  const SizedBox(height: AppSpacing.huge),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTokenHeader(dynamic token) {
    final isPositive = token.isPositive;
    
    return Row(
      children: [
        // Token Icon
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: isPositive
                ? AppColors.neonGreenGradient
                : const LinearGradient(colors: [AppColors.neonMagenta, AppColors.electricPink]),
            shape: BoxShape.circle,
          ),
          child: token.image != null
              ? ClipOval(
                  child: Image.network(
                    token.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildDefaultIcon(token),
                  ),
                )
              : _buildDefaultIcon(token),
        ),
        const SizedBox(width: AppSpacing.lg),

        // Token Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                token.name,
                style: AppTypography.headlineLarge,
              ),
              Text(
                token.symbol,
                style: AppTypography.bodyMedium,
              ),
            ],
          ),
        ),

        // Price
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              token.formattedPrice,
              style: AppTypography.headlineLarge,
            ),
            _buildPriceChange(token),
          ],
        ),
      ],
    );
  }

  Widget _buildDefaultIcon(dynamic token) {
    return Center(
      child: Text(
        token.symbol.substring(0, 2),
        style: AppTypography.headlineSmall.copyWith(
          color: AppColors.abyss,
        ),
      ),
    );
  }

  Widget _buildPriceChange(dynamic token) {
    final isPositive = token.isPositive;
    final color = isPositive ? AppColors.neonGreen : AppColors.error;
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
            size: 14,
            color: color,
          ),
          Text(
            token.formattedPriceChange,
            style: AppTypography.labelMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection(MarketState state) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          // Chart Type Toggle and Interval Selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChartTypeToggle(
                isCandlestick: _isCandlestickChart,
                onChanged: (isCandlestick) {
                  setState(() {
                    _isCandlestickChart = isCandlestick;
                  });
                  HapticFeedback.selectionClick();
                },
              ),
              if (_isCandlestickChart)
                ChartIntervalSelector(
                  selectedInterval: _selectedInterval,
                  onChanged: (interval) {
                    setState(() {
                      _selectedInterval = interval;
                    });
                    HapticFeedback.selectionClick();
                    context.read<MarketBloc>().add(
                      MarketEvent.changeChartInterval(interval),
                    );
                  },
                )
              else
                ChartRangeSelector(
                  selectedDays: state.chartDays,
                  onChanged: (days) {
                    HapticFeedback.selectionClick();
                    context.read<MarketBloc>().add(MarketEvent.changeChartRange(days));
                  },
                ),
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          // Chart
          if (_isCandlestickChart)
            _buildCandlestickChart(state)
          else
            _buildLineChart(state),
        ],
      ),
    );
  }

  Widget _buildCandlestickChart(MarketState state) {
    if (state.isLiveChartActive && state.liveCandles.isNotEmpty) {
      return CandlestickChart(
        candles: state.liveCandles,
        height: 300,
        onCandleTapped: (candle) {
          // Show tooltip or details
        },
      );
    } else if (state.isLiveChartActive && state.liveCandles.isEmpty) {
      return SizedBox(
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: AppColors.neonGreen),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Connecting to live stream...',
                style: AppTypography.bodyMedium,
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 300,
        child: Center(
          child: Text(
            'Live chart unavailable',
            style: AppTypography.bodyMedium,
          ),
        ),
      );
    }
  }

  Widget _buildLineChart(MarketState state) {
    if (state.isLoadingChart) {
      return SizedBox(
        height: 200,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.neonGreen),
        ),
      );
    } else if (state.chart != null) {
      return TokenChart(chart: state.chart!, height: 200);
    } else {
      return SizedBox(
        height: 200,
        child: Center(
          child: Text(
            'Chart data unavailable',
            style: AppTypography.bodyMedium,
          ),
        ),
      );
    }
  }

  Widget _buildStatsGrid(dynamic token) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistics',
          style: AppTypography.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Market Cap',
                token.marketCap != null
                    ? '\$${_formatNumber(token.marketCap!)}'
                    : '-',
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildStatCard(
                '24h Volume',
                token.volume24h != null
                    ? '\$${_formatNumber(token.volume24h!)}'
                    : '-',
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                '24h High',
                token.high24h != null
                    ? '\$${token.high24h!.toStringAsFixed(2)}'
                    : '-',
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildStatCard(
                '24h Low',
                token.low24h != null
                    ? '\$${token.low24h!.toStringAsFixed(2)}'
                    : '-',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTypography.labelSmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTypography.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildBuySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Buy Crypto',
          style: AppTypography.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.lg),

        // Primary Buy Button
        NeonButton(
          onPressed: () {
            HapticFeedback.mediumImpact();
            _showPaymentSuccess();
          },
          label: 'Buy with Card',
          icon: Icons.credit_card_rounded,
        ),

        const SizedBox(height: AppSpacing.md),

        // Apple Pay Button (styled)
        GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            _showPaymentSuccess();
          },
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.apple,
                  color: Colors.black,
                  size: 28,
                ),
                const SizedBox(width: 8),
                Text(
                  'Pay',
                  style: AppTypography.buttonText.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPaymentSuccess() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.charcoal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        ),
        title: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.neonGreen),
            const SizedBox(width: 12),
            Text(
              'Payment Successful',
              style: AppTypography.headlineSmall,
            ),
          ],
        ),
        content: Text(
          'Your purchase has been completed successfully.',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Done',
              style: TextStyle(color: AppColors.neonGreen),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.neonGreen),
            const SizedBox(width: 12),
            const Text('Payment Successful'),
          ],
        ),
        backgroundColor: AppColors.charcoal,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  String _formatNumber(double number) {
    if (number >= 1e12) {
      return '${(number / 1e12).toStringAsFixed(2)}T';
    } else if (number >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(2)}B';
    } else if (number >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(2)}M';
    } else if (number >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(2)}K';
    }
    return number.toStringAsFixed(2);
  }
}

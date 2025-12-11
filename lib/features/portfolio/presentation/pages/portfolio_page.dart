// ============================================================================
// FILE: portfolio_page.dart
// PURPOSE: Portfolio analytics dashboard
// DESIGN: Deep Glassmorphism with animated charts
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/portfolio_entity.dart';
import '../bloc/portfolio_bloc.dart';
import '../widgets/portfolio_pie_chart.dart';
import '../widgets/portfolio_chart.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  void initState() {
    super.initState();
    context.read<PortfolioBloc>().add(const PortfolioEvent.load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.5),
            radius: 1.5,
            colors: [
              AppColors.neonGreen.withAlpha(10),
              AppColors.abyss,
            ],
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<PortfolioBloc, PortfolioState>(
            builder: (context, state) {
              if (state.isLoading && state.portfolio == null) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.neonGreen),
                );
              }

              if (state.portfolio == null) {
                return Center(
                  child: Text(
                    state.error ?? 'Failed to load portfolio',
                    style: const TextStyle(color: Colors.white54),
                  ),
                );
              }

              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: _buildHeader(state.portfolio!)),
                  SliverToBoxAdapter(child: _buildValueCard(state.portfolio!)),
                  SliverToBoxAdapter(child: _buildTimeRangeSelector(state)),
                  SliverToBoxAdapter(child: _buildChart(state)),
                  SliverToBoxAdapter(child: _buildPieChartSection(state.portfolio!)),
                  SliverToBoxAdapter(child: _buildAssetsList(state.portfolio!)),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Portfolio portfolio) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.glassBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Portfolio Analytics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.read<PortfolioBloc>().add(const PortfolioEvent.refresh());
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.glassBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(Icons.refresh, color: Colors.white70, size: 20),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2, end: 0);
  }

  Widget _buildValueCard(Portfolio portfolio) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.neonGreen.withAlpha(20),
                  AppColors.glassBg,
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.neonGreen.withAlpha(50)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Value',
                  style: TextStyle(
                    color: Colors.white.withAlpha(150),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${portfolio.totalValue.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: portfolio.isProfit
                            ? AppColors.success.withAlpha(30)
                            : AppColors.error.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            portfolio.isProfit
                                ? Icons.trending_up
                                : Icons.trending_down,
                            color: portfolio.isProfit
                                ? AppColors.success
                                : AppColors.error,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${portfolio.isProfit ? '+' : ''}\$${portfolio.totalPnL.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: portfolio.isProfit
                                  ? AppColors.success
                                  : AppColors.error,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '(${portfolio.isProfit ? '+' : ''}${portfolio.pnLPercentage.toStringAsFixed(2)}%)',
                      style: TextStyle(
                        color: portfolio.isProfit
                            ? AppColors.success
                            : AppColors.error,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildTimeRangeSelector(PortfolioState state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: PortfolioTimeRange.values.map((range) {
          final isSelected = state.selectedRange == range;
          return GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.read<PortfolioBloc>().add(PortfolioEvent.changeTimeRange(range));
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.neonGreen.withAlpha(30) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.neonGreen : Colors.transparent,
                ),
              ),
              child: Text(
                range.label,
                style: TextStyle(
                  color: isSelected ? AppColors.neonGreen : Colors.white54,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildChart(PortfolioState state) {
    if (state.portfolio == null || state.portfolio!.history.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PortfolioChart(
        history: state.portfolio!.history,
        range: state.selectedRange,
        height: 200,
      ),
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildPieChartSection(Portfolio portfolio) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Allocation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: PortfolioPieChart(
              assets: portfolio.assets,
              size: 200,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _buildAssetsList(Portfolio portfolio) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Assets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...portfolio.sortedByValue.asMap().entries.map((entry) {
            return _buildAssetTile(entry.value, entry.key);
          }),
        ],
      ),
    );
  }

  Widget _buildAssetTile(PortfolioAsset asset, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.glassBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Row(
              children: [
                // Asset icon
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      asset.symbol.substring(0, 1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Asset info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        asset.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${asset.amount} ${asset.symbol}',
                        style: TextStyle(
                          color: Colors.white.withAlpha(150),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // Value & P&L
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      asset.formattedValue,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          asset.isProfit ? Icons.arrow_upward : Icons.arrow_downward,
                          color: asset.isProfit ? AppColors.success : AppColors.error,
                          size: 12,
                        ),
                        Text(
                          '${asset.isProfit ? '+' : ''}${asset.pnLPercentage.toStringAsFixed(2)}%',
                          style: TextStyle(
                            color: asset.isProfit ? AppColors.success : AppColors.error,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: (500 + 100 * index).ms).slideX(begin: 0.1, end: 0);
  }
}



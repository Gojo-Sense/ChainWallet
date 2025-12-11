// ============================================================================
// FILE: dashboard_widget.dart
// PURPOSE: Comprehensive dashboard with budget, spending, and analytics
// DESIGN: Inspired by reference images with glassmorphism styling
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../transactions/presentation/bloc/transaction_bloc.dart';
import '../../../transactions/domain/entities/transaction_entity.dart';
import '../../../portfolio/presentation/bloc/portfolio_bloc.dart';
import '../../../portfolio/domain/entities/portfolio_entity.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Budget Header Section
        _buildBudgetHeader(context),
        
        // Spending & Balance Cards
        _buildSpendingBalanceCards(context),
        
        // Recent Transactions
        _buildRecentTransactions(context),
        
        // Spending Analytics Section
        _buildSpendingAnalytics(context),
      ],
    );
  }

  Widget _buildBudgetHeader(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final balance = portfolioState.portfolio?.totalValue ?? 4011.0;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.purple.withValues(alpha: 0.3),
                AppColors.purple.withValues(alpha: 0.1),
                AppColors.abyss,
              ],
            ),
          ),
          child: Stack(
            children: [
              // City skyline silhouette effect
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.1,
                  child: CustomPaint(
                    size: const Size(double.infinity, 60),
                    painter: _CitySkylinePainter(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu_rounded, color: Colors.white),
                          onPressed: () {},
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                              onPressed: () => context.push('/alerts'),
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_vert, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Portfolio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${NumberFormat('#,##0.00').format(balance)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'TOTAL BALANCE',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 400.ms);
      },
    );
  }

  Widget _buildSpendingBalanceCards(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final portfolio = portfolioState.portfolio;
        final totalValue = portfolio?.totalValue ?? 4011.0;
        // Calculate spending from negative PnL or use a default
        final spending = portfolio != null && portfolio.totalPnL < 0 
            ? portfolio.totalPnL.abs() 
            : totalValue * 0.32; // 32% of total as spending
        final balanceLeft = totalValue - spending;

        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Row(
            children: [
              Expanded(
                child: _buildSpendingCard(spending, totalValue)
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 400.ms)
                    .slideY(begin: 0.2, end: 0),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildBalanceCard(balanceLeft)
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 400.ms)
                    .slideY(begin: 0.2, end: 0),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSpendingCard(double spending, double total) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.cyan.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.attach_money_rounded,
              color: AppColors.cyan,
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'My Spending',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${NumberFormat('#,##0.00').format(spending)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'From Balance',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: CustomPaint(
              size: const Size(double.infinity, 40),
              painter: _WaveChartPainter(
                color: AppColors.cyan,
                isPositive: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(double balance) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.neonGreen.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              color: AppColors.neonGreen,
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Balance',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${NumberFormat('#,##0.00').format(balance)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Balance Left',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: CustomPaint(
              size: const Size(double.infinity, 40),
              painter: _WaveChartPainter(
                color: AppColors.neonGreen,
                isPositive: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        final transactions = state.transactions.take(3).toList();
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transaction',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push('/transactions'),
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: AppColors.cyan,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (transactions.isEmpty)
                _buildEmptyTransactions()
              else
                ...transactions.map((tx) => _buildTransactionItem(tx)),
            ],
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 400.ms);
      },
    );
  }

  Widget _buildTransactionItem(Transaction tx) {
    final isSuccess = tx.status == TransactionStatus.confirmed;
    final dateFormat = DateFormat('h:mma d-MMM-yyyy');
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _getTransactionColor(tx.type).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                _getTransactionIcon(tx.type),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.type.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateFormat.format(tx.timestamp),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${NumberFormat('#,##0.00').format(tx.amount.abs())}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                isSuccess ? 'Successful' : 'Failed',
                style: TextStyle(
                  color: isSuccess ? AppColors.neonGreen : AppColors.error,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyTransactions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              color: Colors.white.withValues(alpha: 0.3),
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'No transactions yet',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpendingAnalytics(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        final portfolio = state.portfolio;
        if (portfolio == null || portfolio.assets.isEmpty) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'My Spending',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.calendar_today_rounded,
                    color: AppColors.purple,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${DateFormat('MMM').format(DateTime.now().subtract(const Duration(days: 30))).toUpperCase()} - ${DateFormat('MMM yyyy').format(DateTime.now()).toUpperCase()}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildSpendingBreakdown(portfolio)
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 400.ms),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSpendingComparison(portfolio)
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 400.ms),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSpendingBreakdown(Portfolio portfolio) {
    // Group assets by category for spending breakdown
    final categories = _getSpendingCategories(portfolio);
    
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Breaking down your Spending',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: categories.asMap().entries.map((entry) {
                  final index = entry.key;
                  final category = entry.value;
                  return PieChartSectionData(
                    value: category['amount'] as double,
                    color: _getCategoryColor(index),
                    radius: 50,
                    title: '',
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...categories.asMap().entries.map((entry) {
            final index = entry.key;
            final category = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(
                    _getCategoryIcon(category['name'] as String),
                    color: _getCategoryColor(index),
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      category['name'] as String,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    '\$${NumberFormat('#,##0').format(category['amount'])}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSpendingComparison(Portfolio portfolio) {
    // Generate comparison data
    final thisMonth = portfolio.totalPnL < 0 
        ? portfolio.totalPnL.abs() 
        : portfolio.totalValue * 0.32;
    final lastMonth = thisMonth * 1.5; // Simulated last month data
    
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Spending - Compare to last month',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 0.3),
                      const FlSpot(1, 0.5),
                      const FlSpot(2, 0.4),
                      const FlSpot(3, 0.7),
                      const FlSpot(4, 0.6),
                      const FlSpot(5, 0.8),
                    ],
                    isCurved: true,
                    color: AppColors.cyan,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.cyan.withValues(alpha: 0.1),
                    ),
                  ),
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 0.5),
                      const FlSpot(1, 0.6),
                      const FlSpot(2, 0.7),
                      const FlSpot(3, 0.8),
                      const FlSpot(4, 0.9),
                      const FlSpot(5, 1.0),
                    ],
                    isCurved: true,
                    color: AppColors.purple.withValues(alpha: 0.5),
                    barWidth: 2,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.cyan,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'This Month',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '\$${NumberFormat('#,##0').format(thisMonth)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.purple.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Last Month',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '\$${NumberFormat('#,##0').format(lastMonth)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getSpendingCategories(Portfolio portfolio) {
    // Categorize spending by asset type
    final categories = <String, double>{};
    
    for (final asset in portfolio.assets) {
      final category = _getAssetCategory(asset.symbol);
      categories[category] = (categories[category] ?? 0) + asset.value;
    }
    
    return categories.entries.map((entry) => {
      'name': entry.key,
      'amount': entry.value,
    }).toList()..sort((a, b) => (b['amount'] as double).compareTo(a['amount'] as double));
  }

  String _getAssetCategory(String symbol) {
    if (['BTC', 'ETH', 'SOL'].contains(symbol)) return 'Crypto';
    if (['USDT', 'USDC', 'DAI'].contains(symbol)) return 'Stablecoins';
    return 'Other';
  }

  Color _getCategoryColor(int index) {
    final colors = [
      AppColors.cyan,
      AppColors.neonGreen,
      AppColors.purple,
      AppColors.neonMagenta,
    ];
    return colors[index % colors.length];
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Crypto':
        return Icons.currency_bitcoin_rounded;
      case 'Stablecoins':
        return Icons.account_balance_rounded;
      default:
        return Icons.category_rounded;
    }
  }

  Color _getTransactionColor(TransactionType type) {
    switch (type) {
      case TransactionType.send:
        return AppColors.error;
      case TransactionType.receive:
        return AppColors.neonGreen;
      case TransactionType.swap:
        return AppColors.cyan;
      default:
        return AppColors.purple;
    }
  }

  String _getTransactionIcon(TransactionType type) {
    switch (type) {
      case TransactionType.send:
        return '📤';
      case TransactionType.receive:
        return '📥';
      case TransactionType.swap:
        return '🔄';
      default:
        return '💸';
    }
  }
}

// City skyline painter for header background
class _CitySkylinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    
    // Draw building silhouettes
    final buildings = [30.0, 50.0, 40.0, 60.0, 35.0, 45.0, 55.0, 40.0, 50.0];
    var x = 0.0;
    final buildingWidth = size.width / buildings.length;
    
    for (final height in buildings) {
      path.lineTo(x, size.height - height);
      path.lineTo(x + buildingWidth, size.height - height);
      path.lineTo(x + buildingWidth, size.height);
      x += buildingWidth;
    }
    
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Wave chart painter for spending/balance cards
class _WaveChartPainter extends CustomPainter {
  final Color color;
  final bool isPositive;

  _WaveChartPainter({required this.color, required this.isPositive});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final points = isPositive
        ? [0.6, 0.5, 0.7, 0.4, 0.5, 0.6, 0.8, 0.5, 0.7, 0.9]
        : [0.4, 0.5, 0.3, 0.6, 0.5, 0.4, 0.2, 0.5, 0.3, 0.1];

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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


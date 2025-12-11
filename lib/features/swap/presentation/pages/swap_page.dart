// ============================================================================
// FILE: swap_page.dart
// PURPOSE: Token pairs list page with prices and mini charts
// DESIGN: Deep Glassmorphism - inspired by clean trading UI
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/avatar_3d.dart';
import '../../domain/entities/swap_entity.dart';
import '../bloc/swap_bloc.dart';
import '../widgets/swap_detail_sheet.dart';

class SwapPage extends StatefulWidget {
  const SwapPage({super.key});

  @override
  State<SwapPage> createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
  @override
  void initState() {
    super.initState();
    context.read<SwapBloc>().add(const SwapEvent.loadTokens());
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
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader()
                  .animate()
                  .fadeIn(duration: 400.ms),

              // Token Pairs List
              Expanded(
                child: _buildTokenPairsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Row(
        children: [
          // 3D Avatar
          const Avatar3D(
            size: 50,
            seed: 'trader-pro',
            style: AvatarStyle.funEmoji,
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
                    'Hi, Trader',
                    style: AppTypography.headlineMedium,
                  ),
                  const SizedBox(width: 6),
                  const Text('🚀', style: TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Ready to swap?',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text('💱', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
          const Spacer(),
          // Filter button with emoji
          GlassContainer(
            blur: 10,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(12),
            padding: const EdgeInsets.all(10),
            onTap: () {
              HapticFeedback.lightImpact();
            },
            child: const Text(
              '⚙️',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTokenPairsList() {
    return BlocBuilder<SwapBloc, SwapState>(
      builder: (context, state) {
        if (state.isLoadingTokens) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.neonGreen,
            ),
          );
        }

        if (state.availableTokens.isEmpty) {
          return Center(
            child: Text(
              'No tokens available',
              style: AppTypography.bodyMedium,
            ),
          );
        }

        // Create token pairs (token vs USD)
        final tokens = state.availableTokens;

        return ListView.builder(
          padding: AppSpacing.screenPadding,
          physics: const BouncingScrollPhysics(),
          itemCount: tokens.length,
          itemBuilder: (context, index) {
            final token = tokens[index];
            return _TokenPairCard(
              token: token,
              index: index,
              onTap: () {
                HapticFeedback.mediumImpact();
                _showSwapSheet(context, token, state.availableTokens);
              },
            ).animate(delay: Duration(milliseconds: 50 * index))
                .fadeIn(duration: 400.ms)
                .slideX(begin: 0.1, end: 0);
          },
        );
      },
    );
  }

  void _showSwapSheet(BuildContext context, SwapToken token, List<SwapToken> tokens) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<SwapBloc>(),
        child: SwapDetailSheet(
          initialFromToken: token,
          availableTokens: tokens,
        ),
      ),
    );
  }
}

class _TokenPairCard extends StatelessWidget {
  const _TokenPairCard({
    required this.token,
    required this.index,
    required this.onTap,
  });

  final SwapToken token;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Simulate price changes for demo
    final isPositive = index % 3 != 1;
    final changePercent = isPositive 
        ? (1.0 + (index * 0.42)) 
        : -(2.0 + (index * 0.71));

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: GlassCard(
        blur: 15,
        opacity: 0.06,
        padding: const EdgeInsets.all(AppSpacing.lg),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Token info row
            Row(
              children: [
                // Token icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getTokenColor(index).withValues(alpha: 0.2),
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
                
                // Pair name
                Text(
                  '${token.symbol}/USD',
                  style: AppTypography.titleLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const Spacer(),
                
                // Change percentage
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: (isPositive ? AppColors.neonGreen : AppColors.error)
                        .withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isPositive
                            ? Icons.arrow_drop_up_rounded
                            : Icons.arrow_drop_down_rounded,
                        color: isPositive ? AppColors.neonGreen : AppColors.error,
                        size: 18,
                      ),
                      Text(
                        '${changePercent.abs().toStringAsFixed(2)}%',
                        style: AppTypography.labelMedium.copyWith(
                          color: isPositive ? AppColors.neonGreen : AppColors.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppSpacing.md),
            
            // Price
            Text(
              '\$${token.priceUsd.toStringAsFixed(2)}',
              style: AppTypography.displaySmall.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            
            const SizedBox(height: AppSpacing.lg),
            
            // Mini chart
            SizedBox(
              height: 50,
              child: CustomPaint(
                size: const Size(double.infinity, 50),
                painter: _MiniChartPainter(
                  color: isPositive ? AppColors.neonGreen : AppColors.error,
                  isPositive: isPositive,
                  index: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultIcon() {
    return Center(
      child: Text(
        token.symbol.substring(0, token.symbol.length > 2 ? 2 : token.symbol.length),
        style: AppTypography.labelMedium.copyWith(
          color: _getTokenColor(index),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Color _getTokenColor(int index) {
    final colors = [
      AppColors.cyan,
      AppColors.neonGreen,
      AppColors.neonMagenta,
      AppColors.neonYellow,
      AppColors.purple,
      AppColors.mintNeon,
      AppColors.electricPink,
      AppColors.limeGlow,
    ];
    return colors[index % colors.length];
  }
}

/// Custom painter for smooth mini chart line
class _MiniChartPainter extends CustomPainter {
  _MiniChartPainter({
    required this.color,
    required this.isPositive,
    required this.index,
  });

  final Color color;
  final bool isPositive;
  final int index;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Generate unique wave pattern based on index
    final List<double> points;
    if (isPositive) {
      points = _generateUpwardPattern(index);
    } else {
      points = _generateDownwardPattern(index);
    }

    final path = Path();
    
    for (int i = 0; i < points.length; i++) {
      final x = (i / (points.length - 1)) * size.width;
      final y = size.height - (points[i] * size.height);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        // Use quadratic bezier for smooth curves
        final prevX = ((i - 1) / (points.length - 1)) * size.width;
        final prevY = size.height - (points[i - 1] * size.height);
        final midX = (prevX + x) / 2;
        final midY = (prevY + y) / 2;
        
        if (i == 1) {
          path.quadraticBezierTo(prevX, prevY, midX, midY);
        } else {
          path.quadraticBezierTo(prevX, prevY, midX, midY);
        }
        
        if (i == points.length - 1) {
          path.lineTo(x, y);
        }
      }
    }

    // Draw gradient fill below the line
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
          color.withValues(alpha: 0.05),
          color.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
    
    // Draw the line
    canvas.drawPath(path, paint);
    
    // Draw end point circle
    final lastX = size.width;
    final lastY = size.height - (points.last * size.height);
    
    // Glow
    canvas.drawCircle(
      Offset(lastX, lastY),
      6,
      Paint()
        ..color = color.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );
    
    // Point
    canvas.drawCircle(
      Offset(lastX, lastY),
      4,
      Paint()..color = color,
    );
    
    // Inner white dot
    canvas.drawCircle(
      Offset(lastX, lastY),
      2,
      Paint()..color = Colors.white,
    );
  }

  List<double> _generateUpwardPattern(int seed) {
    // Different patterns based on seed
    final patterns = [
      [0.3, 0.35, 0.4, 0.35, 0.5, 0.55, 0.6, 0.55, 0.7, 0.8],
      [0.4, 0.45, 0.4, 0.5, 0.55, 0.5, 0.65, 0.7, 0.75, 0.85],
      [0.35, 0.4, 0.5, 0.45, 0.55, 0.6, 0.55, 0.7, 0.75, 0.9],
      [0.3, 0.4, 0.35, 0.45, 0.5, 0.6, 0.65, 0.6, 0.75, 0.82],
    ];
    return patterns[seed % patterns.length];
  }

  List<double> _generateDownwardPattern(int seed) {
    final patterns = [
      [0.8, 0.75, 0.7, 0.75, 0.6, 0.55, 0.5, 0.45, 0.35, 0.3],
      [0.7, 0.65, 0.7, 0.6, 0.55, 0.5, 0.45, 0.4, 0.35, 0.25],
      [0.75, 0.7, 0.65, 0.7, 0.55, 0.5, 0.55, 0.4, 0.3, 0.2],
    ];
    return patterns[seed % patterns.length];
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

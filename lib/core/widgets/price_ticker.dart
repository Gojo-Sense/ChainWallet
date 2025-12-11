// ============================================================================
// FILE: price_ticker.dart
// PURPOSE: Animated scrolling price ticker marquee
// DESIGN: Glass bar with neon text
// ============================================================================

import 'dart:async';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PriceTicker extends StatefulWidget {
  final List<TickerItem> items;
  final double height;
  final Duration scrollDuration;

  const PriceTicker({
    super.key,
    required this.items,
    this.height = 36,
    this.scrollDuration = const Duration(seconds: 30),
  });

  @override
  State<PriceTicker> createState() => _PriceTickerState();
}

class _PriceTickerState extends State<PriceTicker> {
  late ScrollController _scrollController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startScrolling() {
    if (!mounted) return;

    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!_scrollController.hasClients) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;

      if (currentScroll >= maxScroll) {
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(currentScroll + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Double the items for seamless loop
    final displayItems = [...widget.items, ...widget.items];

    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.abyss,
            AppColors.glassBg,
            AppColors.abyss,
          ],
        ),
        border: Border(
          top: BorderSide(color: AppColors.glassBorder),
          bottom: BorderSide(color: AppColors.glassBorder),
        ),
      ),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: displayItems.length,
        itemBuilder: (context, index) {
          final item = displayItems[index];
          return _TickerItemWidget(item: item);
        },
      ),
    );
  }
}

class _TickerItemWidget extends StatelessWidget {
  final TickerItem item;

  const _TickerItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final isPositive = item.changePercent >= 0;
    final changeColor = isPositive ? AppColors.neonGreen : AppColors.error;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Symbol
          Text(
            item.symbol,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 8),
          // Price
          Text(
            item.formattedPrice,
            style: TextStyle(
              color: Colors.white.withAlpha(200),
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 6),
          // Change
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: changeColor.withAlpha(30),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: changeColor,
                  size: 10,
                ),
                const SizedBox(width: 2),
                Text(
                  '${isPositive ? '+' : ''}${item.changePercent.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: changeColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Separator
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(30),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

/// Ticker item data class
class TickerItem {
  final String symbol;
  final double price;
  final double changePercent;
  final String? id;

  const TickerItem({
    required this.symbol,
    required this.price,
    required this.changePercent,
    this.id,
  });

  String get formattedPrice {
    if (price >= 1000) {
      return '\$${(price / 1000).toStringAsFixed(2)}K';
    } else if (price >= 1) {
      return '\$${price.toStringAsFixed(2)}';
    } else {
      return '\$${price.toStringAsFixed(4)}';
    }
  }
}



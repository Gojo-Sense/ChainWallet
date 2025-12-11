// ============================================================================
// FILE: portfolio_repository_impl.dart
// PURPOSE: Mock implementation of portfolio repository
// ============================================================================

import 'dart:convert';
import 'dart:math';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/portfolio_entity.dart';
import '../../domain/repositories/i_portfolio_repository.dart';

@LazySingleton(as: IPortfolioRepository)
class PortfolioRepositoryImpl implements IPortfolioRepository {
  final Random _random = Random();
  static const String _snapshotsBoxName = 'portfolio_snapshots';
  
  Box? _snapshotsBox;
  
  Future<Box> get _snapshotsBoxInstance async {
    _snapshotsBox ??= await Hive.openBox(_snapshotsBoxName);
    return _snapshotsBox!;
  }

  @override
  Future<Either<PortfolioFailure, Portfolio>> getPortfolio() async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock portfolio data
    final assets = [
      PortfolioAsset(
        id: 'bitcoin',
        symbol: 'BTC',
        name: 'Bitcoin',
        amount: 0.0521,
        value: 5120.32,
        price: 98278.50,
        pnL: 520.45,
        pnLPercentage: 11.32,
        allocation: 0.42,
        imageUrl: 'https://cryptologos.cc/logos/bitcoin-btc-logo.png',
      ),
      PortfolioAsset(
        id: 'ethereum',
        symbol: 'ETH',
        name: 'Ethereum',
        amount: 1.24,
        value: 4560.80,
        price: 3678.06,
        pnL: 340.20,
        pnLPercentage: 8.06,
        allocation: 0.37,
        imageUrl: 'https://cryptologos.cc/logos/ethereum-eth-logo.png',
      ),
      PortfolioAsset(
        id: 'solana',
        symbol: 'SOL',
        name: 'Solana',
        amount: 8.5,
        value: 1912.50,
        price: 225.00,
        pnL: -45.30,
        pnLPercentage: -2.31,
        allocation: 0.16,
        imageUrl: 'https://cryptologos.cc/logos/solana-sol-logo.png',
      ),
      PortfolioAsset(
        id: 'dogecoin',
        symbol: 'DOGE',
        name: 'Dogecoin',
        amount: 1200,
        value: 504.00,
        price: 0.42,
        pnL: 84.00,
        pnLPercentage: 20.00,
        allocation: 0.04,
        imageUrl: 'https://cryptologos.cc/logos/dogecoin-doge-logo.png',
      ),
      PortfolioAsset(
        id: 'cardano',
        symbol: 'ADA',
        name: 'Cardano',
        amount: 120,
        value: 129.60,
        price: 1.08,
        pnL: 12.40,
        pnLPercentage: 10.57,
        allocation: 0.01,
        imageUrl: 'https://cryptologos.cc/logos/cardano-ada-logo.png',
      ),
    ];

    final totalValue = assets.fold(0.0, (sum, a) => sum + a.value);
    final totalPnL = assets.fold(0.0, (sum, a) => sum + a.pnL);

    // Get or generate history
    final history = await _getOrGenerateHistory(30, totalValue);

    final portfolio = Portfolio(
      totalValue: totalValue,
      totalPnL: totalPnL,
      pnLPercentage: (totalPnL / (totalValue - totalPnL)) * 100,
      assets: assets,
      history: history,
    );
    
    // Save current snapshot to Hive
    await _saveSnapshot(PortfolioSnapshot(
      timestamp: DateTime.now(),
      value: totalValue,
    ));

    return right(portfolio);
  }

  @override
  Future<Either<PortfolioFailure, List<PortfolioSnapshot>>> getHistory(
    PortfolioTimeRange range,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final days = switch (range) {
      PortfolioTimeRange.day => 1,
      PortfolioTimeRange.week => 7,
      PortfolioTimeRange.month => 30,
      PortfolioTimeRange.threeMonths => 90,
      PortfolioTimeRange.year => 365,
      PortfolioTimeRange.all => 365,
    };

    final history = await _getOrGenerateHistory(days, 12227.22);
    return right(history);
  }
  
  /// Get history from Hive or generate if empty
  Future<List<PortfolioSnapshot>> _getOrGenerateHistory(int days, double currentValue) async {
    try {
      final box = await _snapshotsBoxInstance;
      final cachedKey = 'history_$days';
      
      // Try to get from cache
      final cached = box.get(cachedKey);
      if (cached != null) {
        final List<dynamic> jsonList = jsonDecode(cached as String);
        return jsonList
            .map((json) => PortfolioSnapshot(
                  timestamp: DateTime.parse(json['timestamp'] as String),
                  value: (json['value'] as num).toDouble(),
                ))
            .toList();
      }
      
      // Generate new history
      final history = _generateMockHistory(days, currentValue);
      
      // Cache it
      final jsonList = history.map((s) => {
        'timestamp': s.timestamp.toIso8601String(),
        'value': s.value,
      }).toList();
      await box.put(cachedKey, jsonEncode(jsonList));
      
      return history;
    } catch (e) {
      // Fallback to generating
      return _generateMockHistory(days, currentValue);
    }
  }
  
  /// Save a portfolio snapshot
  Future<void> _saveSnapshot(PortfolioSnapshot snapshot) async {
    try {
      final box = await _snapshotsBoxInstance;
      final key = snapshot.timestamp.toIso8601String();
      await box.put(key, jsonEncode({
        'timestamp': snapshot.timestamp.toIso8601String(),
        'value': snapshot.value,
      }));
    } catch (e) {
      // Handle error silently
    }
  }

  List<PortfolioSnapshot> _generateMockHistory(int days, double currentValue) {
    final snapshots = <PortfolioSnapshot>[];
    final now = DateTime.now();
    var value = currentValue * 0.85; // Start from 85% of current

    for (int i = days; i >= 0; i--) {
      final change = (_random.nextDouble() - 0.45) * (currentValue * 0.02);
      value = (value + change).clamp(currentValue * 0.7, currentValue * 1.1);

      snapshots.add(PortfolioSnapshot(
        timestamp: now.subtract(Duration(days: i)),
        value: value,
      ));
    }

    // Ensure last value matches current
    if (snapshots.isNotEmpty) {
      snapshots[snapshots.length - 1] = PortfolioSnapshot(
        timestamp: now,
        value: currentValue,
      );
    }

    return snapshots;
  }
}



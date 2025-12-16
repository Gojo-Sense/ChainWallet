// ============================================================================
// FILE: mock_chart_api.dart
// PURPOSE: Mock chart API for fallback when real APIs fail
// FEATURES:
//   - Generates realistic-looking chart data
//   - Works offline
//   - Ensures charts always display something
// ============================================================================

import 'dart:math';
import 'package:injectable/injectable.dart';

/// Mock chart API for generating realistic chart data
@lazySingleton
class MockChartApi {
  final Random _random = Random();
  
  /// Generate mock price chart data
  Future<Map<String, dynamic>> getMarketChart({
    required String id,
    String vsCurrency = 'usd',
    int days = 7,
  }) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 300 + _random.nextInt(500)));
    
    // Generate mock price data
    final prices = <List<dynamic>>[];
    final volumes = <List<dynamic>>[];
    
    // Start with a base price
    double currentPrice = 1000 + _random.nextDouble() * 50000;
    
    // Generate data points for the specified number of days
    final dataPoints = days <= 1 ? 24 : days * 24; // hourly data
    
    for (int i = 0; i < dataPoints; i++) {
      // Timestamp (milliseconds since epoch)
      final timestamp = DateTime.now().subtract(Duration(hours: dataPoints - i)).millisecondsSinceEpoch;
      
      // Generate small price fluctuations
      final changePercent = (_random.nextDouble() - 0.5) * 0.1; // -5% to +5%
      currentPrice = currentPrice * (1 + changePercent);
      
      // Ensure price doesn't go negative
      currentPrice = max(currentPrice, 1);
      
      // Add some noise
      final noise = (_random.nextDouble() - 0.5) * currentPrice * 0.02;
      final priceWithNoise = currentPrice + noise;
      
      prices.add([timestamp, priceWithNoise]);
      
      // Generate mock volume data
      final volume = currentPrice * (1000 + _random.nextDouble() * 10000);
      volumes.add([timestamp, volume]);
    }
    
    return {
      'prices': prices,
      'total_volumes': volumes,
    };
  }
  
  /// Generate mock top tokens data
  Future<List<dynamic>> getCoinsMarkets({
    String vsCurrency = 'usd',
    String order = 'market_cap_desc',
    int perPage = 20,
    int page = 1,
    bool sparkline = false,
  }) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 200 + _random.nextInt(300)));
    
    // Popular cryptocurrencies with realistic data
    final mockTokens = [
      {
        'id': 'bitcoin',
        'symbol': 'btc',
        'name': 'Bitcoin',
        'image': 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
        'current_price': 98500.0 + _random.nextDouble() * 2000 - 1000,
        'market_cap': 1900000000000.0 + _random.nextDouble() * 100000000000,
        'market_cap_rank': 1,
        'fully_diluted_valuation': 2100000000000.0,
        'total_volume': 35000000000.0 + _random.nextDouble() * 5000000000,
        'high_24h': 100000.0 + _random.nextDouble() * 2000,
        'low_24h': 97000.0 + _random.nextDouble() * 2000,
        'price_change_24h': -500.0 + _random.nextDouble() * 1000,
        'price_change_percentage_24h': -2.0 + _random.nextDouble() * 4,
        'market_cap_change_24h': -10000000000.0 + _random.nextDouble() * 20000000000,
        'market_cap_change_percentage_24h': -0.5 + _random.nextDouble() * 1,
        'circulating_supply': 19500000.0 + _random.nextDouble() * 100000,
        'total_supply': 21000000.0,
        'max_supply': 21000000.0,
        'ath': 100000.0,
        'ath_change_percentage': -1.5,
        'ath_date': '2024-11-09T00:00:00.000Z',
        'atl': 0.067,
        'atl_change_percentage': 147000000.0,
        'atl_date': '2013-07-05T00:00:00.000Z',
        'roi': null,
        'last_updated': '2024-12-13T10:00:00.000Z',
      },
      {
        'id': 'ethereum',
        'symbol': 'eth',
        'name': 'Ethereum',
        'image': 'https://assets.coingecko.com/coins/images/279/large/ethereum.png',
        'current_price': 3680.0 + _random.nextDouble() * 200 - 100,
        'market_cap': 450000000000.0 + _random.nextDouble() * 20000000000,
        'market_cap_rank': 2,
        'fully_diluted_valuation': 450000000000.0,
        'total_volume': 15000000000.0 + _random.nextDouble() * 3000000000,
        'high_24h': 3750.0 + _random.nextDouble() * 100,
        'low_24h': 3600.0 + _random.nextDouble() * 100,
        'price_change_24h': -20.0 + _random.nextDouble() * 40,
        'price_change_percentage_24h': -0.5 + _random.nextDouble() * 1,
        'market_cap_change_24h': -2000000000.0 + _random.nextDouble() * 4000000000,
        'market_cap_change_percentage_24h': -0.4 + _random.nextDouble() * 0.8,
        'circulating_supply': 122000000.0 + _random.nextDouble() * 1000000,
        'total_supply': 122000000.0,
        'max_supply': null,
        'ath': 4878.26,
        'ath_change_percentage': -24.5,
        'ath_date': '2021-11-10T00:00:00.000Z',
        'atl': 0.43,
        'atl_change_percentage': 855000.0,
        'atl_date': '2015-10-20T00:00:00.000Z',
        'roi': {
          'times': 85.0,
          'currency': 'btc',
          'percentage': 8500.0
        },
        'last_updated': '2024-12-13T10:00:00.000Z',
      },
      {
        'id': 'solana',
        'symbol': 'sol',
        'name': 'Solana',
        'image': 'https://assets.coingecko.com/coins/images/4128/large/solana.png',
        'current_price': 225.0 + _random.nextDouble() * 40 - 20,
        'market_cap': 110000000000.0 + _random.nextDouble() * 10000000000,
        'market_cap_rank': 3,
        'fully_diluted_valuation': 130000000000.0,
        'total_volume': 3500000000.0 + _random.nextDouble() * 1000000000,
        'high_24h': 240.0 + _random.nextDouble() * 10,
        'low_24h': 215.0 + _random.nextDouble() * 10,
        'price_change_24h': -5.0 + _random.nextDouble() * 10,
        'price_change_percentage_24h': -2.2 + _random.nextDouble() * 4.4,
        'market_cap_change_24h': -2000000000.0 + _random.nextDouble() * 4000000000,
        'market_cap_change_percentage_24h': -1.8 + _random.nextDouble() * 3.6,
        'circulating_supply': 480000000.0 + _random.nextDouble() * 20000000,
        'total_supply': 550000000.0,
        'max_supply': null,
        'ath': 260.0,
        'ath_change_percentage': -13.5,
        'ath_date': '2021-11-06T00:00:00.000Z',
        'atl': 0.53,
        'atl_change_percentage': 42000.0,
        'atl_date': '2020-05-11T00:00:00.000Z',
        'roi': null,
        'last_updated': '2024-12-13T10:00:00.000Z',
      },
      {
        'id': 'cardano',
        'symbol': 'ada',
        'name': 'Cardano',
        'image': 'https://assets.coingecko.com/coins/images/975/large/cardano.png',
        'current_price': 1.25 + _random.nextDouble() * 0.4 - 0.2,
        'market_cap': 45000000000.0 + _random.nextDouble() * 5000000000,
        'market_cap_rank': 4,
        'fully_diluted_valuation': 60000000000.0,
        'total_volume': 1200000000.0 + _random.nextDouble() * 400000000,
        'high_24h': 1.30 + _random.nextDouble() * 0.05,
        'low_24h': 1.20 + _random.nextDouble() * 0.05,
        'price_change_24h': 0.02 + _random.nextDouble() * 0.04,
        'price_change_percentage_24h': 1.6 + _random.nextDouble() * 3.2,
        'market_cap_change_24h': 700000000.0 + _random.nextDouble() * 1400000000,
        'market_cap_change_percentage_24h': 1.6 + _random.nextDouble() * 3.2,
        'circulating_supply': 36000000000.0 + _random.nextDouble() * 1000000000,
        'total_supply': 45000000000.0,
        'max_supply': 45000000000.0,
        'ath': 3.09,
        'ath_change_percentage': -59.5,
        'ath_date': '2021-09-02T00:00:00.000Z',
        'atl': 0.018,
        'atl_change_percentage': 6800.0,
        'atl_date': '2020-03-13T00:00:00.000Z',
        'roi': null,
        'last_updated': '2024-12-13T10:00:00.000Z',
      },
      {
        'id': 'avalanche',
        'symbol': 'avax',
        'name': 'Avalanche',
        'image': 'https://assets.coingecko.com/coins/images/12559/large/coin-round-red.png',
        'current_price': 125.0 + _random.nextDouble() * 40 - 20,
        'market_cap': 20000000000.0 + _random.nextDouble() * 5000000000,
        'market_cap_rank': 5,
        'fully_diluted_valuation': 30000000000.0,
        'total_volume': 800000000.0 + _random.nextDouble() * 400000000,
        'high_24h': 135.0 + _random.nextDouble() * 10,
        'low_24h': 120.0 + _random.nextDouble() * 10,
        'price_change_24h': -3.0 + _random.nextDouble() * 6,
        'price_change_percentage_24h': -2.3 + _random.nextDouble() * 4.6,
        'market_cap_change_24h': -500000000.0 + _random.nextDouble() * 1000000000,
        'market_cap_change_percentage_24h': -2.4 + _random.nextDouble() * 4.8,
        'circulating_supply': 160000000.0 + _random.nextDouble() * 5000000,
        'total_supply': 240000000.0,
        'max_supply': 720000000.0,
        'ath': 147.0,
        'ath_change_percentage': -15.0,
        'ath_date': '2021-11-21T00:00:00.000Z',
        'atl': 1.08,
        'atl_change_percentage': 11400.0,
        'atl_date': '2020-12-31T00:00:00.000Z',
        'roi': null,
        'last_updated': '2024-12-13T10:00:00.000Z',
      },
    ];
    
    // Return only the requested number of tokens
    return mockTokens.take(min(mockTokens.length, perPage)).toList();
  }
  
  /// Generate mock simple price data
  Future<Map<String, dynamic>> getSimplePrice({
    required List<String> ids,
    String vsCurrency = 'usd',
    bool include24hChange = true,
    bool includeMarketCap = true,
    bool include24hVol = true,
  }) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 100 + _random.nextInt(200)));
    
    final result = <String, dynamic>{};
    
    for (final id in ids) {
      result[id] = {
        'usd': 1000 + _random.nextDouble() * 50000,
        'usd_24h_change': -5.0 + _random.nextDouble() * 10,
      };
    }
    
    return result;
  }
}
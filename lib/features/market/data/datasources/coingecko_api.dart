// ============================================================================
// FILE: coingecko_api.dart
// PURPOSE: CoinGecko API client for fetching cryptocurrency data
// ENDPOINTS:
//   - /simple/price - Get current prices
//   - /coins/{id}/market_chart - Get price history
//   - /coins/markets - Get top tokens
// ============================================================================

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// CoinGecko API endpoints
abstract class CoinGeckoEndpoints {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';
  static const String simplePrice = '/simple/price';
  static const String coinsMarkets = '/coins/markets';
  static String coinMarketChart(String id) => '/coins/$id/market_chart';
  static String coinDetails(String id) => '/coins/$id';
}

/// CoinGecko API client
@lazySingleton
class CoinGeckoApi {
  CoinGeckoApi(this._dio);

  final Dio _dio;

  /// Get current prices for multiple tokens
  Future<Map<String, dynamic>> getSimplePrice({
    required List<String> ids,
    String vsCurrency = 'usd',
    bool include24hChange = true,
    bool includeMarketCap = true,
    bool include24hVol = true,
  }) async {
    final response = await _dio.get(
      CoinGeckoEndpoints.simplePrice,
      queryParameters: {
        'ids': ids.join(','),
        'vs_currencies': vsCurrency,
        'include_24hr_change': include24hChange,
        'include_market_cap': includeMarketCap,
        'include_24hr_vol': include24hVol,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  /// Get top tokens by market cap
  Future<List<dynamic>> getCoinsMarkets({
    String vsCurrency = 'usd',
    String order = 'market_cap_desc',
    int perPage = 20,
    int page = 1,
    bool sparkline = false,
  }) async {
    final response = await _dio.get(
      CoinGeckoEndpoints.coinsMarkets,
      queryParameters: {
        'vs_currency': vsCurrency,
        'order': order,
        'per_page': perPage,
        'page': page,
        'sparkline': sparkline,
      },
    );
    return response.data as List<dynamic>;
  }

  /// Get price chart data for a specific coin
  Future<Map<String, dynamic>> getMarketChart({
    required String id,
    String vsCurrency = 'usd',
    int days = 7,
  }) async {
    final response = await _dio.get(
      CoinGeckoEndpoints.coinMarketChart(id),
      queryParameters: {
        'vs_currency': vsCurrency,
        'days': days,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  /// Get detailed coin information
  Future<Map<String, dynamic>> getCoinDetails({
    required String id,
    bool localization = false,
    bool tickers = false,
    bool marketData = true,
    bool communityData = false,
    bool developerData = false,
  }) async {
    final response = await _dio.get(
      CoinGeckoEndpoints.coinDetails(id),
      queryParameters: {
        'localization': localization,
        'tickers': tickers,
        'market_data': marketData,
        'community_data': communityData,
        'developer_data': developerData,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  /// Search for coins
  Future<Map<String, dynamic>> searchCoins(String query) async {
    final response = await _dio.get(
      '/search',
      queryParameters: {'query': query},
    );
    return response.data as Map<String, dynamic>;
  }
}

/// Module for registering Dio client
@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: CoinGeckoEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Accept': 'application/json',
          },
        ),
      )..interceptors.add(LogInterceptor(
          requestBody: false,
          responseBody: false,
        ));
}


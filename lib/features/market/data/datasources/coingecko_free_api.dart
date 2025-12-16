// ============================================================================
// FILE: coingecko_free_api.dart
// PURPOSE: CoinGecko Free API client with improved error handling and retry logic
// FEATURES:
//   - Free tier usage with rate limiting awareness
//   - Retry mechanism for failed requests
//   - Better error handling and fallback strategies
// ============================================================================

import 'dart:math';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// CoinGecko Free API endpoints
abstract class CoinGeckoFreeEndpoints {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';
  static const String simplePrice = '/simple/price';
  static const String coinsMarkets = '/coins/markets';
  static String coinMarketChart(String id) => '/coins/$id/market_chart';
  static String coinDetails(String id) => '/coins/$id';
}

/// CoinGecko Free API client with enhanced reliability
@lazySingleton
class CoinGeckoFreeApi {
  CoinGeckoFreeApi(this._dio);

  final Dio _dio;
  
  // Rate limiting tracking
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 1);
  final Random _random = Random();

  /// Get current prices for multiple tokens with retry logic
  Future<Map<String, dynamic>> getSimplePrice({
    required List<String> ids,
    String vsCurrency = 'usd',
    bool include24hChange = true,
    bool includeMarketCap = true,
    bool include24hVol = true,
  }) async {
    int attempts = 0;
    
    while (attempts < _maxRetries) {
      try {
        final response = await _dio.get(
          CoinGeckoFreeEndpoints.simplePrice,
          queryParameters: {
            'ids': ids.join(','),
            'vs_currencies': vsCurrency,
            'include_24hr_change': include24hChange,
            'include_market_cap': includeMarketCap,
            'include_24hr_vol': include24hVol,
          },
        );
        return response.data as Map<String, dynamic>;
      } on DioException catch (e) {
        attempts++;
        
        // If it's a rate limit error, wait longer before retrying
        if (e.response?.statusCode == 429) {
          final delay = _retryDelay * pow(2, attempts).toInt() + 
                       Duration(milliseconds: _random.nextInt(1000));
          await Future.delayed(delay);
          continue;
        }
        
        // For other errors, retry with exponential backoff
        if (attempts < _maxRetries) {
          final delay = _retryDelay * pow(2, attempts).toInt();
          await Future.delayed(delay);
          continue;
        }
        
        rethrow;
      }
    }
    
    throw DioException(requestOptions: RequestOptions(path: ''));
  }

  /// Get top tokens by market cap with retry logic
  Future<List<dynamic>> getCoinsMarkets({
    String vsCurrency = 'usd',
    String order = 'market_cap_desc',
    int perPage = 20,
    int page = 1,
    bool sparkline = false,
  }) async {
    int attempts = 0;
    
    while (attempts < _maxRetries) {
      try {
        final response = await _dio.get(
          CoinGeckoFreeEndpoints.coinsMarkets,
          queryParameters: {
            'vs_currency': vsCurrency,
            'order': order,
            'per_page': perPage,
            'page': page,
            'sparkline': sparkline,
          },
        );
        return response.data as List<dynamic>;
      } on DioException catch (e) {
        attempts++;
        
        // If it's a rate limit error, wait longer before retrying
        if (e.response?.statusCode == 429) {
          final delay = _retryDelay * pow(2, attempts).toInt() + 
                       Duration(milliseconds: _random.nextInt(1000));
          await Future.delayed(delay);
          continue;
        }
        
        // For other errors, retry with exponential backoff
        if (attempts < _maxRetries) {
          final delay = _retryDelay * pow(2, attempts).toInt();
          await Future.delayed(delay);
          continue;
        }
        
        rethrow;
      }
    }
    
    throw DioException(requestOptions: RequestOptions(path: ''));
  }

  /// Get price chart data for a specific coin with retry logic
  Future<Map<String, dynamic>> getMarketChart({
    required String id,
    String vsCurrency = 'usd',
    int days = 7,
  }) async {
    int attempts = 0;
    
    while (attempts < _maxRetries) {
      try {
        final response = await _dio.get(
          CoinGeckoFreeEndpoints.coinMarketChart(id),
          queryParameters: {
            'vs_currency': vsCurrency,
            'days': days,
          },
        );
        return response.data as Map<String, dynamic>;
      } on DioException catch (e) {
        attempts++;
        
        // If it's a rate limit error, wait longer before retrying
        if (e.response?.statusCode == 429) {
          final delay = _retryDelay * pow(2, attempts).toInt() + 
                       Duration(milliseconds: _random.nextInt(1000));
          await Future.delayed(delay);
          continue;
        }
        
        // For other errors, retry with exponential backoff
        if (attempts < _maxRetries) {
          final delay = _retryDelay * pow(2, attempts).toInt();
          await Future.delayed(delay);
          continue;
        }
        
        rethrow;
      }
    }
    
    throw DioException(requestOptions: RequestOptions(path: ''));
  }

  /// Get detailed coin information with retry logic
  Future<Map<String, dynamic>> getCoinDetails({
    required String id,
    bool localization = false,
    bool tickers = false,
    bool marketData = true,
    bool communityData = false,
    bool developerData = false,
  }) async {
    int attempts = 0;
    
    while (attempts < _maxRetries) {
      try {
        final response = await _dio.get(
          CoinGeckoFreeEndpoints.coinDetails(id),
          queryParameters: {
            'localization': localization,
            'tickers': tickers,
            'market_data': marketData,
            'community_data': communityData,
            'developer_data': developerData,
          },
        );
        return response.data as Map<String, dynamic>;
      } on DioException catch (e) {
        attempts++;
        
        // If it's a rate limit error, wait longer before retrying
        if (e.response?.statusCode == 429) {
          final delay = _retryDelay * pow(2, attempts).toInt() + 
                       Duration(milliseconds: _random.nextInt(1000));
          await Future.delayed(delay);
          continue;
        }
        
        // For other errors, retry with exponential backoff
        if (attempts < _maxRetries) {
          final delay = _retryDelay * pow(2, attempts).toInt();
          await Future.delayed(delay);
          continue;
        }
        
        rethrow;
      }
    }
    
    throw DioException(requestOptions: RequestOptions(path: ''));
  }

  /// Search for coins with retry logic
  Future<Map<String, dynamic>> searchCoins(String query) async {
    int attempts = 0;
    
    while (attempts < _maxRetries) {
      try {
        final response = await _dio.get(
          '/search',
          queryParameters: {'query': query},
        );
        return response.data as Map<String, dynamic>;
      } on DioException catch (e) {
        attempts++;
        
        // If it's a rate limit error, wait longer before retrying
        if (e.response?.statusCode == 429) {
          final delay = _retryDelay * pow(2, attempts).toInt() + 
                       Duration(milliseconds: _random.nextInt(1000));
          await Future.delayed(delay);
          continue;
        }
        
        // For other errors, retry with exponential backoff
        if (attempts < _maxRetries) {
          final delay = _retryDelay * pow(2, attempts).toInt();
          await Future.delayed(delay);
          continue;
        }
        
        rethrow;
      }
    }
    
    throw DioException(requestOptions: RequestOptions(path: ''));
  }
}
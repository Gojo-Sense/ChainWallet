// ============================================================================
// FILE: market_repository_impl.dart
// PURPOSE: Implementation of IMarketRepository using CoinGecko API
// PATTERN: Returns Either<Failure, Success> for all operations
// ============================================================================

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/token_entity.dart';
import '../../domain/failures/market_failure.dart';
import '../../domain/repositories/i_market_repository.dart';
import '../datasources/coingecko_api.dart';
import '../datasources/binance_websocket_api.dart';
import '../datasources/mock_chart_api.dart';
import '../../../../core/services/websocket_service.dart';
import '../models/token_model.dart';

@LazySingleton(as: IMarketRepository)
class MarketRepositoryImpl implements IMarketRepository {
  MarketRepositoryImpl(this._api, this._wsApi, this._mockApi, this._webSocketService);

  final CoinGeckoApi _api;
  final BinanceWebSocketApi _wsApi;
  final MockChartApi _mockApi;
  final WebSocketService _webSocketService;
  static const String _cacheBoxName = 'market_cache';
  static const Duration _cacheExpiry = Duration(minutes: 5);
  
  Box? _cacheBox;
  
  Future<Box> get _cacheBoxInstance async {
    _cacheBox ??= await Hive.openBox(_cacheBoxName);
    return _cacheBox!;
  }

  @override
  Future<Either<MarketFailure, List<TokenEntity>>> getTokenPrices(
    List<String> tokenIds,
  ) async {
    try {
      final response = await _api.getSimplePrice(ids: tokenIds);

      final tokens = tokenIds.map((id) {
        final data = response[id] as Map<String, dynamic>?;
        if (data == null) {
          return TokenEntity(
            id: id,
            symbol: id.toUpperCase(),
            name: id,
            currentPrice: 0,
            priceChangePercentage24h: 0,
          );
        }

        return SimplePriceModel.fromJson(id, data).toEntity();
      }).toList();

      return right(tokens);
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(MarketFailure.invalidResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<MarketFailure, TokenEntity>> getTokenDetails(
    String tokenId,
  ) async {
    try {
      final response = await _api.getCoinDetails(id: tokenId);

      final marketData = response['market_data'] as Map<String, dynamic>?;

      final token = TokenEntity(
        id: response['id'] as String,
        symbol: (response['symbol'] as String).toUpperCase(),
        name: response['name'] as String,
        currentPrice:
            (marketData?['current_price']?['usd'] as num?)?.toDouble() ?? 0,
        priceChangePercentage24h:
            (marketData?['price_change_percentage_24h'] as num?)?.toDouble() ??
                0,
        image: (response['image'] as Map<String, dynamic>?)?['large'] as String?,
        marketCap: (marketData?['market_cap']?['usd'] as num?)?.toDouble(),
        volume24h: (marketData?['total_volume']?['usd'] as num?)?.toDouble(),
        high24h: (marketData?['high_24h']?['usd'] as num?)?.toDouble(),
        low24h: (marketData?['low_24h']?['usd'] as num?)?.toDouble(),
      );

      return right(token);
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(MarketFailure.invalidResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<MarketFailure, MarketChartEntity>> getMarketChart(
    String tokenId, {
    int days = 7,
  }) async {
    try {
      final response = await _api.getMarketChart(id: tokenId, days: days);

      final pricesData = response['prices'] as List<dynamic>?;
      if (pricesData == null || pricesData.isEmpty) {
        // Fallback to mock data
        return await _getMockMarketChart(tokenId, days: days);
      }

      final prices = pricesData.map((item) {
        final data = item as List<dynamic>;
        return PricePoint(
          timestamp: DateTime.fromMillisecondsSinceEpoch(
            (data[0] as num).toInt(),
          ),
          price: (data[1] as num).toDouble(),
        );
      }).toList();

      final chart = MarketChartEntity(
        tokenId: tokenId,
        prices: prices,
        startTime: prices.first.timestamp,
        endTime: prices.last.timestamp,
      );

      return right(chart);
    } on DioException catch (e) {
      // Fallback to mock data on network errors
      return await _getMockMarketChart(tokenId, days: days);
    } catch (e) {
      // Fallback to mock data on any other errors
      return await _getMockMarketChart(tokenId, days: days);
    }
  }

  /// Get mock market chart data as fallback
  Future<Either<MarketFailure, MarketChartEntity>> _getMockMarketChart(
    String tokenId, {
    int days = 7,
  }) async {
    try {
      final response = await _mockApi.getMarketChart(id: tokenId, days: days);

      final pricesData = response['prices'] as List<dynamic>?;
      if (pricesData == null || pricesData.isEmpty) {
        return left(const MarketFailure.invalidResponse(
          message: 'No price data available',
        ));
      }

      final prices = pricesData.map((item) {
        final data = item as List<dynamic>;
        return PricePoint(
          timestamp: DateTime.fromMillisecondsSinceEpoch(
            (data[0] as num).toInt(),
          ),
          price: (data[1] as num).toDouble(),
        );
      }).toList();

      final chart = MarketChartEntity(
        tokenId: tokenId,
        prices: prices,
        startTime: prices.first.timestamp,
        endTime: prices.last.timestamp,
      );

      return right(chart);
    } catch (e) {
      return left(MarketFailure.invalidResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<MarketFailure, List<TokenEntity>>> getTopTokens({
    int limit = 20,
  }) async {
    try {
      // Check cache first
      final cacheKey = 'top_tokens_$limit';
      final cached = await _getCachedData(cacheKey);
      if (cached != null) {
        final List<dynamic> jsonList = jsonDecode(cached);
        final tokens = jsonList
            .map((json) => TokenModel.fromJson(json as Map<String, dynamic>).toEntity())
            .toList();
        return right(tokens);
      }
      
      // Fetch from API
      final response = await _api.getCoinsMarkets(perPage: limit);

      final tokens = response.map((item) {
        return TokenModel.fromJson(item as Map<String, dynamic>).toEntity();
      }).toList();

      // Cache the result
      await _saveCachedData(cacheKey, jsonEncode(response));

      return right(tokens);
    } on DioException catch (e) {
      // Try to return cached data on network error
      final cacheKey = 'top_tokens_$limit';
      final cached = await _getCachedData(cacheKey);
      if (cached != null) {
        final List<dynamic> jsonList = jsonDecode(cached);
        final tokens = jsonList
            .map((json) => TokenModel.fromJson(json as Map<String, dynamic>).toEntity())
            .toList();
        return right(tokens);
      }
      return left(_handleDioError(e));
    } catch (e) {
      return left(MarketFailure.invalidResponse(message: e.toString()));
    }
  }
  
  /// Get cached data if not expired
  Future<String?> _getCachedData(String key) async {
    try {
      final box = await _cacheBoxInstance;
      final cached = box.get(key);
      if (cached == null) return null;
      
      final Map<String, dynamic> data = jsonDecode(cached as String);
      final timestamp = DateTime.parse(data['timestamp'] as String);
      
      if (DateTime.now().difference(timestamp) > _cacheExpiry) {
        await box.delete(key);
        return null;
      }
      
      return data['data'] as String;
    } catch (e) {
      return null;
    }
  }
  
  /// Save data to cache with timestamp
  Future<void> _saveCachedData(String key, String data) async {
    try {
      final box = await _cacheBoxInstance;
      final cacheData = {
        'timestamp': DateTime.now().toIso8601String(),
        'data': data,
      };
      await box.put(key, jsonEncode(cacheData));
    } catch (e) {
      // Handle error silently
    }
  }

  @override
  Future<Either<MarketFailure, List<TokenEntity>>> searchTokens(
    String query,
  ) async {
    try {
      final response = await _api.searchCoins(query);
      final coins = response['coins'] as List<dynamic>?;

      if (coins == null || coins.isEmpty) {
        return right([]);
      }

      // Get detailed price data for search results
      final ids = coins.take(10).map((c) => c['id'] as String).toList();
      return getTokenPrices(ids);
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(MarketFailure.invalidResponse(message: e.toString()));
    }
  }

  @override
  Stream<Either<MarketFailure, CandlestickEntity>> streamLiveCandles(
    String tokenId,
    String interval,
  ) async* {
    // Map CoinGecko token ID to Binance symbol
    final binanceSymbol = BinanceSymbolMapper.coinGeckoToBinance(tokenId);
    
    if (binanceSymbol == null) {
      yield left(MarketFailure.tokenNotFound());
      return;
    }

    try {
      // Connect to Binance WebSocket stream
      await _wsApi.connectKlineStream(binanceSymbol, interval);

      // Stream candlestick updates
      await for (final candle in _wsApi.candleStream) {
        yield right(candle);
      }
    } catch (e) {
      yield left(MarketFailure.networkError(
        message: 'Failed to connect to live stream: ${e.toString()}',
      ));
    }
  }

  /// Handle Dio errors and convert to MarketFailure
  MarketFailure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const MarketFailure.networkError(
          message: 'Connection timed out. Please check your internet.',
        );
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 429) {
          return const MarketFailure.rateLimitExceeded();
        }
        if (statusCode == 404) {
          return const MarketFailure.tokenNotFound();
        }
        return MarketFailure.networkError(
          message: 'Server error: $statusCode',
        );
      default:
        return MarketFailure.networkError(message: e.message ?? 'Unknown error');
    }
  }
}


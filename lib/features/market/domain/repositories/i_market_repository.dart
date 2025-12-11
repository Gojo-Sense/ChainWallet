// ============================================================================
// FILE: i_market_repository.dart
// PURPOSE: Market repository interface (contract) for dependency inversion
// NOTE: Pure Dart - NO Flutter imports
// PATTERN: All methods return Either<Failure, Success> using fpdart
// ============================================================================

import 'package:fpdart/fpdart.dart';
import '../entities/token_entity.dart';
import '../failures/market_failure.dart';

/// Repository interface for market/crypto data operations
/// Implementations should be registered with DI: @LazySingleton(as: IMarketRepository)
abstract class IMarketRepository {
  /// Get current prices for a list of token IDs
  /// Uses CoinGecko /simple/price endpoint
  Future<Either<MarketFailure, List<TokenEntity>>> getTokenPrices(
    List<String> tokenIds,
  );

  /// Get detailed token information
  Future<Either<MarketFailure, TokenEntity>> getTokenDetails(String tokenId);

  /// Get price history chart data for a token
  /// Uses CoinGecko /coins/{id}/market_chart endpoint
  /// [days] - Number of days of history (1, 7, 30, 90, 365)
  Future<Either<MarketFailure, MarketChartEntity>> getMarketChart(
    String tokenId, {
    int days = 7,
  });

  /// Get top tokens by market cap
  Future<Either<MarketFailure, List<TokenEntity>>> getTopTokens({
    int limit = 20,
  });

  /// Search for tokens by name or symbol
  Future<Either<MarketFailure, List<TokenEntity>>> searchTokens(String query);

  /// Stream live candlestick data for a token
  /// [tokenId] - CoinGecko token ID
  /// [interval] - Candlestick interval (1m, 5m, 15m, 1h, 4h, 1d)
  /// Returns a stream of candlestick updates
  Stream<Either<MarketFailure, CandlestickEntity>> streamLiveCandles(
    String tokenId,
    String interval,
  );
}


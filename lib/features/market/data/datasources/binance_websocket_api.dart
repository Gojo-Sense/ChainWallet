// ============================================================================
// FILE: binance_websocket_api.dart
// PURPOSE: Binance WebSocket API client for real-time candlestick data
// NOTE: Uses free public WebSocket streams (no API key required)
// ============================================================================

import 'dart:async';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../domain/entities/token_entity.dart';

/// Binance WebSocket endpoints
abstract class BinanceWebSocketEndpoints {
  static const String baseUrl = 'wss://stream.binance.com:9443/ws';
  static String klineStream(String symbol, String interval) =>
      '$baseUrl/${symbol.toLowerCase()}@kline_$interval';
}

/// Maps CoinGecko token IDs to Binance trading pair symbols
class BinanceSymbolMapper {
  static const Map<String, String> _coinGeckoToBinance = {
    'bitcoin': 'btcusdt',
    'ethereum': 'ethusdt',
    'binancecoin': 'bnbusdt',
    'solana': 'solusdt',
    'cardano': 'adausdt',
    'polkadot': 'dotusdt',
    'matic-network': 'maticusdt',
    'avalanche-2': 'avaxusdt',
    'chainlink': 'linkusdt',
    'litecoin': 'ltcusdt',
    'bitcoin-cash': 'bchusdt',
    'stellar': 'xlmusdt',
    'ethereum-classic': 'etcusdt',
    'filecoin': 'filusdt',
    'tron': 'trxusdt',
    'eos': 'eosusdt',
    'monero': 'xmrusdt',
    'cosmos': 'atomusdt',
    'algorand': 'algousdt',
    'tezos': 'xtzusdt',
    'aave': 'aaveusdt',
    'uniswap': 'uniusdt',
    'maker': 'mkrusdt',
    'compound': 'compusdt',
    'dash': 'dashusdt',
    'zcash': 'zecusdt',
    'waves': 'wavesusdt',
    'decred': 'dcrusdt',
    'nem': 'xemusdt',
    'vechain': 'vetusdt',
    'theta-token': 'thetausdt',
    'hedera-hashgraph': 'hbarusdt',
    'near': 'nearusdt',
    'fantom': 'ftmusdt',
    'the-graph': 'grpusdt',
    'celo': 'celousdt',
    'enjincoin': 'enjusdt',
    'sushi': 'sushiusdt',
    'curve-dao-token': 'crvusdt',
    'yearn-finance': 'yfiusdt',
    '1inch': '1inchusdt',
    'dogecoin': 'dogeusdt',
    'shiba-inu': 'shibusdt',
    'polygon': 'maticusdt',
    'ripple': 'xrpusdt',
    'usd-coin': 'usdcusdt',
    'tether': 'usdtusdt',
  };

  /// Convert CoinGecko token ID to Binance symbol
  /// Returns null if mapping not found
  static String? coinGeckoToBinance(String coinGeckoId) {
    return _coinGeckoToBinance[coinGeckoId.toLowerCase()];
  }

  /// Get all supported symbols
  static List<String> getSupportedSymbols() {
    return _coinGeckoToBinance.values.toList();
  }
}

/// Binance WebSocket API client for real-time candlestick data
@lazySingleton
class BinanceWebSocketApi {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  final StreamController<CandlestickEntity> _candleController =
      StreamController<CandlestickEntity>.broadcast();

  /// Stream of candlestick updates
  Stream<CandlestickEntity> get candleStream => _candleController.stream;

  /// Connect to Binance kline (candlestick) stream
  /// [symbol] - Trading pair symbol (e.g., 'btcusdt')
  /// [interval] - Kline interval (1m, 3m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 8h, 12h, 1d, 3d, 1w, 1M)
  Future<void> connectKlineStream(String symbol, String interval) async {
    // Disconnect existing connection if any
    await disconnect();

    final url = BinanceWebSocketEndpoints.klineStream(symbol, interval);
    
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      
      _subscription = _channel!.stream.listen(
        (message) {
          try {
            final data = jsonDecode(message as String) as Map<String, dynamic>;
            final kline = data['k'] as Map<String, dynamic>?;
            
            if (kline != null) {
              final candle = _parseKline(kline);
              _candleController.add(candle);
            }
          } catch (e) {
            // Silently handle parse errors
          }
        },
        onError: (error) {
          // Handle connection errors
          _candleController.addError(error);
        },
        onDone: () {
          // Stream closed
        },
        cancelOnError: false,
      );
    } catch (e) {
      _candleController.addError(e);
      rethrow;
    }
  }

  /// Parse Binance kline data to CandlestickEntity
  CandlestickEntity _parseKline(Map<String, dynamic> kline) {
    return CandlestickEntity(
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (kline['t'] as num).toInt(),
      ),
      open: double.parse(kline['o'] as String),
      high: double.parse(kline['h'] as String),
      low: double.parse(kline['l'] as String),
      close: double.parse(kline['c'] as String),
      volume: double.parse(kline['v'] as String),
      isClosed: (kline['x'] as bool) ?? false,
    );
  }

  /// Disconnect from WebSocket stream
  Future<void> disconnect() async {
    await _subscription?.cancel();
    await _channel?.sink.close();
    _subscription = null;
    _channel = null;
  }

  /// Check if currently connected
  bool get isConnected => _channel != null;

  /// Dispose resources
  void dispose() {
    disconnect();
    _candleController.close();
  }
}






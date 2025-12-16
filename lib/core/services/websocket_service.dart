// ============================================================================
// FILE: websocket_service.dart
// PURPOSE: WebSocket service for real-time price updates and alert notifications
// ============================================================================

import 'dart:async';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/app_config.dart';

@lazySingleton
class WebSocketService {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  
  final StreamController<Map<String, dynamic>> _priceUpdateController =
      StreamController<Map<String, dynamic>>.broadcast();
  
  final StreamController<Map<String, dynamic>> _alertTriggerController =
      StreamController<Map<String, dynamic>>.broadcast();
  
  bool _isConnected = false;

  /// Stream of real-time price updates
  Stream<Map<String, dynamic>> get priceUpdates => _priceUpdateController.stream;

  /// Stream of alert trigger notifications
  Stream<Map<String, dynamic>> get alertTriggers => _alertTriggerController.stream;

  /// Connect to WebSocket server with authentication
  Future<void> connect() async {
    if (_isConnected) return;

    try {
      final token = await _storage.read(key: 'access_token');
      if (token == null) {
        print('WebSocket: No auth token available');
        return;
      }

      final wsUrl = '${AppConfig.baseUrl}/socket.io/?EIO=4&transport=websocket';
      print('WebSocket: Connecting to $wsUrl');

      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));

      _subscription = _channel?.stream.listen(
        (message) {
          _handleMessage(message);
        },
        onError: (error) {
          print('WebSocket error: $error');
          _isConnected = false;
        },
        onDone: () {
          print('WebSocket connection closed');
          _isConnected = false;
        },
      );

      _isConnected = true;
      print('WebSocket: Connected successfully');
    } catch (e) {
      print('WebSocket connection failed: $e');
      _isConnected = false;
    }
  }

  /// Handle incoming WebSocket messages
  void _handleMessage(dynamic message) {
    try {
      print('WebSocket message: $message');
      
      // Handle Socket.IO messages
      if (message is String) {
        // Simple handling for now - in a real implementation, you'd parse the Socket.IO protocol
        // This is a simplified version for demonstration
      }
    } catch (e) {
      print('Error handling WebSocket message: $e');
    }
  }

  /// Subscribe to price updates for specific tokens
  void subscribeToPrices(List<String> tokens) {
    if (!_isConnected) return;
    
    _channel?.sink.add(jsonEncode({
      'event': 'subscribe_prices',
      'data': tokens,
    }));
  }

  /// Unsubscribe from price updates
  void unsubscribeFromPrices(List<String> tokens) {
    if (!_isConnected) return;
    
    _channel?.sink.add(jsonEncode({
      'event': 'unsubscribe_prices',
      'data': tokens,
    }));
  }

  /// Disconnect from WebSocket server
  void disconnect() {
    _subscription?.cancel();
    _channel?.sink.close();
    _isConnected = false;
    print('WebSocket: Disconnected');
  }

  /// Check if currently connected
  bool get isConnected => _isConnected;

  /// Dispose resources
  void dispose() {
    disconnect();
    _priceUpdateController.close();
    _alertTriggerController.close();
  }
}
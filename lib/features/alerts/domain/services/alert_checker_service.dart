// ============================================================================
// FILE: alert_checker_service.dart
// PURPOSE: Service for periodically checking price alerts
// ============================================================================

import 'dart:async';
import 'package:injectable/injectable.dart';

import '../../domain/entities/alert_entity.dart';
import '../../domain/repositories/i_alert_repository.dart';
import '../../../market/domain/repositories/i_market_repository.dart';
import '../../../../core/services/websocket_service.dart';

@lazySingleton
class AlertCheckerService {
  final IAlertRepository _alertRepository;
  final IMarketRepository _marketRepository;
  final WebSocketService _webSocketService;
  
  Timer? _checkTimer;
  static const Duration _checkInterval = Duration(minutes: 1);

  AlertCheckerService(
    this._alertRepository,
    this._marketRepository,
    this._webSocketService,
  ) {
    // Listen for real-time price updates from WebSocket
    _webSocketService.priceUpdates.listen(_handlePriceUpdate);
  }

  /// Start periodic alert checking
  void startPeriodicChecking() {
    stopPeriodicChecking(); // Stop any existing timer
    
    _checkTimer = Timer.periodic(_checkInterval, (timer) async {
      await _checkAlertsPeriodically();
    });
  }

  /// Stop periodic alert checking
  void stopPeriodicChecking() {
    _checkTimer?.cancel();
    _checkTimer = null;
  }

  /// Check alerts periodically by fetching current prices
  Future<void> _checkAlertsPeriodically() async {
    try {
      // Get all active alerts
      final alertResult = await _alertRepository.getAlerts();
      
      alertResult.fold(
        (failure) {
          // Handle failure silently
        },
        (alerts) async {
          final activeAlerts = alerts.where((a) => a.isActive && a.triggeredAt == null).toList();
          if (activeAlerts.isEmpty) return;

          // Get unique token IDs
          final tokenIds = activeAlerts.map((a) => a.tokenId).toSet().toList();

          // Fetch current prices for all tokens with active alerts
          final pricesResult = await _marketRepository.getTokenPrices(tokenIds);

          pricesResult.fold(
            (failure) {
              // Handle failure silently
            },
            (tokens) async {
              // Convert tokens to a map of token ID to current price
              final currentPrices = <String, double>{};
              for (final token in tokens) {
                currentPrices[token.id] = token.currentPrice;
              }
              
              // Check alerts with current prices
              await _alertRepository.checkAlerts(currentPrices);
            },
          );
        },
      );
    } catch (e) {
      // Handle errors silently to avoid breaking the periodic checking
      print('Error checking alerts: $e');
    }
  }

  /// Handle real-time price updates from WebSocket
  Future<void> _handlePriceUpdate(Map<String, dynamic> priceData) async {
    try {
      final tokenSymbol = priceData['tokenSymbol'] as String?;
      final price = priceData['price'] as num?;
      
      if (tokenSymbol == null || price == null) return;

      // Create a map with the price data for checking alerts
      // Note: We need to convert tokenSymbol to tokenId if they're different
      final currentPrices = {tokenSymbol: price.toDouble()};
      
      // Check alerts with the updated price
      await _alertRepository.checkAlerts(currentPrices);
    } catch (e) {
      print('Error handling price update: $e');
    }
  }

  /// Dispose resources
  void dispose() {
    stopPeriodicChecking();
  }
}
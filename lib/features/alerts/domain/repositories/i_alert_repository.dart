// ============================================================================
// FILE: i_alert_repository.dart
// PURPOSE: Repository interface for alert operations
// ============================================================================

import 'package:fpdart/fpdart.dart';
import '../entities/alert_entity.dart';
import '../failures/alert_failure.dart';

abstract class IAlertRepository {
  /// Get all price alerts
  Future<Either<AlertFailure, List<PriceAlert>>> getAlerts();

  /// Create a new price alert
  Future<Either<AlertFailure, PriceAlert>> createAlert({
    required String tokenId,
    required String tokenName,
    required String tokenSymbol,
    required double targetPrice,
    required double currentPrice,
    required AlertCondition condition,
  });

  /// Delete an alert
  Future<Either<AlertFailure, Unit>> deleteAlert(String alertId);

  /// Toggle alert active status
  Future<Either<AlertFailure, PriceAlert>> toggleAlert(String alertId);

  /// Check all alerts against current prices
  Future<Either<AlertFailure, List<PriceAlert>>> checkAlerts(
    Map<String, double> currentPrices,
  );
}



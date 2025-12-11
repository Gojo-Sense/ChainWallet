// ============================================================================
// FILE: alert_repository_impl.dart
// PURPOSE: Implementation of alert repository with local storage
// ============================================================================

import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/alert_entity.dart';
import '../../domain/failures/alert_failure.dart';
import '../../domain/repositories/i_alert_repository.dart';

@LazySingleton(as: IAlertRepository)
class AlertRepositoryImpl implements IAlertRepository {
  final FlutterSecureStorage _storage;
  final Uuid _uuid = const Uuid();
  
  static const String _alertsKey = 'price_alerts';
  static const int _maxAlerts = 20;

  AlertRepositoryImpl(this._storage);

  @override
  Future<Either<AlertFailure, List<PriceAlert>>> getAlerts() async {
    try {
      final data = await _storage.read(key: _alertsKey);
      if (data == null || data.isEmpty) {
        return right([]);
      }

      final List<dynamic> jsonList = jsonDecode(data);
      final alerts = jsonList
          .map((json) => PriceAlert.fromJson(json as Map<String, dynamic>))
          .toList();

      return right(alerts);
    } catch (e) {
      return left(AlertStorageError(message: e.toString()));
    }
  }

  @override
  Future<Either<AlertFailure, PriceAlert>> createAlert({
    required String tokenId,
    required String tokenName,
    required String tokenSymbol,
    required double targetPrice,
    required double currentPrice,
    required AlertCondition condition,
  }) async {
    try {
      final existingResult = await getAlerts();
      
      return existingResult.fold(
        (failure) => left(failure),
        (alerts) async {
          if (alerts.length >= _maxAlerts) {
            return left(AlertLimitReached(maxAlerts: _maxAlerts));
          }

          final newAlert = PriceAlert(
            id: _uuid.v4(),
            tokenId: tokenId,
            tokenName: tokenName,
            tokenSymbol: tokenSymbol,
            targetPrice: targetPrice,
            currentPriceAtCreation: currentPrice,
            condition: condition,
            createdAt: DateTime.now(),
          );

          final updatedAlerts = [...alerts, newAlert];
          await _saveAlerts(updatedAlerts);

          return right(newAlert);
        },
      );
    } catch (e) {
      return left(AlertStorageError(message: e.toString()));
    }
  }

  @override
  Future<Either<AlertFailure, Unit>> deleteAlert(String alertId) async {
    try {
      final existingResult = await getAlerts();
      
      return existingResult.fold(
        (failure) => left(failure),
        (alerts) async {
          final index = alerts.indexWhere((a) => a.id == alertId);
          if (index == -1) {
            return left(AlertNotFound(alertId: alertId));
          }

          alerts.removeAt(index);
          await _saveAlerts(alerts);

          return right(unit);
        },
      );
    } catch (e) {
      return left(AlertStorageError(message: e.toString()));
    }
  }

  @override
  Future<Either<AlertFailure, PriceAlert>> toggleAlert(String alertId) async {
    try {
      final existingResult = await getAlerts();
      
      return existingResult.fold(
        (failure) => left(failure),
        (alerts) async {
          final index = alerts.indexWhere((a) => a.id == alertId);
          if (index == -1) {
            return left(AlertNotFound(alertId: alertId));
          }

          final alert = alerts[index];
          final updatedAlert = alert.copyWith(isActive: !alert.isActive);
          alerts[index] = updatedAlert;
          await _saveAlerts(alerts);

          return right(updatedAlert);
        },
      );
    } catch (e) {
      return left(AlertStorageError(message: e.toString()));
    }
  }

  @override
  Future<Either<AlertFailure, List<PriceAlert>>> checkAlerts(
    Map<String, double> currentPrices,
  ) async {
    try {
      final existingResult = await getAlerts();
      
      return existingResult.fold(
        (failure) => left(failure),
        (alerts) async {
          final triggeredAlerts = <PriceAlert>[];
          final updatedAlerts = <PriceAlert>[];

          for (final alert in alerts) {
            if (!alert.isActive || alert.triggeredAt != null) {
              updatedAlerts.add(alert);
              continue;
            }

            final currentPrice = currentPrices[alert.tokenId];
            if (currentPrice == null) {
              updatedAlerts.add(alert);
              continue;
            }

            bool isTriggered = false;
            switch (alert.condition) {
              case AlertCondition.above:
                isTriggered = currentPrice >= alert.targetPrice;
                break;
              case AlertCondition.below:
                isTriggered = currentPrice <= alert.targetPrice;
                break;
            }

            if (isTriggered) {
              final triggeredAlert = alert.copyWith(
                triggeredAt: DateTime.now(),
                isActive: false,
              );
              triggeredAlerts.add(triggeredAlert);
              updatedAlerts.add(triggeredAlert);
            } else {
              updatedAlerts.add(alert);
            }
          }

          await _saveAlerts(updatedAlerts);
          return right(triggeredAlerts);
        },
      );
    } catch (e) {
      return left(AlertStorageError(message: e.toString()));
    }
  }

  Future<void> _saveAlerts(List<PriceAlert> alerts) async {
    final jsonList = alerts.map((a) => a.toJson()).toList();
    await _storage.write(key: _alertsKey, value: jsonEncode(jsonList));
  }
}



// ============================================================================
// FILE: alert_event.dart
// PURPOSE: Events for AlertBloc
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/alert_entity.dart';

part 'alert_event.freezed.dart';

@freezed
class AlertEvent with _$AlertEvent {
  const factory AlertEvent.loadAlerts() = LoadAlertsEvent;

  const factory AlertEvent.createAlert({
    required String tokenId,
    required String tokenName,
    required String tokenSymbol,
    required double targetPrice,
    required double currentPrice,
    required AlertCondition condition,
  }) = CreateAlertEvent;

  const factory AlertEvent.deleteAlert({
    required String alertId,
  }) = DeleteAlertEvent;

  const factory AlertEvent.toggleAlert({
    required String alertId,
  }) = ToggleAlertEvent;
}



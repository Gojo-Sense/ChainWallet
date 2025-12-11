// ============================================================================
// FILE: alert_failure.dart
// PURPOSE: Domain failures for alerts feature
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_failure.freezed.dart';

@freezed
class AlertFailure with _$AlertFailure {
  const factory AlertFailure.storageError({
    required String message,
  }) = AlertStorageError;

  const factory AlertFailure.notFound({
    required String alertId,
  }) = AlertNotFound;

  const factory AlertFailure.limitReached({
    required int maxAlerts,
  }) = AlertLimitReached;

  const factory AlertFailure.notificationError({
    required String message,
  }) = AlertNotificationError;
}



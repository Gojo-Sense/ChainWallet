// ============================================================================
// FILE: alert_entity.dart
// PURPOSE: Domain entities for price alerts
// PATTERN: Freezed class for immutability
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_entity.freezed.dart';
part 'alert_entity.g.dart';

@freezed
sealed class PriceAlert with _$PriceAlert {
  const PriceAlert._();
  
  const factory PriceAlert({
    required String id,
    required String tokenId,
    required String tokenName,
    required String tokenSymbol,
    required double targetPrice,
    required double currentPriceAtCreation,
    required AlertCondition condition,
    required DateTime createdAt,
    @Default(true) bool isActive,
    DateTime? triggeredAt,
  }) = _PriceAlert;

  factory PriceAlert.fromJson(Map<String, dynamic> json) =>
      _$PriceAlertFromJson(json);
}

enum AlertCondition {
  above,
  below,
}

extension AlertConditionX on AlertCondition {
  String get label => switch (this) {
        AlertCondition.above => 'Above',
        AlertCondition.below => 'Below',
      };

  String get emoji => switch (this) {
        AlertCondition.above => '📈',
        AlertCondition.below => '📉',
      };
}


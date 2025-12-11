// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PriceAlert _$PriceAlertFromJson(Map<String, dynamic> json) => _PriceAlert(
  id: json['id'] as String,
  tokenId: json['tokenId'] as String,
  tokenName: json['tokenName'] as String,
  tokenSymbol: json['tokenSymbol'] as String,
  targetPrice: (json['targetPrice'] as num).toDouble(),
  currentPriceAtCreation: (json['currentPriceAtCreation'] as num).toDouble(),
  condition: $enumDecode(_$AlertConditionEnumMap, json['condition']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  isActive: json['isActive'] as bool? ?? true,
  triggeredAt: json['triggeredAt'] == null
      ? null
      : DateTime.parse(json['triggeredAt'] as String),
);

Map<String, dynamic> _$PriceAlertToJson(_PriceAlert instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tokenId': instance.tokenId,
      'tokenName': instance.tokenName,
      'tokenSymbol': instance.tokenSymbol,
      'targetPrice': instance.targetPrice,
      'currentPriceAtCreation': instance.currentPriceAtCreation,
      'condition': _$AlertConditionEnumMap[instance.condition]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'isActive': instance.isActive,
      'triggeredAt': instance.triggeredAt?.toIso8601String(),
    };

const _$AlertConditionEnumMap = {
  AlertCondition.above: 'above',
  AlertCondition.below: 'below',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => _TokenModel(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  currentPrice: (json['current_price'] as num?)?.toDouble(),
  priceChangePercentage24h: (json['price_change_percentage_24h'] as num?)
      ?.toDouble(),
  image: json['image'] as String?,
  marketCap: (json['market_cap'] as num?)?.toDouble(),
  volume24h: (json['total_volume'] as num?)?.toDouble(),
  high24h: (json['high_24h'] as num?)?.toDouble(),
  low24h: (json['low_24h'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TokenModelToJson(_TokenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'image': instance.image,
      'market_cap': instance.marketCap,
      'total_volume': instance.volume24h,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
    };

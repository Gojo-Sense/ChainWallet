// ============================================================================
// FILE: token_model.dart
// PURPOSE: DTO models for CoinGecko API responses
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/token_entity.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

/// Token model from CoinGecko markets endpoint
@freezed
sealed class TokenModel with _$TokenModel {
  const TokenModel._();

  const factory TokenModel({
    required String id,
    required String symbol,
    required String name,
    @JsonKey(name: 'current_price') double? currentPrice,
    @JsonKey(name: 'price_change_percentage_24h') double? priceChangePercentage24h,
    String? image,
    @JsonKey(name: 'market_cap') double? marketCap,
    @JsonKey(name: 'total_volume') double? volume24h,
    @JsonKey(name: 'high_24h') double? high24h,
    @JsonKey(name: 'low_24h') double? low24h,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  /// Convert to domain entity
  TokenEntity toEntity() {
    return TokenEntity(
      id: id,
      symbol: symbol.toUpperCase(),
      name: name,
      currentPrice: currentPrice ?? 0,
      priceChangePercentage24h: priceChangePercentage24h ?? 0,
      image: image,
      marketCap: marketCap,
      volume24h: volume24h,
      high24h: high24h,
      low24h: low24h,
    );
  }
}

/// Simple price model for /simple/price endpoint
@freezed
sealed class SimplePriceModel with _$SimplePriceModel {
  const SimplePriceModel._();

  const factory SimplePriceModel({
    required String id,
    required double usd,
    @JsonKey(name: 'usd_24h_change') double? usd24hChange,
    @JsonKey(name: 'usd_market_cap') double? usdMarketCap,
    @JsonKey(name: 'usd_24h_vol') double? usd24hVol,
  }) = _SimplePriceModel;

  factory SimplePriceModel.fromJson(String id, Map<String, dynamic> json) {
    return SimplePriceModel(
      id: id,
      usd: (json['usd'] as num?)?.toDouble() ?? 0,
      usd24hChange: (json['usd_24h_change'] as num?)?.toDouble(),
      usdMarketCap: (json['usd_market_cap'] as num?)?.toDouble(),
      usd24hVol: (json['usd_24h_vol'] as num?)?.toDouble(),
    );
  }

  /// Convert to domain entity
  TokenEntity toEntity({String? name, String? image}) {
    return TokenEntity(
      id: id,
      symbol: id.toUpperCase(),
      name: name ?? id,
      currentPrice: usd,
      priceChangePercentage24h: usd24hChange ?? 0,
      image: image,
      marketCap: usdMarketCap,
      volume24h: usd24hVol,
    );
  }
}

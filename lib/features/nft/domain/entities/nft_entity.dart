// ============================================================================
// FILE: nft_entity.dart
// PURPOSE: Domain entities for NFT gallery
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_entity.freezed.dart';

@freezed
sealed class NFT with _$NFT {
  const NFT._();

  const factory NFT({
    required String id,
    required String name,
    required String collection,
    required String imageUrl,
    required String contractAddress,
    required String tokenId,
    String? description,
    double? floorPrice,
    double? lastSalePrice,
    String? rarityRank,
    @Default([]) List<NFTAttribute> attributes,
  }) = _NFT;

  /// Get shortened contract address
  String get shortContract {
    if (contractAddress.length < 12) return contractAddress;
    return '${contractAddress.substring(0, 6)}...${contractAddress.substring(contractAddress.length - 4)}';
  }
}

@freezed
sealed class NFTAttribute with _$NFTAttribute {
  const NFTAttribute._();

  const factory NFTAttribute({
    required String traitType,
    required String value,
    double? rarity,
  }) = _NFTAttribute;
}

@freezed
sealed class NFTCollection with _$NFTCollection {
  const NFTCollection._();

  const factory NFTCollection({
    required String name,
    required String slug,
    String? imageUrl,
    double? floorPrice,
    int? totalSupply,
    int? ownedCount,
  }) = _NFTCollection;
}



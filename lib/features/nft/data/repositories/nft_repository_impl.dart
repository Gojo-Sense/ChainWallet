// ============================================================================
// FILE: nft_repository_impl.dart
// PURPOSE: Mock implementation of NFT repository
// ============================================================================

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/nft_entity.dart';

sealed class NFTFailure {
  const NFTFailure();
  String get message;
}

class NFTFetchError extends NFTFailure {
  final String details;
  const NFTFetchError(this.details);
  @override
  String get message => details;
}

abstract class INFTRepository {
  Future<Either<NFTFailure, List<NFT>>> getNFTs();
  Future<Either<NFTFailure, List<NFTCollection>>> getCollections();
}

@LazySingleton(as: INFTRepository)
class NFTRepositoryImpl implements INFTRepository {
  @override
  Future<Either<NFTFailure, List<NFT>>> getNFTs() async {
    await Future.delayed(const Duration(milliseconds: 800));

    // Mock NFT data with real-looking URLs (using placeholder images)
    final nfts = [
      const NFT(
        id: '1',
        name: 'Bored Ape #7842',
        collection: 'Bored Ape Yacht Club',
        imageUrl: 'https://picsum.photos/seed/ape1/400/400',
        contractAddress: '0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D',
        tokenId: '7842',
        description: 'A bored ape that has seen too many things.',
        floorPrice: 28.5,
        lastSalePrice: 32.1,
        rarityRank: '1,234',
        attributes: [
          NFTAttribute(traitType: 'Background', value: 'Aquamarine', rarity: 12.5),
          NFTAttribute(traitType: 'Fur', value: 'Golden Brown', rarity: 8.2),
          NFTAttribute(traitType: 'Eyes', value: 'Laser', rarity: 3.1),
        ],
      ),
      const NFT(
        id: '2',
        name: 'Doodle #4521',
        collection: 'Doodles',
        imageUrl: 'https://picsum.photos/seed/doodle1/400/400',
        contractAddress: '0x8a90CAb2b38dba80c64b7734e58Ee1dB38B8992e',
        tokenId: '4521',
        floorPrice: 5.2,
        lastSalePrice: 6.8,
        rarityRank: '892',
        attributes: [
          NFTAttribute(traitType: 'Face', value: 'Happy', rarity: 15.0),
          NFTAttribute(traitType: 'Hair', value: 'Rainbow', rarity: 2.5),
        ],
      ),
      const NFT(
        id: '3',
        name: 'Azuki #9231',
        collection: 'Azuki',
        imageUrl: 'https://picsum.photos/seed/azuki1/400/400',
        contractAddress: '0xED5AF388653567Af2F388E6224dC7C4b3241C544',
        tokenId: '9231',
        floorPrice: 8.9,
        lastSalePrice: 10.2,
        rarityRank: '2,108',
        attributes: [
          NFTAttribute(traitType: 'Type', value: 'Spirit', rarity: 1.2),
          NFTAttribute(traitType: 'Clothing', value: 'Kimono', rarity: 5.8),
        ],
      ),
      const NFT(
        id: '4',
        name: 'Pudgy Penguin #5120',
        collection: 'Pudgy Penguins',
        imageUrl: 'https://picsum.photos/seed/pudgy1/400/400',
        contractAddress: '0xBd3531dA5CF5857e7CfAA92426877b022e612cf8',
        tokenId: '5120',
        floorPrice: 12.4,
        rarityRank: '3,451',
        attributes: [
          NFTAttribute(traitType: 'Body', value: 'Pink', rarity: 8.9),
          NFTAttribute(traitType: 'Head', value: 'Crown', rarity: 1.5),
        ],
      ),
      const NFT(
        id: '5',
        name: 'Clone X #12842',
        collection: 'Clone X',
        imageUrl: 'https://picsum.photos/seed/clonex1/400/400',
        contractAddress: '0x49cF6f5d44E70224e2E23fDcdd2C053F30aDA28B',
        tokenId: '12842',
        floorPrice: 3.8,
        lastSalePrice: 4.2,
        attributes: [
          NFTAttribute(traitType: 'DNA', value: 'Human', rarity: 45.0),
          NFTAttribute(traitType: 'Eye Color', value: 'Neon', rarity: 6.2),
        ],
      ),
      const NFT(
        id: '6',
        name: 'Moonbird #8921',
        collection: 'Moonbirds',
        imageUrl: 'https://picsum.photos/seed/moon1/400/400',
        contractAddress: '0x23581767a106ae21c074b2276D25e5C3e136a68b',
        tokenId: '8921',
        floorPrice: 2.1,
        rarityRank: '5,892',
        attributes: [
          NFTAttribute(traitType: 'Feathers', value: 'Cosmic', rarity: 4.2),
          NFTAttribute(traitType: 'Eyes', value: 'Diamond', rarity: 2.1),
        ],
      ),
    ];

    return right(nfts);
  }

  @override
  Future<Either<NFTFailure, List<NFTCollection>>> getCollections() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final collections = [
      const NFTCollection(
        name: 'Bored Ape Yacht Club',
        slug: 'boredapeyachtclub',
        floorPrice: 28.5,
        totalSupply: 10000,
        ownedCount: 1,
      ),
      const NFTCollection(
        name: 'Doodles',
        slug: 'doodles',
        floorPrice: 5.2,
        totalSupply: 10000,
        ownedCount: 1,
      ),
      const NFTCollection(
        name: 'Azuki',
        slug: 'azuki',
        floorPrice: 8.9,
        totalSupply: 10000,
        ownedCount: 1,
      ),
      const NFTCollection(
        name: 'Pudgy Penguins',
        slug: 'pudgypenguins',
        floorPrice: 12.4,
        totalSupply: 8888,
        ownedCount: 1,
      ),
      const NFTCollection(
        name: 'Clone X',
        slug: 'clonex',
        floorPrice: 3.8,
        totalSupply: 20000,
        ownedCount: 1,
      ),
      const NFTCollection(
        name: 'Moonbirds',
        slug: 'moonbirds',
        floorPrice: 2.1,
        totalSupply: 10000,
        ownedCount: 1,
      ),
    ];

    return right(collections);
  }
}



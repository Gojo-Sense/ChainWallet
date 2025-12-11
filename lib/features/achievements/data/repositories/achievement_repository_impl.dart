// ============================================================================
// FILE: achievement_repository_impl.dart
// PURPOSE: Mock implementation of achievements repository
// ============================================================================

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/achievement_entity.dart';

sealed class AchievementFailure {
  const AchievementFailure();
  String get message;
}

class AchievementFetchError extends AchievementFailure {
  final String details;
  const AchievementFetchError(this.details);
  @override
  String get message => details;
}

abstract class IAchievementRepository {
  Future<Either<AchievementFailure, List<Achievement>>> getAchievements();
  Future<Either<AchievementFailure, AchievementStats>> getStats();
}

@LazySingleton(as: IAchievementRepository)
class AchievementRepositoryImpl implements IAchievementRepository {
  @override
  Future<Either<AchievementFailure, List<Achievement>>> getAchievements() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final achievements = [
      // Beginner achievements
      const Achievement(
        id: 'first_wallet',
        title: 'First Steps',
        description: 'Create your first wallet',
        emoji: '👶',
        category: AchievementCategory.beginner,
        rarity: AchievementRarity.common,
        isUnlocked: true,
        xpReward: 100,
      ),
      const Achievement(
        id: 'first_receive',
        title: 'Money In',
        description: 'Receive your first crypto',
        emoji: '📥',
        category: AchievementCategory.beginner,
        rarity: AchievementRarity.common,
        isUnlocked: true,
        xpReward: 100,
      ),
      const Achievement(
        id: 'first_send',
        title: 'Generous',
        description: 'Send crypto for the first time',
        emoji: '📤',
        category: AchievementCategory.beginner,
        rarity: AchievementRarity.common,
        isUnlocked: true,
        xpReward: 100,
      ),

      // Trading achievements
      const Achievement(
        id: 'first_swap',
        title: 'Trader',
        description: 'Complete your first swap',
        emoji: '🔄',
        category: AchievementCategory.trading,
        rarity: AchievementRarity.common,
        isUnlocked: true,
        xpReward: 150,
      ),
      Achievement(
        id: 'swap_master',
        title: 'Swap Master',
        description: 'Complete 100 swaps',
        emoji: '🔁',
        category: AchievementCategory.trading,
        rarity: AchievementRarity.rare,
        isUnlocked: false,
        progress: 42,
        target: 100,
        xpReward: 500,
      ),
      const Achievement(
        id: 'big_trade',
        title: 'Whale Moves',
        description: 'Make a single trade over \$10,000',
        emoji: '🐋',
        category: AchievementCategory.trading,
        rarity: AchievementRarity.epic,
        isUnlocked: false,
        xpReward: 1000,
      ),

      // HODLer achievements
      Achievement(
        id: 'hodl_week',
        title: 'Diamond Hands',
        description: 'Hold crypto for 7 days',
        emoji: '💎',
        category: AchievementCategory.hodler,
        rarity: AchievementRarity.common,
        isUnlocked: true,
        xpReward: 200,
      ),
      Achievement(
        id: 'hodl_month',
        title: 'Patient Investor',
        description: 'Hold crypto for 30 days',
        emoji: '⏳',
        category: AchievementCategory.hodler,
        rarity: AchievementRarity.rare,
        isUnlocked: true,
        xpReward: 500,
      ),
      const Achievement(
        id: 'hodl_year',
        title: 'True Believer',
        description: 'Hold crypto for 365 days',
        emoji: '🏆',
        category: AchievementCategory.hodler,
        rarity: AchievementRarity.legendary,
        isUnlocked: false,
        xpReward: 2000,
      ),

      // Portfolio achievements
      Achievement(
        id: 'portfolio_1k',
        title: 'Getting Started',
        description: 'Reach \$1,000 portfolio value',
        emoji: '💵',
        category: AchievementCategory.trading,
        rarity: AchievementRarity.common,
        isUnlocked: true,
        xpReward: 200,
      ),
      Achievement(
        id: 'portfolio_10k',
        title: 'Building Wealth',
        description: 'Reach \$10,000 portfolio value',
        emoji: '💰',
        category: AchievementCategory.trading,
        rarity: AchievementRarity.rare,
        isUnlocked: true,
        xpReward: 750,
      ),
      const Achievement(
        id: 'portfolio_100k',
        title: 'Whale Status',
        description: 'Reach \$100,000 portfolio value',
        emoji: '🐳',
        category: AchievementCategory.trading,
        rarity: AchievementRarity.legendary,
        isUnlocked: false,
        xpReward: 5000,
      ),

      // NFT achievements
      const Achievement(
        id: 'first_nft',
        title: 'Art Collector',
        description: 'Own your first NFT',
        emoji: '🎨',
        category: AchievementCategory.special,
        rarity: AchievementRarity.common,
        isUnlocked: true,
        xpReward: 150,
      ),
      Achievement(
        id: 'nft_collector',
        title: 'Gallery Owner',
        description: 'Own 10 NFTs',
        emoji: '🖼️',
        category: AchievementCategory.special,
        rarity: AchievementRarity.rare,
        progress: 6,
        target: 10,
        xpReward: 500,
      ),

      // Social achievements
      const Achievement(
        id: 'refer_friend',
        title: 'Influencer',
        description: 'Refer a friend to the app',
        emoji: '🤝',
        category: AchievementCategory.social,
        rarity: AchievementRarity.common,
        isUnlocked: false,
        xpReward: 300,
      ),

      // Special achievements
      const Achievement(
        id: 'early_adopter',
        title: 'Early Adopter',
        description: 'Join during beta',
        emoji: '🚀',
        category: AchievementCategory.special,
        rarity: AchievementRarity.epic,
        isUnlocked: true,
        xpReward: 1000,
      ),
      const Achievement(
        id: 'gm',
        title: 'GM',
        description: 'Open the app in the morning',
        emoji: '☀️',
        category: AchievementCategory.special,
        rarity: AchievementRarity.common,
        isUnlocked: true,
        xpReward: 50,
      ),
    ];

    return right(achievements);
  }

  @override
  Future<Either<AchievementFailure, AchievementStats>> getStats() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return right(const AchievementStats(
      totalAchievements: 18,
      unlockedAchievements: 11,
      totalXP: 4350,
      currentLevel: 12,
      xpToNextLevel: 650,
    ));
  }
}



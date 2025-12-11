// ============================================================================
// FILE: achievement_entity.dart
// PURPOSE: Domain entities for achievements/badges system
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_entity.freezed.dart';

/// Achievement category
enum AchievementCategory {
  beginner,
  trading,
  hodler,
  social,
  special,
}

extension AchievementCategoryX on AchievementCategory {
  String get label => switch (this) {
    AchievementCategory.beginner => 'Beginner',
    AchievementCategory.trading => 'Trading',
    AchievementCategory.hodler => 'HODLer',
    AchievementCategory.social => 'Social',
    AchievementCategory.special => 'Special',
  };

  String get emoji => switch (this) {
    AchievementCategory.beginner => '🌱',
    AchievementCategory.trading => '📈',
    AchievementCategory.hodler => '💎',
    AchievementCategory.social => '🤝',
    AchievementCategory.special => '⭐',
  };
}

/// Rarity level
enum AchievementRarity {
  common,
  rare,
  epic,
  legendary,
}

extension AchievementRarityX on AchievementRarity {
  String get label => switch (this) {
    AchievementRarity.common => 'Common',
    AchievementRarity.rare => 'Rare',
    AchievementRarity.epic => 'Epic',
    AchievementRarity.legendary => 'Legendary',
  };

  int get colorValue => switch (this) {
    AchievementRarity.common => 0xFF9E9E9E,
    AchievementRarity.rare => 0xFF2196F3,
    AchievementRarity.epic => 0xFF9C27B0,
    AchievementRarity.legendary => 0xFFFFD700,
  };
}

/// Achievement entity
@freezed
sealed class Achievement with _$Achievement {
  const Achievement._();

  const factory Achievement({
    required String id,
    required String title,
    required String description,
    required String emoji,
    required AchievementCategory category,
    required AchievementRarity rarity,
    @Default(false) bool isUnlocked,
    DateTime? unlockedAt,
    double? progress,
    double? target,
    int? xpReward,
  }) = _Achievement;

  /// Check if achievement has progress
  bool get hasProgress => progress != null && target != null;

  /// Get progress percentage
  double get progressPercent {
    if (progress == null || target == null || target == 0) return 0;
    return (progress! / target!).clamp(0.0, 1.0);
  }

  /// Format progress string
  String get progressString {
    if (!hasProgress) return '';
    return '${progress!.toInt()}/${target!.toInt()}';
  }
}

/// User achievement stats
@freezed
sealed class AchievementStats with _$AchievementStats {
  const AchievementStats._();

  const factory AchievementStats({
    required int totalAchievements,
    required int unlockedAchievements,
    required int totalXP,
    required int currentLevel,
    required int xpToNextLevel,
  }) = _AchievementStats;

  double get completionPercent => 
      totalAchievements > 0 ? unlockedAchievements / totalAchievements : 0;

  String get levelTitle {
    if (currentLevel < 5) return 'Novice';
    if (currentLevel < 10) return 'Trader';
    if (currentLevel < 20) return 'Expert';
    if (currentLevel < 30) return 'Master';
    return 'Legend';
  }
}



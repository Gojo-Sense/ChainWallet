// ============================================================================
// FILE: achievements_page.dart
// PURPOSE: Achievements/badges page with animated cards
// DESIGN: Deep Glassmorphism with glow effects for unlocked badges
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/achievement_entity.dart';
import '../bloc/achievement_bloc.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AchievementBloc>().add(const AchievementEvent.load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.3),
            radius: 1.5,
            colors: [
              const Color(0xFFFFD700).withAlpha(10),
              AppColors.abyss,
            ],
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<AchievementBloc, AchievementState>(
            builder: (context, state) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: _buildHeader()),
                  if (state.stats != null)
                    SliverToBoxAdapter(child: _buildStatsCard(state.stats!)),
                  SliverToBoxAdapter(child: _buildCategoryFilter(state)),
                  if (state.isLoading)
                    const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(color: Color(0xFFFFD700)),
                      ),
                    )
                  else
                    _buildAchievementsList(state),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.glassBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Achievements',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            '🏆',
            style: TextStyle(fontSize: 28),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2, end: 0);
  }

  Widget _buildStatsCard(AchievementStats stats) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFFD700).withAlpha(25),
                  AppColors.glassBg,
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFFFD700).withAlpha(50)),
            ),
            child: Column(
              children: [
                // Level & XP
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFD700).withAlpha(100),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${stats.currentLevel}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stats.levelTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${stats.totalXP} XP • ${stats.xpToNextLevel} to next level',
                            style: TextStyle(
                              color: Colors.white.withAlpha(150),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // XP Progress bar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: 1 - (stats.xpToNextLevel / 1000),
                              backgroundColor: Colors.white.withAlpha(20),
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
                              minHeight: 6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Divider(color: AppColors.glassBorder),
                const SizedBox(height: 16),

                // Stats row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Unlocked', '${stats.unlockedAchievements}/${stats.totalAchievements}'),
                    Container(width: 1, height: 30, color: AppColors.glassBorder),
                    _buildStatItem('Completion', '${(stats.completionPercent * 100).toInt()}%'),
                    Container(width: 1, height: 30, color: AppColors.glassBorder),
                    _buildStatItem('Total XP', '${stats.totalXP}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withAlpha(150),
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter(AchievementState state) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildCategoryChip(null, 'All', state.selectedCategory),
          ...AchievementCategory.values.map((category) =>
            _buildCategoryChip(category, '${category.emoji} ${category.label}', state.selectedCategory),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildCategoryChip(AchievementCategory? category, String label, AchievementCategory? selected) {
    final isSelected = category == selected;
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        context.read<AchievementBloc>().add(AchievementEvent.filterByCategory(category));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFD700).withAlpha(30) : AppColors.glassBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFFFFD700) : AppColors.glassBorder,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFFFD700) : Colors.white70,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementsList(AchievementState state) {
    final achievements = state.filteredAchievements;
    final unlocked = achievements.where((a) => a.isUnlocked).toList();
    final locked = achievements.where((a) => !a.isUnlocked).toList();

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          if (unlocked.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'UNLOCKED (${unlocked.length})',
                style: TextStyle(
                  color: Colors.white.withAlpha(100),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
            ...unlocked.asMap().entries.map((e) => 
              _AchievementCard(achievement: e.value)
                  .animate()
                  .fadeIn(delay: (50 * e.key).ms)
                  .slideX(begin: 0.1, end: 0),
            ),
          ],
          if (locked.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'LOCKED (${locked.length})',
                style: TextStyle(
                  color: Colors.white.withAlpha(100),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
            ...locked.asMap().entries.map((e) => 
              _AchievementCard(achievement: e.value)
                  .animate()
                  .fadeIn(delay: (50 * (e.key + unlocked.length)).ms)
                  .slideX(begin: 0.1, end: 0),
            ),
          ],
        ]),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const _AchievementCard({required this.achievement});

  @override
  Widget build(BuildContext context) {
    final rarityColor = Color(achievement.rarity.colorValue);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: achievement.isUnlocked
                  ? rarityColor.withAlpha(15)
                  : AppColors.glassBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: achievement.isUnlocked
                    ? rarityColor.withAlpha(80)
                    : AppColors.glassBorder,
              ),
              boxShadow: achievement.isUnlocked
                  ? [
                      BoxShadow(
                        color: rarityColor.withAlpha(40),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                // Emoji badge
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: achievement.isUnlocked
                        ? rarityColor.withAlpha(40)
                        : Colors.white.withAlpha(10),
                    borderRadius: BorderRadius.circular(16),
                    border: achievement.isUnlocked
                        ? Border.all(color: rarityColor.withAlpha(100))
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      achievement.emoji,
                      style: TextStyle(
                        fontSize: 28,
                        color: achievement.isUnlocked
                            ? null
                            : Colors.white.withAlpha(80),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              achievement.title,
                              style: TextStyle(
                                color: achievement.isUnlocked
                                    ? Colors.white
                                    : Colors.white.withAlpha(150),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: rarityColor.withAlpha(30),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              achievement.rarity.label,
                              style: TextStyle(
                                color: rarityColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        achievement.description,
                        style: TextStyle(
                          color: Colors.white.withAlpha(achievement.isUnlocked ? 150 : 100),
                          fontSize: 12,
                        ),
                      ),

                      // Progress bar if applicable
                      if (achievement.hasProgress && !achievement.isUnlocked) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: achievement.progressPercent,
                                  backgroundColor: Colors.white.withAlpha(20),
                                  valueColor: AlwaysStoppedAnimation<Color>(rarityColor),
                                  minHeight: 6,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              achievement.progressString,
                              style: TextStyle(
                                color: Colors.white.withAlpha(100),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],

                      // XP reward
                      if (achievement.xpReward != null) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              achievement.isUnlocked ? Icons.check_circle : Icons.star,
                              color: achievement.isUnlocked
                                  ? AppColors.success
                                  : const Color(0xFFFFD700).withAlpha(150),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              achievement.isUnlocked
                                  ? '+${achievement.xpReward} XP earned'
                                  : '${achievement.xpReward} XP',
                              style: TextStyle(
                                color: achievement.isUnlocked
                                    ? AppColors.success
                                    : const Color(0xFFFFD700).withAlpha(150),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



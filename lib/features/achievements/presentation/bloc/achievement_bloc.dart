// ============================================================================
// FILE: achievement_bloc.dart
// PURPOSE: BLoC for achievements state management
// ============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/achievement_repository_impl.dart';
import '../../domain/entities/achievement_entity.dart';

part 'achievement_bloc.freezed.dart';

// Events
@freezed
sealed class AchievementEvent with _$AchievementEvent {
  const AchievementEvent._();
  const factory AchievementEvent.load() = LoadAchievementsEvent;
  const factory AchievementEvent.filterByCategory(AchievementCategory? category) = FilterByCategoryEvent;
}

// State
@freezed
sealed class AchievementState with _$AchievementState {
  const AchievementState._();
  
  const factory AchievementState({
    @Default([]) List<Achievement> achievements,
    @Default(false) bool isLoading,
    AchievementStats? stats,
    AchievementCategory? selectedCategory,
    String? error,
  }) = _AchievementState;

  factory AchievementState.initial() => const AchievementState();

  List<Achievement> get filteredAchievements {
    if (selectedCategory == null) return achievements;
    return achievements.where((a) => a.category == selectedCategory).toList();
  }

  List<Achievement> get unlockedAchievements =>
      achievements.where((a) => a.isUnlocked).toList();

  List<Achievement> get lockedAchievements =>
      achievements.where((a) => !a.isUnlocked).toList();
}

@injectable
class AchievementBloc extends Bloc<AchievementEvent, AchievementState> {
  final IAchievementRepository _repository;

  AchievementBloc(this._repository) : super(AchievementState.initial()) {
    on<LoadAchievementsEvent>(_onLoad);
    on<FilterByCategoryEvent>(_onFilter);
  }

  Future<void> _onLoad(
    LoadAchievementsEvent event,
    Emitter<AchievementState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final achievementsResult = await _repository.getAchievements();
    final statsResult = await _repository.getStats();

    achievementsResult.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (achievements) {
        statsResult.fold(
          (failure) => emit(state.copyWith(
            isLoading: false,
            achievements: achievements,
          )),
          (stats) => emit(state.copyWith(
            isLoading: false,
            achievements: achievements,
            stats: stats,
          )),
        );
      },
    );
  }

  void _onFilter(
    FilterByCategoryEvent event,
    Emitter<AchievementState> emit,
  ) {
    emit(state.copyWith(selectedCategory: event.category));
  }
}



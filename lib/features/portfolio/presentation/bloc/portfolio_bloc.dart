// ============================================================================
// FILE: portfolio_bloc.dart
// PURPOSE: BLoC for portfolio analytics state management
// ============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/portfolio_entity.dart';
import '../../domain/repositories/i_portfolio_repository.dart';

part 'portfolio_bloc.freezed.dart';

// Events
@freezed
sealed class PortfolioEvent with _$PortfolioEvent {
  const PortfolioEvent._();
  const factory PortfolioEvent.load() = LoadPortfolioEvent;
  const factory PortfolioEvent.changeTimeRange(PortfolioTimeRange range) = ChangeTimeRangeEvent;
  const factory PortfolioEvent.refresh() = RefreshPortfolioEvent;
}

// State
@freezed
sealed class PortfolioState with _$PortfolioState {
  const PortfolioState._();
  
  const factory PortfolioState({
    Portfolio? portfolio,
    @Default(false) bool isLoading,
    @Default(PortfolioTimeRange.month) PortfolioTimeRange selectedRange,
    String? error,
  }) = _PortfolioState;

  factory PortfolioState.initial() => const PortfolioState();
}

@injectable
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final IPortfolioRepository _repository;

  PortfolioBloc(this._repository) : super(PortfolioState.initial()) {
    on<LoadPortfolioEvent>(_onLoad);
    on<ChangeTimeRangeEvent>(_onChangeTimeRange);
    on<RefreshPortfolioEvent>(_onRefresh);
  }

  Future<void> _onLoad(
    LoadPortfolioEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.getPortfolio();

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (portfolio) => emit(state.copyWith(
        isLoading: false,
        portfolio: portfolio,
      )),
    );
  }

  Future<void> _onChangeTimeRange(
    ChangeTimeRangeEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(selectedRange: event.range, isLoading: true));

    final result = await _repository.getHistory(event.range);

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false)),
      (history) {
        if (state.portfolio != null) {
          emit(state.copyWith(
            isLoading: false,
            portfolio: state.portfolio!.copyWith(history: history),
          ));
        } else {
          emit(state.copyWith(isLoading: false));
        }
      },
    );
  }

  Future<void> _onRefresh(
    RefreshPortfolioEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    final result = await _repository.getPortfolio();

    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (portfolio) => emit(state.copyWith(portfolio: portfolio)),
    );
  }
}



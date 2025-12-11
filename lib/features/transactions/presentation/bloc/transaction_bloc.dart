// ============================================================================
// FILE: transaction_bloc.dart
// PURPOSE: BLoC for transaction history state management
// ============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/i_transaction_repository.dart';
import '../../domain/entities/transaction_entity.dart';

part 'transaction_bloc.freezed.dart';

// Events
@freezed
sealed class TransactionEvent with _$TransactionEvent {
  const TransactionEvent._();
  const factory TransactionEvent.load() = LoadTransactionsEvent;
  const factory TransactionEvent.loadMore() = LoadMoreTransactionsEvent;
  const factory TransactionEvent.applyFilter(TransactionFilter filter) = ApplyFilterEvent;
  const factory TransactionEvent.clearFilter() = ClearFilterEvent;
}

// State
@freezed
sealed class TransactionState with _$TransactionState {
  const TransactionState._();
  
  const factory TransactionState({
    @Default([]) List<Transaction> transactions,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasMore,
    @Default(1) int currentPage,
    TransactionFilter? filter,
    String? error,
  }) = _TransactionState;

  factory TransactionState.initial() => const TransactionState();
}

@injectable
class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final ITransactionRepository _repository;
  static const int _pageSize = 20;

  TransactionBloc(this._repository) : super(TransactionState.initial()) {
    on<LoadTransactionsEvent>(_onLoad);
    on<LoadMoreTransactionsEvent>(_onLoadMore);
    on<ApplyFilterEvent>(_onApplyFilter);
    on<ClearFilterEvent>(_onClearFilter);
  }

  Future<void> _onLoad(
    LoadTransactionsEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, currentPage: 1));

    final result = await _repository.getTransactions(
      filter: state.filter,
      page: 1,
      limit: _pageSize,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (transactions) => emit(state.copyWith(
        isLoading: false,
        transactions: transactions,
        hasMore: transactions.length >= _pageSize,
      )),
    );
  }

  Future<void> _onLoadMore(
    LoadMoreTransactionsEvent event,
    Emitter<TransactionState> emit,
  ) async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;
    final result = await _repository.getTransactions(
      filter: state.filter,
      page: nextPage,
      limit: _pageSize,
    );

    result.fold(
      (failure) => emit(state.copyWith(isLoadingMore: false)),
      (transactions) => emit(state.copyWith(
        isLoadingMore: false,
        transactions: [...state.transactions, ...transactions],
        currentPage: nextPage,
        hasMore: transactions.length >= _pageSize,
      )),
    );
  }

  Future<void> _onApplyFilter(
    ApplyFilterEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(state.copyWith(filter: event.filter));
    add(const TransactionEvent.load());
  }

  void _onClearFilter(
    ClearFilterEvent event,
    Emitter<TransactionState> emit,
  ) {
    emit(state.copyWith(filter: null));
    add(const TransactionEvent.load());
  }
}



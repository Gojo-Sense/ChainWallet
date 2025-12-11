// ============================================================================
// FILE: swap_bloc.dart
// PURPOSE: BLoC for swap feature handling token exchange operations
// ============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/swap_entity.dart';
import '../../domain/entities/swap_failure.dart';
import '../../domain/repositories/i_swap_repository.dart';

part 'swap_event.dart';
part 'swap_state.dart';
part 'swap_bloc.freezed.dart';

@injectable
class SwapBloc extends Bloc<SwapEvent, SwapState> {
  SwapBloc(this._repository) : super(const SwapState.initial()) {
    on<LoadTokens>(_onLoadTokens);
    on<SelectFromToken>(_onSelectFromToken);
    on<SelectToToken>(_onSelectToToken);
    on<UpdateAmount>(_onUpdateAmount);
    on<SwapTokens>(_onSwapTokens);
    on<GetQuote>(_onGetQuote);
    on<ExecuteSwap>(_onExecuteSwap);
    on<LoadHistory>(_onLoadHistory);
    on<ClearQuote>(_onClearQuote);
  }

  final ISwapRepository _repository;

  Future<void> _onLoadTokens(
    LoadTokens event,
    Emitter<SwapState> emit,
  ) async {
    emit(state.copyWith(isLoadingTokens: true));

    final result = await _repository.getAvailableTokens();

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingTokens: false,
        failure: failure,
      )),
      (tokens) => emit(state.copyWith(
        isLoadingTokens: false,
        availableTokens: tokens,
        fromToken: tokens.isNotEmpty ? tokens.first : null,
        toToken: tokens.length > 1 ? tokens[1] : null,
      )),
    );
  }

  void _onSelectFromToken(
    SelectFromToken event,
    Emitter<SwapState> emit,
  ) {
    // If selecting same as toToken, swap them
    if (event.token.id == state.toToken?.id) {
      emit(state.copyWith(
        fromToken: event.token,
        toToken: state.fromToken,
        quote: null,
      ));
    } else {
      emit(state.copyWith(
        fromToken: event.token,
        quote: null,
      ));
    }

    // Auto-fetch quote if amount is set
    if (state.amount > 0) {
      add(const SwapEvent.getQuote());
    }
  }

  void _onSelectToToken(
    SelectToToken event,
    Emitter<SwapState> emit,
  ) {
    // If selecting same as fromToken, swap them
    if (event.token.id == state.fromToken?.id) {
      emit(state.copyWith(
        toToken: event.token,
        fromToken: state.toToken,
        quote: null,
      ));
    } else {
      emit(state.copyWith(
        toToken: event.token,
        quote: null,
      ));
    }

    // Auto-fetch quote if amount is set
    if (state.amount > 0) {
      add(const SwapEvent.getQuote());
    }
  }

  void _onUpdateAmount(
    UpdateAmount event,
    Emitter<SwapState> emit,
  ) {
    emit(state.copyWith(
      amount: event.amount,
      quote: null,
    ));

    // Auto-fetch quote if valid amount
    if (event.amount > 0 && state.fromToken != null && state.toToken != null) {
      add(const SwapEvent.getQuote());
    }
  }

  void _onSwapTokens(
    SwapTokens event,
    Emitter<SwapState> emit,
  ) {
    final temp = state.fromToken;
    emit(state.copyWith(
      fromToken: state.toToken,
      toToken: temp,
      quote: null,
    ));

    // Auto-fetch new quote
    if (state.amount > 0) {
      add(const SwapEvent.getQuote());
    }
  }

  Future<void> _onGetQuote(
    GetQuote event,
    Emitter<SwapState> emit,
  ) async {
    if (state.fromToken == null || state.toToken == null || state.amount <= 0) {
      return;
    }

    emit(state.copyWith(isLoadingQuote: true, failure: null));

    final result = await _repository.getSwapQuote(
      fromToken: state.fromToken!,
      toToken: state.toToken!,
      amount: state.amount,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingQuote: false,
        failure: failure,
        quote: null,
      )),
      (quote) => emit(state.copyWith(
        isLoadingQuote: false,
        quote: quote,
      )),
    );
  }

  Future<void> _onExecuteSwap(
    ExecuteSwap event,
    Emitter<SwapState> emit,
  ) async {
    if (state.quote == null) return;

    emit(state.copyWith(isSwapping: true, failure: null));

    final result = await _repository.executeSwap(quote: state.quote!);

    result.fold(
      (failure) => emit(state.copyWith(
        isSwapping: false,
        failure: failure,
      )),
      (swap) => emit(state.copyWith(
        isSwapping: false,
        lastSwap: swap,
        quote: null,
        amount: 0,
        swapHistory: [swap, ...state.swapHistory],
      )),
    );
  }

  Future<void> _onLoadHistory(
    LoadHistory event,
    Emitter<SwapState> emit,
  ) async {
    emit(state.copyWith(isLoadingHistory: true));

    final result = await _repository.getSwapHistory();

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingHistory: false,
        failure: failure,
      )),
      (history) => emit(state.copyWith(
        isLoadingHistory: false,
        swapHistory: history,
      )),
    );
  }

  void _onClearQuote(
    ClearQuote event,
    Emitter<SwapState> emit,
  ) {
    emit(state.copyWith(quote: null, failure: null));
  }
}



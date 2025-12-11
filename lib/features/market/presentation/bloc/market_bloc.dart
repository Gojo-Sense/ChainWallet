// ============================================================================
// FILE: market_bloc.dart
// PURPOSE: BLoC for market feature handling token/crypto data
// ============================================================================

import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/token_entity.dart';
import '../../domain/failures/market_failure.dart';
import '../../domain/repositories/i_market_repository.dart';

part 'market_event.dart';
part 'market_state.dart';
part 'market_bloc.freezed.dart';

@injectable
class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc(this._repository) : super(MarketState.initial()) {
    on<LoadTopTokens>(_onLoadTopTokens);
    on<RefreshTokens>(_onRefreshTokens);
    on<SelectToken>(_onSelectToken);
    on<LoadChart>(_onLoadChart);
    on<ChangeChartRange>(_onChangeChartRange);
    on<SearchTokens>(_onSearchTokens);
    on<ClearSelection>(_onClearSelection);
    on<StartLiveChart>(_onStartLiveChart);
    on<StopLiveChart>(_onStopLiveChart);
    on<ChangeChartInterval>(_onChangeChartInterval);
  }

  final IMarketRepository _repository;
  StreamSubscription<Either<MarketFailure, CandlestickEntity>>? _liveChartSubscription;

  Future<void> _onLoadTopTokens(
    LoadTopTokens event,
    Emitter<MarketState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failure: null));

    final result = await _repository.getTopTokens();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (tokens) => emit(state.copyWith(isLoading: false, tokens: tokens)),
    );
  }

  Future<void> _onRefreshTokens(
    RefreshTokens event,
    Emitter<MarketState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true, failure: null));

    final result = await _repository.getTopTokens();

    result.fold(
      (failure) => emit(state.copyWith(isRefreshing: false, failure: failure)),
      (tokens) => emit(state.copyWith(isRefreshing: false, tokens: tokens)),
    );
  }

  Future<void> _onSelectToken(
    SelectToken event,
    Emitter<MarketState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failure: null));

    final result = await _repository.getTokenDetails(event.tokenId);

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (token) {
        emit(state.copyWith(isLoading: false, selectedToken: token));
        add(LoadChart(tokenId: event.tokenId, days: state.chartDays));
      },
    );
  }

  Future<void> _onLoadChart(
    LoadChart event,
    Emitter<MarketState> emit,
  ) async {
    emit(state.copyWith(isLoadingChart: true));

    final result = await _repository.getMarketChart(
      event.tokenId,
      days: event.days,
    );

    result.fold(
      (failure) => emit(state.copyWith(isLoadingChart: false)),
      (chart) => emit(state.copyWith(
        isLoadingChart: false,
        chart: chart,
        chartDays: event.days,
      )),
    );
  }

  Future<void> _onChangeChartRange(
    ChangeChartRange event,
    Emitter<MarketState> emit,
  ) async {
    if (state.selectedToken != null) {
      add(LoadChart(tokenId: state.selectedToken!.id, days: event.days));
    }
  }

  Future<void> _onSearchTokens(
    SearchTokens event,
    Emitter<MarketState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(searchResults: []));
      return;
    }

    final result = await _repository.searchTokens(event.query);

    result.fold(
      (failure) => emit(state.copyWith(searchResults: [])),
      (tokens) => emit(state.copyWith(searchResults: tokens)),
    );
  }

  void _onClearSelection(
    ClearSelection event,
    Emitter<MarketState> emit,
  ) {
    emit(state.copyWith(selectedToken: null, chart: null));
    // Stop live chart when clearing selection
    add(const MarketEvent.stopLiveChart());
  }

  Future<void> _onStartLiveChart(
    StartLiveChart event,
    Emitter<MarketState> emit,
  ) async {
    // Stop existing subscription if any
    await _liveChartSubscription?.cancel();
    _liveChartSubscription = null;

    // Initialize with empty candles
    emit(state.copyWith(
      liveCandles: [],
      chartInterval: event.interval,
      isLiveChartActive: true,
    ));

    // Start streaming
    final stream = _repository.streamLiveCandles(
      event.tokenId,
      event.interval,
    );

    _liveChartSubscription = stream.listen(
      (either) {
        either.fold(
          (failure) {
            // Handle error - could emit error state if needed
          },
          (candle) {
            // Update candles list
            final currentCandles = List<CandlestickEntity>.from(state.liveCandles);
            
            // If candle is closed, replace the last one or add new
            // If candle is not closed, update the last one
            if (candle.isClosed) {
              // Remove any incomplete candle and add the new closed one
              currentCandles.removeWhere((c) => !c.isClosed);
              currentCandles.add(candle);
              
              // Keep only last 200 candles
              if (currentCandles.length > 200) {
                currentCandles.removeRange(0, currentCandles.length - 200);
              }
            } else {
              // Update the last candle if it's incomplete, otherwise add new
              if (currentCandles.isNotEmpty && !currentCandles.last.isClosed) {
                currentCandles[currentCandles.length - 1] = candle;
              } else {
                currentCandles.add(candle);
              }
            }
            
            emit(state.copyWith(liveCandles: currentCandles));
          },
        );
      },
      onError: (error) {
        emit(state.copyWith(
          isLiveChartActive: false,
          failure: MarketFailure.networkError(message: error.toString()),
        ));
      },
    );
  }

  Future<void> _onStopLiveChart(
    StopLiveChart event,
    Emitter<MarketState> emit,
  ) async {
    await _liveChartSubscription?.cancel();
    _liveChartSubscription = null;
    
    emit(state.copyWith(
      isLiveChartActive: false,
      liveCandles: [],
      chartInterval: null,
    ));
  }

  Future<void> _onChangeChartInterval(
    ChangeChartInterval event,
    Emitter<MarketState> emit,
  ) async {
    if (state.selectedToken != null && state.isLiveChartActive) {
      // Restart live chart with new interval
      add(MarketEvent.startLiveChart(
        tokenId: state.selectedToken!.id,
        interval: event.interval,
      ));
    }
  }

  @override
  Future<void> close() {
    _liveChartSubscription?.cancel();
    return super.close();
  }
}


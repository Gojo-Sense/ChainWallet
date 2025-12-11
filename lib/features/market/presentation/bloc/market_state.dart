// ============================================================================
// FILE: market_state.dart
// PURPOSE: BLoC states for market feature
// ============================================================================

part of 'market_bloc.dart';

@freezed
sealed class MarketState with _$MarketState {
  const MarketState._();

  const factory MarketState({
    @Default([]) List<TokenEntity> tokens,
    @Default([]) List<TokenEntity> searchResults,
    TokenEntity? selectedToken,
    MarketChartEntity? chart,
    @Default(7) int chartDays,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingChart,
    @Default(false) bool isRefreshing,
    MarketFailure? failure,
    @Default([]) List<CandlestickEntity> liveCandles,
    String? chartInterval,
    @Default(false) bool isLiveChartActive,
  }) = _MarketState;

  /// Initial state
  factory MarketState.initial() => const MarketState();

  /// Check if we have tokens loaded
  bool get hasTokens => tokens.isNotEmpty;

  /// Check if we have a selection
  bool get hasSelection => selectedToken != null;

  /// Check if chart is ready
  bool get hasChart => chart != null;
}

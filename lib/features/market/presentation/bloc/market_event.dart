// ============================================================================
// FILE: market_event.dart
// PURPOSE: BLoC events for market feature
// ============================================================================

part of 'market_bloc.dart';

@freezed
class MarketEvent with _$MarketEvent {
  /// Load top tokens on initial load
  const factory MarketEvent.loadTopTokens() = LoadTopTokens;

  /// Refresh token list
  const factory MarketEvent.refreshTokens() = RefreshTokens;

  /// Select a token to view details
  const factory MarketEvent.selectToken(String tokenId) = SelectToken;

  /// Load chart data for selected token
  const factory MarketEvent.loadChart({
    required String tokenId,
    @Default(7) int days,
  }) = LoadChart;

  /// Change chart time range
  const factory MarketEvent.changeChartRange(int days) = ChangeChartRange;

  /// Search for tokens
  const factory MarketEvent.searchTokens(String query) = SearchTokens;

  /// Clear selection
  const factory MarketEvent.clearSelection() = ClearSelection;

  /// Start live candlestick chart stream
  const factory MarketEvent.startLiveChart({
    required String tokenId,
    @Default('15m') String interval,
  }) = StartLiveChart;

  /// Stop live chart stream
  const factory MarketEvent.stopLiveChart() = StopLiveChart;

  /// Change chart interval
  const factory MarketEvent.changeChartInterval(String interval) = ChangeChartInterval;
}


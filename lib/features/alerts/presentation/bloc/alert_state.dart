// ============================================================================
// FILE: alert_state.dart
// PURPOSE: State for AlertBloc
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/alert_entity.dart';

part 'alert_state.freezed.dart';

@freezed
sealed class AlertState with _$AlertState {
  const AlertState._();
  
  const factory AlertState({
    @Default([]) List<PriceAlert> alerts,
    @Default(false) bool isLoading,
    String? error,
    String? successMessage,
  }) = _AlertState;

  factory AlertState.initial() => const AlertState();
}


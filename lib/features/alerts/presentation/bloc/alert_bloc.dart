// ============================================================================
// FILE: alert_bloc.dart
// PURPOSE: BLoC for managing price alerts
// ============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/i_alert_repository.dart';
import '../../../../core/services/websocket_service.dart'; // Added import for WebSocketService
import 'alert_event.dart';
import 'alert_state.dart';

@injectable
class AlertBloc extends Bloc<AlertEvent, AlertState> {
  final IAlertRepository _alertRepository;
  final WebSocketService _webSocketService; // Added WebSocketService field

  AlertBloc(this._alertRepository, this._webSocketService) : super(AlertState.initial()) { // Added WebSocketService parameter
    on<LoadAlertsEvent>(_onLoadAlerts);
    on<CreateAlertEvent>(_onCreateAlert);
    on<DeleteAlertEvent>(_onDeleteAlert);
    on<ToggleAlertEvent>(_onToggleAlert);
    
    // Listen for alert triggers from WebSocket
    _webSocketService.alertTriggers.listen(_onAlertTriggered);
  }

  Future<void> _onLoadAlerts(
    LoadAlertsEvent event,
    Emitter<AlertState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _alertRepository.getAlerts();

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.toString(),
      )),
      (alerts) => emit(state.copyWith(
        isLoading: false,
        alerts: alerts,
      )),
    );
  }

  Future<void> _onCreateAlert(
    CreateAlertEvent event,
    Emitter<AlertState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));

    final result = await _alertRepository.createAlert(
      tokenId: event.tokenId,
      tokenName: event.tokenName,
      tokenSymbol: event.tokenSymbol,
      targetPrice: event.targetPrice,
      currentPrice: event.currentPrice,
      condition: event.condition,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.toString(),
      )),
      (alert) => emit(state.copyWith(
        isLoading: false,
        alerts: [...state.alerts, alert],
        successMessage: 'Alert created for ${alert.tokenSymbol}',
      )),
    );
  }

  Future<void> _onDeleteAlert(
    DeleteAlertEvent event,
    Emitter<AlertState> emit,
  ) async {
    final result = await _alertRepository.deleteAlert(event.alertId);

    result.fold(
      (failure) => emit(state.copyWith(error: failure.toString())),
      (_) {
        final updatedAlerts =
            state.alerts.where((a) => a.id != event.alertId).toList();
        emit(state.copyWith(
          alerts: updatedAlerts,
          successMessage: 'Alert deleted',
        ));
      },
    );
  }

  Future<void> _onToggleAlert(
    ToggleAlertEvent event,
    Emitter<AlertState> emit,
  ) async {
    final result = await _alertRepository.toggleAlert(event.alertId);

    result.fold(
      (failure) => emit(state.copyWith(error: failure.toString())),
      (updatedAlert) {
        final updatedAlerts = state.alerts.map((a) {
          return a.id == updatedAlert.id ? updatedAlert : a;
        }).toList();
        emit(state.copyWith(alerts: updatedAlerts));
      },
    );
  }
  
  /// Handle alert triggered events from WebSocket
  void _onAlertTriggered(Map<String, dynamic> alertData) {
    // Reload alerts to reflect the triggered state
    add(const AlertEvent.loadAlerts());
  }
}



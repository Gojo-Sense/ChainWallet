// ============================================================================
// FILE: auth_bloc.dart
// PURPOSE: BLoC for authentication feature
// ============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/failures/auth_failure.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../../../core/services/websocket_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repository, this._webSocketService) : super(const AuthState.initial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  final IAuthRepository _repository;
  final WebSocketService _webSocketService;

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _repository.isAuthenticated();

    result.fold(
      (failure) => emit(AuthState.unauthenticated()),
      (isAuthenticated) {
        if (isAuthenticated) {
          // Connect WebSocket when authenticated
          _webSocketService.connect();
          emit(const AuthState.authenticated());
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _repository.login(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthState.failure(failure)),
      (data) {
        final user = data['user'] as UserEntity;
        // Connect WebSocket after successful login
        _webSocketService.connect();
        emit(AuthState.authenticated(user: user));
      },
    );
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _repository.register(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthState.failure(failure)),
      (data) {
        final user = data['user'] as UserEntity;
        // Connect WebSocket after successful registration
        _webSocketService.connect();
        emit(AuthState.authenticated(user: user));
      },
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _repository.logout();

    result.fold(
      (failure) => emit(AuthState.failure(failure)),
      (_) {
        // Disconnect WebSocket on logout
        _webSocketService.disconnect();
        emit(const AuthState.unauthenticated());
      },
    );
  }
}


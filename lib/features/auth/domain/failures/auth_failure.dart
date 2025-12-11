// ============================================================================
// FILE: auth_failure.dart
// PURPOSE: Auth-specific failure types using Freezed union
// NOTE: Pure Dart - NO Flutter imports
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/failures.dart';

part 'auth_failure.freezed.dart';

/// Auth feature specific failures
@freezed
sealed class AuthFailure with _$AuthFailure implements Failure {
  const AuthFailure._();

  /// Network request failed
  const factory AuthFailure.networkError({
    @Default('Failed to connect to server') String message,
  }) = AuthNetworkFailure;

  /// Invalid credentials
  const factory AuthFailure.invalidCredentials({
    @Default('Invalid email or password') String message,
  }) = InvalidCredentialsFailure;

  /// User already exists
  const factory AuthFailure.userExists({
    @Default('User already exists') String message,
  }) = UserExistsFailure;

  /// Server error
  const factory AuthFailure.serverError({
    @Default('Server error occurred') String message,
  }) = AuthServerFailure;

  /// Bad request
  const factory AuthFailure.badRequest({
    @Default('Invalid request') String message,
  }) = BadRequestFailure;

  /// Unauthorized
  const factory AuthFailure.unauthorized({
    @Default('Unauthorized') String message,
  }) = UnauthorizedFailure;

  /// Not found
  const factory AuthFailure.notFound({
    @Default('Resource not found') String message,
  }) = NotFoundFailure;

  /// Unknown error
  const factory AuthFailure.unknown({
    @Default('An unknown error occurred') String message,
  }) = UnknownAuthFailure;
}



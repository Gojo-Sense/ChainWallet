// ============================================================================
// FILE: failures.dart
// PURPOSE: Base failure classes for the application using Freezed unions
// PATTERN: Each feature will have its own Failure union extending this
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure class that all feature-specific failures extend
abstract class Failure {
  String get message;
}

/// Core application failures that can occur anywhere
@freezed
sealed class CoreFailure with _$CoreFailure implements Failure {
  const CoreFailure._();

  /// Unexpected error occurred
  const factory CoreFailure.unexpected({
    @Default('An unexpected error occurred') String message,
  }) = UnexpectedFailure;

  /// Storage operation failed
  const factory CoreFailure.storage({
    @Default('Failed to access secure storage') String message,
  }) = StorageFailure;

  /// Network connectivity issue
  const factory CoreFailure.network({
    @Default('No internet connection') String message,
  }) = NetworkFailure;

  /// Server returned an error
  const factory CoreFailure.server({
    @Default('Server error occurred') String message,
    int? statusCode,
  }) = ServerFailure;

  /// Invalid data received
  const factory CoreFailure.invalidData({
    @Default('Invalid data received') String message,
  }) = InvalidDataFailure;
}

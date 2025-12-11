// ============================================================================
// FILE: chat_failure.dart
// PURPOSE: Domain failures for the chat feature
// PATTERN: Freezed union class for type-safe error handling
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_failure.freezed.dart';

@freezed
class ChatFailure with _$ChatFailure {
  const factory ChatFailure.parseError({
    required String message,
  }) = ChatParseError;

  const factory ChatFailure.apiError({
    required String message,
  }) = ChatApiError;

  const factory ChatFailure.unknownCommand({
    required String input,
  }) = ChatUnknownCommand;

  const factory ChatFailure.invalidAddress({
    required String address,
  }) = ChatInvalidAddress;

  const factory ChatFailure.insufficientBalance({
    required String token,
    required double required,
    required double available,
  }) = ChatInsufficientBalance;
}



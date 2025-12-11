// ============================================================================
// FILE: chat_event.dart
// PURPOSE: Events for the ChatBloc
// PATTERN: Freezed union class
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/chat_entity.dart';

part 'chat_event.freezed.dart';

@freezed
class ChatEvent with _$ChatEvent {
  /// Send a message to the assistant
  const factory ChatEvent.sendMessage({
    required String message,
  }) = SendMessageEvent;

  /// Execute an action suggested by the assistant
  const factory ChatEvent.executeAction({
    required ChatAction action,
  }) = ExecuteActionEvent;

  /// Clear chat history
  const factory ChatEvent.clearHistory() = ClearHistoryEvent;

  /// Load initial greeting
  const factory ChatEvent.loadInitial() = LoadInitialEvent;
}



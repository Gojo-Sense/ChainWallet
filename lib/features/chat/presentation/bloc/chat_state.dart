// ============================================================================
// FILE: chat_state.dart
// PURPOSE: State for the ChatBloc
// PATTERN: Freezed class with message history
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/chat_entity.dart';

part 'chat_state.freezed.dart';

@freezed
sealed class ChatState with _$ChatState {
  const ChatState._();
  
  const factory ChatState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isProcessing,
    @Default([]) List<ChatSuggestion> suggestions,
    String? error,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState();
}


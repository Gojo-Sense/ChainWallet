// ============================================================================
// FILE: chat_bloc.dart
// PURPOSE: BLoC for managing chat state and processing messages
// PATTERN: flutter_bloc with fpdart error handling
// ============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/chat_entity.dart';
import '../../domain/repositories/i_chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepository _chatRepository;
  final Uuid _uuid = const Uuid();

  ChatBloc(this._chatRepository) : super(ChatState.initial()) {
    on<SendMessageEvent>(_onSendMessage);
    on<ExecuteActionEvent>(_onExecuteAction);
    on<ClearHistoryEvent>(_onClearHistory);
    on<LoadInitialEvent>(_onLoadInitial);
  }

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    // Add user message
    final userMessage = ChatMessage(
      id: _uuid.v4(),
      content: event.message,
      isUser: true,
      timestamp: DateTime.now(),
    );

    // Add loading message
    final loadingMessage = ChatMessage(
      id: _uuid.v4(),
      content: '',
      isUser: false,
      timestamp: DateTime.now(),
      isLoading: true,
    );

    emit(state.copyWith(
      messages: [...state.messages, userMessage, loadingMessage],
      isProcessing: true,
      error: null,
    ));

    // Process the message
    final result = await _chatRepository.processMessage(event.message);

    result.fold(
      (failure) {
        // Remove loading message and add error response
        final updatedMessages = state.messages
            .where((m) => !m.isLoading)
            .toList();
        
        final errorMessage = ChatMessage(
          id: _uuid.v4(),
          content: '❌ Sorry, something went wrong. Please try again.',
          isUser: false,
          timestamp: DateTime.now(),
        );

        emit(state.copyWith(
          messages: [...updatedMessages, errorMessage],
          isProcessing: false,
          error: failure.toString(),
        ));
      },
      (response) {
        // Remove loading message and add response
        final updatedMessages = state.messages
            .where((m) => !m.isLoading)
            .toList();

        emit(state.copyWith(
          messages: [...updatedMessages, response],
          isProcessing: false,
        ));
      },
    );
  }

  Future<void> _onExecuteAction(
    ExecuteActionEvent event,
    Emitter<ChatState> emit,
  ) async {
    // Add a confirmation message based on action type
    final confirmationMessage = event.action.when(
      sendCrypto: (address, amount, token) => ChatMessage(
        id: _uuid.v4(),
        content: '✅ Opening send flow for $amount $token...',
        isUser: false,
        timestamp: DateTime.now(),
      ),
      swap: (fromToken, toToken, amount) => ChatMessage(
        id: _uuid.v4(),
        content: '✅ Opening swap: $fromToken → $toToken',
        isUser: false,
        timestamp: DateTime.now(),
      ),
      showChart: (tokenId, tokenName) => ChatMessage(
        id: _uuid.v4(),
        content: '📊 Opening chart for $tokenName...',
        isUser: false,
        timestamp: DateTime.now(),
      ),
      priceAlert: (token, targetPrice, isAbove) => ChatMessage(
        id: _uuid.v4(),
        content: '🔔 Alert set for $token at \$${targetPrice.toStringAsFixed(0)}',
        isUser: false,
        timestamp: DateTime.now(),
      ),
      navigate: (route, label) => ChatMessage(
        id: _uuid.v4(),
        content: '🚀 Navigating to ${label ?? route}...',
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );

    emit(state.copyWith(
      messages: [...state.messages, confirmationMessage],
    ));
  }

  void _onClearHistory(
    ClearHistoryEvent event,
    Emitter<ChatState> emit,
  ) {
    emit(ChatState.initial().copyWith(
      suggestions: _chatRepository.getQuickSuggestions(),
    ));
  }

  Future<void> _onLoadInitial(
    LoadInitialEvent event,
    Emitter<ChatState> emit,
  ) async {
    final suggestions = _chatRepository.getQuickSuggestions();
    
    // Add welcome message
    final welcomeMessage = ChatMessage(
      id: _uuid.v4(),
      content: '''👋 **Welcome to Aether Assistant!**

I'm your crypto companion. I can help you:

• Check token prices
• Send transactions
• Swap tokens
• Set price alerts
• View your portfolio

What would you like to do?''',
      isUser: false,
      timestamp: DateTime.now(),
    );

    emit(state.copyWith(
      messages: [welcomeMessage],
      suggestions: suggestions,
    ));
  }
}



// ============================================================================
// FILE: chat_page.dart
// PURPOSE: Main chat assistant page
// DESIGN: Deep Glassmorphism with animated messages
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/chat_entity.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../bloc/chat_state.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';
import '../widgets/suggestion_chip.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load initial greeting
    context.read<ChatBloc>().add(const ChatEvent.loadInitial());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSend(String message) {
    context.read<ChatBloc>().add(ChatEvent.sendMessage(message: message));
    _scrollToBottom();
  }

  void _handleSuggestion(ChatSuggestion suggestion) {
    _handleSend(suggestion.query);
  }

  void _handleAction(ChatAction action) {
    context.read<ChatBloc>().add(ChatEvent.executeAction(action: action));
    
    // Navigate based on action type
    action.when(
      sendCrypto: (address, amount, token) {
        // Would open send flow
        HapticFeedback.mediumImpact();
      },
      swap: (fromToken, toToken, amount) {
        context.push('/swap');
      },
      showChart: (tokenId, tokenName) {
        context.push('/token/$tokenId');
      },
      priceAlert: (token, targetPrice, isAbove) {
        // Would open alerts settings
        HapticFeedback.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Alert set for $token at \$${targetPrice.toStringAsFixed(0)}'),
            backgroundColor: AppColors.success,
          ),
        );
      },
      navigate: (route, label) {
        context.push(route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.5),
            radius: 1.5,
            colors: [
              AppColors.neonPurple.withAlpha(15),
              AppColors.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: BlocConsumer<ChatBloc, ChatState>(
                  listener: (context, state) {
                    if (state.messages.isNotEmpty) {
                      _scrollToBottom();
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        // Suggestions
                        if (state.suggestions.isNotEmpty)
                          _buildSuggestions(state.suggestions),
                        
                        // Messages
                        Expanded(
                          child: _buildMessages(state.messages),
                        ),
                        
                        // Input
                        ChatInput(
                          onSend: _handleSend,
                          isProcessing: state.isProcessing,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.glassBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Assistant avatar
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppColors.aetherGradient,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neonCyan.withAlpha(60),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                '🤖',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Aether Assistant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.success.withAlpha(150),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Online • Crypto Expert',
                      style: TextStyle(
                        color: Colors.white.withAlpha(150),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Clear chat
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.read<ChatBloc>().add(const ChatEvent.clearHistory());
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.glassBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Icon(
                Icons.refresh,
                color: Colors.white.withAlpha(150),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: -0.2, end: 0);
  }

  Widget _buildSuggestions(List<ChatSuggestion> suggestions) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: suggestions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return SuggestionChip(
            suggestion: suggestions[index],
            onTap: () => _handleSuggestion(suggestions[index]),
          )
              .animate()
              .fadeIn(delay: (100 * index).ms)
              .slideX(begin: 0.2, end: 0);
        },
      ),
    );
  }

  Widget _buildMessages(List<ChatMessage> messages) {
    if (messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: AppColors.aetherGradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.neonCyan.withAlpha(60),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Center(
                child: Text('🤖', style: TextStyle(fontSize: 40)),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Ask me anything!',
              style: TextStyle(
                color: Colors.white.withAlpha(180),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'I\'m here to help with crypto',
              style: TextStyle(
                color: Colors.white.withAlpha(100),
                fontSize: 14,
              ),
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .scale(begin: const Offset(0.9, 0.9)),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ChatBubble(
          key: ValueKey(message.id),
          message: message,
          onActionTap: message.action != null
              ? () => _handleAction(message.action!)
              : null,
        )
            .animate()
            .fadeIn(duration: 300.ms)
            .slideY(
              begin: message.isUser ? 0.1 : -0.1,
              end: 0,
              curve: Curves.easeOut,
            );
      },
    );
  }
}


// ============================================================================
// FILE: chat_bubble.dart
// PURPOSE: Chat message bubble with glass design
// DESIGN: Deep Glassmorphism with gradient accents
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/chat_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final VoidCallback? onActionTap;

  const ChatBubble({
    super.key,
    required this.message,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        margin: EdgeInsets.only(
          left: message.isUser ? 48 : 16,
          right: message.isUser ? 16 : 48,
          top: 8,
          bottom: 8,
        ),
        child: message.isLoading
            ? _buildLoadingBubble()
            : _buildMessageBubble(context),
      ),
    );
  }

  Widget _buildLoadingBubble() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.glassBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTypingDot(0),
              const SizedBox(width: 4),
              _buildTypingDot(100),
              const SizedBox(width: 4),
              _buildTypingDot(200),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypingDot(int delayMs) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.neonCyan,
        shape: BoxShape.circle,
      ),
    )
        .animate(onPlay: (c) => c.repeat())
        .fadeIn(delay: Duration(milliseconds: delayMs))
        .then()
        .fadeOut()
        .then()
        .fadeIn();
  }

  Widget _buildMessageBubble(BuildContext context) {
    return GestureDetector(
      onTap: message.action != null ? onActionTap : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: message.isUser
                  ? AppColors.aetherGradient
                  : null,
              color: message.isUser ? null : AppColors.glassBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: message.isUser
                    ? Colors.transparent
                    : AppColors.glassBorder,
              ),
              boxShadow: message.isUser
                  ? [
                      BoxShadow(
                        color: AppColors.neonCyan.withAlpha(40),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMessageContent(context),
                if (message.action != null) ...[
                  const SizedBox(height: 12),
                  _buildActionHint(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    // Simple markdown-like parsing for bold text
    final content = message.content;
    final spans = <TextSpan>[];
    
    final regex = RegExp(r'\*\*(.+?)\*\*');
    int lastEnd = 0;
    
    for (final match in regex.allMatches(content)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: content.substring(lastEnd, match.start),
        ));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
      lastEnd = match.end;
    }
    
    if (lastEnd < content.length) {
      spans.add(TextSpan(
        text: content.substring(lastEnd),
      ));
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: message.isUser ? Colors.white : Colors.white.withAlpha(230),
          fontSize: 15,
          height: 1.5,
        ),
        children: spans.isEmpty ? [TextSpan(text: content)] : spans,
      ),
    );
  }

  Widget _buildActionHint() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.neonCyan.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.neonCyan.withAlpha(50),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getActionIcon(),
            size: 16,
            color: AppColors.neonCyan,
          ),
          const SizedBox(width: 8),
          Text(
            'Tap to continue',
            style: TextStyle(
              color: AppColors.neonCyan,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: AppColors.neonCyan,
          ),
        ],
      ),
    )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .shimmer(duration: 2.seconds, color: AppColors.neonCyan.withAlpha(30));
  }

  IconData _getActionIcon() {
    if (message.action == null) return Icons.touch_app;
    
    return message.action!.when(
      sendCrypto: (_, __, ___) => Icons.send,
      swap: (_, __, ___) => Icons.swap_horiz,
      showChart: (_, __) => Icons.show_chart,
      priceAlert: (_, __, ___) => Icons.notifications,
      navigate: (_, __) => Icons.open_in_new,
    );
  }
}



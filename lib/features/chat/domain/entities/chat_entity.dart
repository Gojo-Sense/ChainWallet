// ============================================================================
// FILE: chat_entity.dart
// PURPOSE: Domain entities for the crypto chat assistant
// PATTERN: Freezed union classes for type-safe chat actions
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_entity.freezed.dart';

/// Chat message entity
@freezed
sealed class ChatMessage with _$ChatMessage {
  const ChatMessage._();
  
  const factory ChatMessage({
    required String id,
    required String content,
    required bool isUser,
    required DateTime timestamp,
    @Default(null) ChatAction? action,
    @Default(false) bool isLoading,
  }) = _ChatMessage;
}

/// Actionable responses that the chat can suggest
@freezed
sealed class ChatAction with _$ChatAction {
  const ChatAction._();
  
  /// Send crypto to an address
  const factory ChatAction.sendCrypto({
    required String address,
    required double amount,
    required String token,
  }) = SendCryptoAction;

  /// Swap tokens
  const factory ChatAction.swap({
    required String fromToken,
    required String toToken,
    @Default(0.0) double amount,
  }) = SwapAction;

  /// Show price chart for a token
  const factory ChatAction.showChart({
    required String tokenId,
    required String tokenName,
  }) = ShowChartAction;

  /// Set a price alert
  const factory ChatAction.priceAlert({
    required String token,
    required double targetPrice,
    required bool isAbove,
  }) = PriceAlertAction;

  /// Navigate to a page
  const factory ChatAction.navigate({
    required String route,
    String? label,
  }) = NavigateAction;
}

/// Quick suggestion chips for the user
@freezed
sealed class ChatSuggestion with _$ChatSuggestion {
  const ChatSuggestion._();
  
  const factory ChatSuggestion({
    required String label,
    required String emoji,
    required String query,
  }) = _ChatSuggestion;
}

/// Gas price information
@freezed
sealed class GasPrice with _$GasPrice {
  const GasPrice._();
  
  const factory GasPrice({
    required double slow,
    required double standard,
    required double fast,
    required String unit,
  }) = _GasPrice;
}

/// Parsed send command
@freezed
sealed class ParsedSendCommand with _$ParsedSendCommand {
  const ParsedSendCommand._();
  
  const factory ParsedSendCommand({
    required double amount,
    required String token,
    required String address,
  }) = _ParsedSendCommand;
}

/// Parsed swap command
@freezed
sealed class ParsedSwapCommand with _$ParsedSwapCommand {
  const ParsedSwapCommand._();
  
  const factory ParsedSwapCommand({
    required double amount,
    required String fromToken,
    required String toToken,
  }) = _ParsedSwapCommand;
}


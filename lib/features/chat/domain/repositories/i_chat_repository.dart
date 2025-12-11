// ============================================================================
// FILE: i_chat_repository.dart
// PURPOSE: Repository interface for chat operations
// PATTERN: Interface with fpdart Either for error handling
// ============================================================================

import 'package:fpdart/fpdart.dart';
import '../entities/chat_entity.dart';
import '../failures/chat_failure.dart';

/// Repository interface for chat operations
abstract class IChatRepository {
  /// Process user input and generate a response
  Future<Either<ChatFailure, ChatMessage>> processMessage(String input);

  /// Get current gas prices
  Future<Either<ChatFailure, GasPrice>> getGasPrices();

  /// Get token price
  Future<Either<ChatFailure, double>> getTokenPrice(String tokenId);

  /// Validate crypto address
  Either<ChatFailure, bool> validateAddress(String address);

  /// Parse a send command from user input
  Either<ChatFailure, ParsedSendCommand> parseSendCommand(String input);

  /// Parse a swap command from user input
  Either<ChatFailure, ParsedSwapCommand> parseSwapCommand(String input);

  /// Get quick suggestions based on context
  List<ChatSuggestion> getQuickSuggestions();
}



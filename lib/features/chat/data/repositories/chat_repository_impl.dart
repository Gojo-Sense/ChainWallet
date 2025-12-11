// ============================================================================
// FILE: chat_repository_impl.dart
// PURPOSE: Implementation of the crypto chat repository
// PATTERN: Smart command parsing without LLM, uses regex and patterns
// ============================================================================

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/chat_entity.dart';
import '../../domain/failures/chat_failure.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../../../market/domain/repositories/i_market_repository.dart';

@LazySingleton(as: IChatRepository)
class ChatRepositoryImpl implements IChatRepository {
  final IMarketRepository _marketRepository;
  final Uuid _uuid = const Uuid();

  ChatRepositoryImpl(this._marketRepository);

  // Token aliases for natural language parsing
  static const Map<String, String> _tokenAliases = {
    'bitcoin': 'bitcoin',
    'btc': 'bitcoin',
    'ethereum': 'ethereum',
    'eth': 'ethereum',
    'ether': 'ethereum',
    'solana': 'solana',
    'sol': 'solana',
    'dogecoin': 'dogecoin',
    'doge': 'dogecoin',
    'cardano': 'cardano',
    'ada': 'cardano',
    'polygon': 'matic-network',
    'matic': 'matic-network',
    'usdt': 'tether',
    'tether': 'tether',
    'usdc': 'usd-coin',
    'bnb': 'binancecoin',
    'xrp': 'ripple',
    'ripple': 'ripple',
    'avalanche': 'avalanche-2',
    'avax': 'avalanche-2',
  };

  @override
  Future<Either<ChatFailure, ChatMessage>> processMessage(String input) async {
    final lowerInput = input.toLowerCase().trim();

    // Price queries
    if (_isPriceQuery(lowerInput)) {
      return _handlePriceQuery(lowerInput);
    }

    // Gas prices
    if (_isGasQuery(lowerInput)) {
      return _handleGasQuery();
    }

    // Send commands
    if (_isSendCommand(lowerInput)) {
      return _handleSendCommand(lowerInput);
    }

    // Swap commands
    if (_isSwapCommand(lowerInput)) {
      return _handleSwapCommand(lowerInput);
    }

    // Portfolio/balance queries
    if (_isPortfolioQuery(lowerInput)) {
      return _handlePortfolioQuery();
    }

    // Price alert commands
    if (_isAlertCommand(lowerInput)) {
      return _handleAlertCommand(lowerInput);
    }

    // Help commands
    if (_isHelpQuery(lowerInput)) {
      return _handleHelpQuery();
    }

    // Greeting
    if (_isGreeting(lowerInput)) {
      return _handleGreeting();
    }

    // Default: show help
    return right(_createMessage(
      '''I'm not sure what you mean. Here's what I can help with:

💰 **Prices**: "What's the price of ETH?"
⛽ **Gas**: "What are gas prices?"
📤 **Send**: "Send 0.5 ETH to 0x..."
🔄 **Swap**: "Swap 1 ETH for USDC"
📊 **Portfolio**: "Show my portfolio"
🔔 **Alerts**: "Alert me when BTC hits 100k"

Try asking one of these!''',
    ));
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // QUERY MATCHERS
  // ═══════════════════════════════════════════════════════════════════════════

  bool _isPriceQuery(String input) {
    final patterns = [
      'price of',
      'price for',
      'how much is',
      'what\'s',
      'whats',
      'what is',
      'current price',
      'check price',
      'show price',
    ];
    return patterns.any((p) => input.contains(p)) &&
        _extractToken(input) != null;
  }

  bool _isGasQuery(String input) {
    return input.contains('gas') ||
        input.contains('fee') ||
        input.contains('transaction cost');
  }

  bool _isSendCommand(String input) {
    return input.startsWith('send ') ||
        input.contains('transfer ') ||
        input.contains('pay ');
  }

  bool _isSwapCommand(String input) {
    return input.contains('swap') ||
        input.contains('exchange') ||
        input.contains('convert') ||
        input.contains(' for ') ||
        input.contains(' to ');
  }

  bool _isPortfolioQuery(String input) {
    return input.contains('portfolio') ||
        input.contains('balance') ||
        input.contains('holdings') ||
        input.contains('my wallet') ||
        input.contains('my crypto');
  }

  bool _isAlertCommand(String input) {
    return input.contains('alert') ||
        input.contains('notify') ||
        input.contains('tell me when') ||
        input.contains('remind');
  }

  bool _isHelpQuery(String input) {
    return input.contains('help') ||
        input.contains('what can you') ||
        input.contains('commands') ||
        input == '?';
  }

  bool _isGreeting(String input) {
    final greetings = ['hi', 'hello', 'hey', 'yo', 'sup', 'gm', 'good morning'];
    return greetings.any((g) => input == g || input.startsWith('$g '));
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // QUERY HANDLERS
  // ═══════════════════════════════════════════════════════════════════════════

  Future<Either<ChatFailure, ChatMessage>> _handlePriceQuery(String input) async {
    final token = _extractToken(input);
    if (token == null) {
      return left(const ChatParseError(message: 'Could not identify the token'));
    }

    final tokenId = _tokenAliases[token] ?? token;
    final priceResult = await getTokenPrice(tokenId);

    return priceResult.fold(
      (failure) => right(_createMessage(
        '❌ Could not fetch price for ${token.toUpperCase()}. Please try again.',
      )),
      (price) {
        final formattedPrice = price > 1
            ? '\$${price.toStringAsFixed(2)}'
            : '\$${price.toStringAsFixed(6)}';

        return right(_createMessage(
          '📈 **${token.toUpperCase()}** is currently at **$formattedPrice**\n\nTap to view the full chart →',
          action: ChatAction.showChart(
            tokenId: tokenId,
            tokenName: token.toUpperCase(),
          ),
        ));
      },
    );
  }

  Future<Either<ChatFailure, ChatMessage>> _handleGasQuery() async {
    final gasResult = await getGasPrices();

    return gasResult.fold(
      (failure) => right(_createMessage(
        '⛽ **Current Gas Prices (Ethereum)**\n\n'
        '🐢 Slow: ~25 gwei\n'
        '🚶 Standard: ~35 gwei\n'
        '🚀 Fast: ~50 gwei\n\n'
        '_Estimated. Check a gas tracker for live prices._',
      )),
      (gas) => right(_createMessage(
        '⛽ **Current Gas Prices**\n\n'
        '🐢 Slow: ${gas.slow.toStringAsFixed(0)} ${gas.unit}\n'
        '🚶 Standard: ${gas.standard.toStringAsFixed(0)} ${gas.unit}\n'
        '🚀 Fast: ${gas.fast.toStringAsFixed(0)} ${gas.unit}',
      )),
    );
  }

  Future<Either<ChatFailure, ChatMessage>> _handleSendCommand(String input) async {
    final parsed = parseSendCommand(input);

    return parsed.fold(
      (failure) => right(_createMessage(
        '❌ Could not parse send command.\n\n'
        'Try: "Send 0.5 ETH to 0x1234..."',
      )),
      (cmd) => right(_createMessage(
        '📤 **Ready to send**\n\n'
        '**Amount**: ${cmd.amount} ${cmd.token.toUpperCase()}\n'
        '**To**: ${_shortenAddress(cmd.address)}\n\n'
        'Tap to confirm this transaction →',
        action: ChatAction.sendCrypto(
          address: cmd.address,
          amount: cmd.amount,
          token: cmd.token,
        ),
      )),
    );
  }

  Future<Either<ChatFailure, ChatMessage>> _handleSwapCommand(String input) async {
    final parsed = parseSwapCommand(input);

    return parsed.fold(
      (failure) => right(_createMessage(
        '🔄 **Token Swap**\n\n'
        'What would you like to swap?\n'
        'Try: "Swap 1 ETH for USDC"',
        action: const ChatAction.navigate(route: '/swap', label: 'Open Swap'),
      )),
      (cmd) => right(_createMessage(
        '🔄 **Swap Preview**\n\n'
        '**From**: ${cmd.amount} ${cmd.fromToken.toUpperCase()}\n'
        '**To**: ${cmd.toToken.toUpperCase()}\n\n'
        'Tap to proceed with this swap →',
        action: ChatAction.swap(
          fromToken: cmd.fromToken,
          toToken: cmd.toToken,
          amount: cmd.amount,
        ),
      )),
    );
  }

  Future<Either<ChatFailure, ChatMessage>> _handlePortfolioQuery() async {
    // This would integrate with wallet repository in a real app
    return right(_createMessage(
      '💼 **Your Portfolio**\n\n'
      '**Total Value**: \$12,450.32\n\n'
      '• 0.5 ETH (\$1,850.00)\n'
      '• 0.02 BTC (\$2,100.00)\n'
      '• 500 USDC (\$500.00)\n'
      '• 100 SOL (\$8,000.32)\n\n'
      '_24h Change: +2.4%_',
      action: const ChatAction.navigate(route: '/home', label: 'View Full Portfolio'),
    ));
  }

  Future<Either<ChatFailure, ChatMessage>> _handleAlertCommand(String input) async {
    // Parse alert: "alert btc 100000" or "alert me when eth hits 5000"
    final regex = RegExp(r'(\w+)\s*(?:hits?|reaches?|at|=)?\s*\$?(\d+(?:\.\d+)?)', caseSensitive: false);
    final match = regex.firstMatch(input);

    if (match == null) {
      return right(_createMessage(
        '🔔 **Set a Price Alert**\n\n'
        'Try: "Alert me when BTC hits 100000"\n'
        'Or: "Notify when ETH reaches 5000"',
      ));
    }

    final token = match.group(1)!.toLowerCase();
    final price = double.tryParse(match.group(2)!) ?? 0;

    if (_tokenAliases.containsKey(token) && price > 0) {
      return right(_createMessage(
        '🔔 **Alert Set!**\n\n'
        'I\'ll notify you when **${token.toUpperCase()}** reaches **\$${price.toStringAsFixed(0)}**',
        action: ChatAction.priceAlert(
          token: token,
          targetPrice: price,
          isAbove: true,
        ),
      ));
    }

    return right(_createMessage(
      '❌ Could not set alert. Please specify a valid token and price.',
    ));
  }

  Future<Either<ChatFailure, ChatMessage>> _handleHelpQuery() async {
    return right(_createMessage(
      '🤖 **Aether Assistant Commands**\n\n'
      '💰 **Prices**\n'
      '"Price of ETH", "How much is BTC?"\n\n'
      '⛽ **Gas Fees**\n'
      '"Gas prices", "Transaction fees"\n\n'
      '📤 **Send Crypto**\n'
      '"Send 0.5 ETH to 0x1234..."\n\n'
      '🔄 **Swap Tokens**\n'
      '"Swap 1 ETH for USDC"\n\n'
      '📊 **Portfolio**\n'
      '"My portfolio", "My balance"\n\n'
      '🔔 **Price Alerts**\n'
      '"Alert when BTC hits 100000"',
    ));
  }

  Future<Either<ChatFailure, ChatMessage>> _handleGreeting() async {
    final hour = DateTime.now().hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Good morning';
    } else if (hour < 17) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }

    return right(_createMessage(
      '$greeting! 👋\n\n'
      'I\'m your Aether assistant. I can help you:\n\n'
      '• Check crypto prices\n'
      '• Send transactions\n'
      '• Swap tokens\n'
      '• Set price alerts\n\n'
      'What would you like to do?',
    ));
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // HELPER METHODS
  // ═══════════════════════════════════════════════════════════════════════════

  String? _extractToken(String input) {
    for (final alias in _tokenAliases.keys) {
      if (input.contains(alias)) {
        return alias;
      }
    }
    return null;
  }

  String _shortenAddress(String address) {
    if (address.length < 12) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }

  ChatMessage _createMessage(String content, {ChatAction? action}) {
    return ChatMessage(
      id: _uuid.v4(),
      content: content,
      isUser: false,
      timestamp: DateTime.now(),
      action: action,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // INTERFACE IMPLEMENTATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<Either<ChatFailure, GasPrice>> getGasPrices() async {
    // Simulated gas prices - would use etherscan API in production
    await Future.delayed(const Duration(milliseconds: 300));
    return right(const GasPrice(
      slow: 25,
      standard: 35,
      fast: 50,
      unit: 'gwei',
    ));
  }

  @override
  Future<Either<ChatFailure, double>> getTokenPrice(String tokenId) async {
    try {
      final result = await _marketRepository.getTopTokens(limit: 50);
      return result.fold(
        (failure) => left(ChatApiError(message: failure.toString())),
        (tokens) {
          final token = tokens.firstWhere(
            (t) => t.id.toLowerCase() == tokenId.toLowerCase(),
            orElse: () => throw Exception('Token not found'),
          );
          return right(token.currentPrice);
        },
      );
    } catch (e) {
      return left(ChatApiError(message: e.toString()));
    }
  }

  @override
  Either<ChatFailure, bool> validateAddress(String address) {
    // Basic Ethereum address validation
    final ethRegex = RegExp(r'^0x[a-fA-F0-9]{40}$');
    // Basic Bitcoin address validation (simplified)
    final btcRegex = RegExp(r'^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$|^bc1[a-z0-9]{39,59}$');

    if (ethRegex.hasMatch(address) || btcRegex.hasMatch(address)) {
      return right(true);
    }
    return left(ChatInvalidAddress(address: address));
  }

  @override
  Either<ChatFailure, ParsedSendCommand> parseSendCommand(String input) {
    // Pattern: "send 0.5 ETH to 0x1234..."
    final regex = RegExp(
      r'(?:send|transfer|pay)\s+(\d+(?:\.\d+)?)\s*(\w+)\s+(?:to\s+)?(0x[a-fA-F0-9]{40})',
      caseSensitive: false,
    );
    final match = regex.firstMatch(input);

    if (match == null) {
      return left(const ChatParseError(message: 'Invalid send format'));
    }

    return right(ParsedSendCommand(
      amount: double.parse(match.group(1)!),
      token: match.group(2)!.toLowerCase(),
      address: match.group(3)!,
    ));
  }

  @override
  Either<ChatFailure, ParsedSwapCommand> parseSwapCommand(String input) {
    // Pattern: "swap 1 ETH for USDC" or "exchange 0.5 BTC to ETH"
    final regex = RegExp(
      r'(?:swap|exchange|convert)\s+(\d+(?:\.\d+)?)\s*(\w+)\s+(?:for|to|into)\s+(\w+)',
      caseSensitive: false,
    );
    final match = regex.firstMatch(input);

    if (match == null) {
      return left(const ChatParseError(message: 'Invalid swap format'));
    }

    return right(ParsedSwapCommand(
      amount: double.parse(match.group(1)!),
      fromToken: match.group(2)!.toLowerCase(),
      toToken: match.group(3)!.toLowerCase(),
    ));
  }

  @override
  List<ChatSuggestion> getQuickSuggestions() {
    return const [
      ChatSuggestion(label: 'Portfolio', emoji: '📊', query: 'Show my portfolio'),
      ChatSuggestion(label: 'Gas', emoji: '⛽', query: 'Gas prices'),
      ChatSuggestion(label: 'BTC Price', emoji: '₿', query: 'Price of BTC'),
      ChatSuggestion(label: 'ETH Price', emoji: 'Ξ', query: 'Price of ETH'),
      ChatSuggestion(label: 'Swap', emoji: '🔄', query: 'Swap tokens'),
      ChatSuggestion(label: 'Alerts', emoji: '🔔', query: 'My alerts'),
    ];
  }
}


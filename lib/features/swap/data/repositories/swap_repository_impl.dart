// ============================================================================
// FILE: swap_repository_impl.dart
// PURPOSE: Mock implementation of ISwapRepository
// ============================================================================

import 'dart:math';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/swap_entity.dart';
import '../../domain/entities/swap_failure.dart';
import '../../domain/repositories/i_swap_repository.dart';

@LazySingleton(as: ISwapRepository)
class SwapRepositoryImpl implements ISwapRepository {
  SwapRepositoryImpl();

  final _uuid = const Uuid();
  final _random = Random();

  // Mock token data with realistic prices
  final List<SwapToken> _mockTokens = [
    const SwapToken(
      id: 'ethereum',
      symbol: 'ETH',
      name: 'Ethereum',
      image: 'https://assets.coingecko.com/coins/images/279/small/ethereum.png',
      balance: 2.5,
      priceUsd: 3245.50,
    ),
    const SwapToken(
      id: 'bitcoin',
      symbol: 'BTC',
      name: 'Bitcoin',
      image: 'https://assets.coingecko.com/coins/images/1/small/bitcoin.png',
      balance: 0.15,
      priceUsd: 97500.00,
    ),
    const SwapToken(
      id: 'solana',
      symbol: 'SOL',
      name: 'Solana',
      image: 'https://assets.coingecko.com/coins/images/4128/small/solana.png',
      balance: 45.0,
      priceUsd: 185.75,
    ),
    const SwapToken(
      id: 'usd-coin',
      symbol: 'USDC',
      name: 'USD Coin',
      image: 'https://assets.coingecko.com/coins/images/6319/small/usdc.png',
      balance: 5000.0,
      priceUsd: 1.0,
    ),
    const SwapToken(
      id: 'tether',
      symbol: 'USDT',
      name: 'Tether',
      image: 'https://assets.coingecko.com/coins/images/325/small/Tether.png',
      balance: 2500.0,
      priceUsd: 1.0,
    ),
    const SwapToken(
      id: 'cardano',
      symbol: 'ADA',
      name: 'Cardano',
      image: 'https://assets.coingecko.com/coins/images/975/small/cardano.png',
      balance: 1500.0,
      priceUsd: 0.95,
    ),
    const SwapToken(
      id: 'polygon',
      symbol: 'MATIC',
      name: 'Polygon',
      image: 'https://assets.coingecko.com/coins/images/4713/small/polygon.png',
      balance: 800.0,
      priceUsd: 0.52,
    ),
    const SwapToken(
      id: 'avalanche',
      symbol: 'AVAX',
      name: 'Avalanche',
      image: 'https://assets.coingecko.com/coins/images/12559/small/Avalanche_Circle_RedWhite_Trans.png',
      balance: 25.0,
      priceUsd: 42.80,
    ),
  ];

  // Mock swap history
  final List<SwapEntity> _swapHistory = [];

  @override
  Future<Either<SwapFailure, List<SwapToken>>> getAvailableTokens() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return right(_mockTokens);
  }

  @override
  Future<Either<SwapFailure, SwapQuote>> getSwapQuote({
    required SwapToken fromToken,
    required SwapToken toToken,
    required double amount,
    double slippageTolerance = 0.5,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Validate amount
    if (amount <= 0) {
      return left(const SwapFailure.invalidAmount());
    }

    // Check balance
    if (amount > fromToken.balance) {
      return left(const SwapFailure.insufficientBalance());
    }

    // Calculate exchange rate
    final exchangeRate = fromToken.priceUsd / toToken.priceUsd;

    // Calculate output amount (with small fee)
    final feePercent = 0.003; // 0.3% fee
    final grossOutput = amount * exchangeRate;
    final fee = grossOutput * feePercent;
    final toAmount = grossOutput - fee;

    // Calculate price impact (mock - larger swaps have more impact)
    final priceImpact = (amount / fromToken.balance) * 0.5;

    // Calculate minimum received with slippage
    final minimumReceived = toAmount * (1 - slippageTolerance / 100);

    final quote = SwapQuote(
      fromToken: fromToken,
      toToken: toToken,
      fromAmount: amount,
      toAmount: toAmount,
      exchangeRate: exchangeRate,
      fee: fee * toToken.priceUsd,
      priceImpact: priceImpact,
      minimumReceived: minimumReceived,
      expiresAt: DateTime.now().add(const Duration(minutes: 5)),
    );

    return right(quote);
  }

  @override
  Future<Either<SwapFailure, SwapEntity>> executeSwap({
    required SwapQuote quote,
  }) async {
    // Simulate network delay for transaction
    await Future.delayed(const Duration(seconds: 2));

    // Check if quote expired
    if (quote.isExpired) {
      return left(const SwapFailure.quoteExpired());
    }

    // Simulate occasional failure (5% chance)
    if (_random.nextDouble() < 0.05) {
      return left(const SwapFailure.swapFailed(
        message: 'Transaction reverted. Please try again.',
      ));
    }

    // Create successful swap
    final swap = SwapEntity(
      id: _uuid.v4(),
      fromToken: quote.fromToken,
      toToken: quote.toToken,
      fromAmount: quote.fromAmount,
      toAmount: quote.toAmount,
      exchangeRate: quote.exchangeRate,
      fee: quote.fee,
      status: SwapStatus.completed,
      createdAt: DateTime.now(),
      completedAt: DateTime.now(),
      txHash: '0x${_generateMockTxHash()}',
    );

    // Add to history
    _swapHistory.insert(0, swap);

    return right(swap);
  }

  @override
  Future<Either<SwapFailure, List<SwapEntity>>> getSwapHistory() async {
    await Future.delayed(const Duration(milliseconds: 300));

    // Return existing history plus some mock historical swaps
    if (_swapHistory.isEmpty) {
      // Generate some mock history
      final mockHistory = _generateMockHistory();
      _swapHistory.addAll(mockHistory);
    }

    return right(_swapHistory);
  }

  @override
  Future<Either<SwapFailure, double>> getExchangeRate({
    required String fromTokenId,
    required String toTokenId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final fromToken = _mockTokens.firstWhere(
      (t) => t.id == fromTokenId,
      orElse: () => _mockTokens.first,
    );
    final toToken = _mockTokens.firstWhere(
      (t) => t.id == toTokenId,
      orElse: () => _mockTokens[1],
    );

    return right(fromToken.priceUsd / toToken.priceUsd);
  }

  String _generateMockTxHash() {
    const chars = '0123456789abcdef';
    return List.generate(64, (_) => chars[_random.nextInt(16)]).join();
  }

  List<SwapEntity> _generateMockHistory() {
    return [
      SwapEntity(
        id: _uuid.v4(),
        fromToken: _mockTokens[0], // ETH
        toToken: _mockTokens[3], // USDC
        fromAmount: 0.5,
        toAmount: 1622.75,
        exchangeRate: 3245.50,
        fee: 4.87,
        status: SwapStatus.completed,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        completedAt: DateTime.now().subtract(const Duration(hours: 2)),
        txHash: '0x${_generateMockTxHash()}',
      ),
      SwapEntity(
        id: _uuid.v4(),
        fromToken: _mockTokens[3], // USDC
        toToken: _mockTokens[2], // SOL
        fromAmount: 500.0,
        toAmount: 2.69,
        exchangeRate: 0.00538,
        fee: 1.50,
        status: SwapStatus.completed,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        completedAt: DateTime.now().subtract(const Duration(days: 1)),
        txHash: '0x${_generateMockTxHash()}',
      ),
    ];
  }
}



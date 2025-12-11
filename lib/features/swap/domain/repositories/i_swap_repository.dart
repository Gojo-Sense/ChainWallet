// ============================================================================
// FILE: i_swap_repository.dart
// PURPOSE: Repository interface for swap operations
// ============================================================================

import 'package:fpdart/fpdart.dart';
import '../entities/swap_entity.dart';
import '../entities/swap_failure.dart';

abstract class ISwapRepository {
  /// Get list of available tokens for swapping
  Future<Either<SwapFailure, List<SwapToken>>> getAvailableTokens();

  /// Get a quote for swapping tokens
  Future<Either<SwapFailure, SwapQuote>> getSwapQuote({
    required SwapToken fromToken,
    required SwapToken toToken,
    required double amount,
    double slippageTolerance = 0.5,
  });

  /// Execute a swap transaction
  Future<Either<SwapFailure, SwapEntity>> executeSwap({
    required SwapQuote quote,
  });

  /// Get swap history
  Future<Either<SwapFailure, List<SwapEntity>>> getSwapHistory();

  /// Get exchange rate between two tokens
  Future<Either<SwapFailure, double>> getExchangeRate({
    required String fromTokenId,
    required String toTokenId,
  });
}



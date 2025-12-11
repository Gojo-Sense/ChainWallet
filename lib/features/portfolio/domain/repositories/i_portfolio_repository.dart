// ============================================================================
// FILE: i_portfolio_repository.dart
// PURPOSE: Repository interface for portfolio data
// ============================================================================

import 'package:fpdart/fpdart.dart';
import '../entities/portfolio_entity.dart';

/// Failure types for portfolio operations
sealed class PortfolioFailure {
  const PortfolioFailure();
  String get message;
}

class PortfolioFetchError extends PortfolioFailure {
  final String details;
  const PortfolioFetchError(this.details);
  @override
  String get message => 'Failed to fetch portfolio: $details';
}

class PortfolioNoData extends PortfolioFailure {
  const PortfolioNoData();
  @override
  String get message => 'No portfolio data available';
}

/// Repository interface for portfolio operations
abstract class IPortfolioRepository {
  /// Get current portfolio with all assets
  Future<Either<PortfolioFailure, Portfolio>> getPortfolio();

  /// Get portfolio history for a time range
  Future<Either<PortfolioFailure, List<PortfolioSnapshot>>> getHistory(
    PortfolioTimeRange range,
  );
}



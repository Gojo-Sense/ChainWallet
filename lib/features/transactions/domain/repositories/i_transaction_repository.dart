// ============================================================================
// FILE: i_transaction_repository.dart
// PURPOSE: Transaction repository interface
// ============================================================================

import 'package:fpdart/fpdart.dart';
import '../entities/transaction_entity.dart';
import '../failures/transaction_failure.dart';

abstract class ITransactionRepository {
  Future<Either<TransactionFailure, List<Transaction>>> getTransactions({
    TransactionFilter? filter,
    int page = 1,
    int limit = 20,
  });
}




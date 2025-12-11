// ============================================================================
// FILE: transaction_failure.dart
// PURPOSE: Domain failures for transactions
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_failure.freezed.dart';

@freezed
sealed class TransactionFailure with _$TransactionFailure {
  const factory TransactionFailure.fetchError({
    @Default('Failed to fetch transactions') String message,
  }) = TransactionFetchError;

  const factory TransactionFailure.storageError({
    @Default('Failed to save transaction') String message,
  }) = TransactionStorageError;

  const factory TransactionFailure.notFound({
    @Default('Transaction not found') String message,
  }) = TransactionNotFound;
}




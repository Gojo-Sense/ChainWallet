// ============================================================================
// FILE: transaction_entity.dart
// PURPOSE: Domain entities for transaction history
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_entity.freezed.dart';

/// Transaction type enum
enum TransactionType {
  send,
  receive,
  swap,
  approve,
  mint,
  burn,
}

extension TransactionTypeX on TransactionType {
  String get label => switch (this) {
    TransactionType.send => 'Sent',
    TransactionType.receive => 'Received',
    TransactionType.swap => 'Swapped',
    TransactionType.approve => 'Approved',
    TransactionType.mint => 'Minted',
    TransactionType.burn => 'Burned',
  };

  String get emoji => switch (this) {
    TransactionType.send => '📤',
    TransactionType.receive => '📥',
    TransactionType.swap => '🔄',
    TransactionType.approve => '✅',
    TransactionType.mint => '🌟',
    TransactionType.burn => '🔥',
  };
}

/// Transaction status enum
enum TransactionStatus {
  pending,
  confirmed,
  failed,
}

extension TransactionStatusX on TransactionStatus {
  String get label => switch (this) {
    TransactionStatus.pending => 'Pending',
    TransactionStatus.confirmed => 'Confirmed',
    TransactionStatus.failed => 'Failed',
  };
}

/// Transaction entity
@freezed
sealed class Transaction with _$Transaction {
  const Transaction._();

  const factory Transaction({
    required String id,
    required String hash,
    required TransactionType type,
    required TransactionStatus status,
    required DateTime timestamp,
    required String fromAddress,
    required String toAddress,
    required double amount,
    required String token,
    required double gasFee,
    String? toToken,
    double? toAmount,
    String? note,
  }) = _Transaction;

  /// Get shortened hash for display
  String get shortHash {
    if (hash.length < 12) return hash;
    return '${hash.substring(0, 6)}...${hash.substring(hash.length - 4)}';
  }

  /// Get shortened addresses
  String get shortFrom {
    if (fromAddress.length < 12) return fromAddress;
    return '${fromAddress.substring(0, 6)}...${fromAddress.substring(fromAddress.length - 4)}';
  }

  String get shortTo {
    if (toAddress.length < 12) return toAddress;
    return '${toAddress.substring(0, 6)}...${toAddress.substring(toAddress.length - 4)}';
  }

  /// Format amount for display
  String get formattedAmount {
    if (amount >= 1) {
      return '${amount.toStringAsFixed(4)} $token';
    }
    return '${amount.toStringAsFixed(8)} $token';
  }

  /// Check if transaction is incoming
  bool isIncoming(String myAddress) => toAddress.toLowerCase() == myAddress.toLowerCase();
}

/// Filter options for transactions
@freezed
sealed class TransactionFilter with _$TransactionFilter {
  const TransactionFilter._();

  const factory TransactionFilter({
    @Default(null) TransactionType? type,
    @Default(null) TransactionStatus? status,
    @Default(null) String? token,
    @Default(null) DateTime? startDate,
    @Default(null) DateTime? endDate,
  }) = _TransactionFilter;

  factory TransactionFilter.all() => const TransactionFilter();
}



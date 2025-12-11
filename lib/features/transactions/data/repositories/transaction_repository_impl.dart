// ============================================================================
// FILE: transaction_repository_impl.dart
// PURPOSE: Transaction repository with Hive persistence
// ============================================================================

import 'dart:math';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../domain/failures/transaction_failure.dart';
import '../../domain/repositories/i_transaction_repository.dart';

@LazySingleton(as: ITransactionRepository)
class TransactionRepositoryImpl implements ITransactionRepository {
  final Random _random = Random();
  static const String _boxName = 'transactions';
  
  Box? _box;
  
  Future<Box> get _transactionsBox async {
    _box ??= await Hive.openBox(_boxName);
    return _box!;
  }

  @override
  Future<Either<TransactionFailure, List<Transaction>>> getTransactions({
    TransactionFilter? filter,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final box = await _transactionsBox;
      
      // If box is empty, generate and save mock transactions
      if (box.isEmpty) {
        final mockTransactions = _generateMockTransactions();
        for (final tx in mockTransactions) {
          await box.put(tx.id, tx);
        }
      }
      
      // Get all transactions from Hive
      final transactionMaps = box.values.toList();
      var transactions = transactionMaps
          .map((map) => _transactionFromMap(map as Map))
          .whereType<Transaction>()
          .toList();

    // Apply filters
    if (filter != null) {
      if (filter.type != null) {
        transactions = transactions.where((t) => t.type == filter.type).toList();
      }
      if (filter.status != null) {
        transactions = transactions.where((t) => t.status == filter.status).toList();
      }
      if (filter.token != null) {
        transactions = transactions.where((t) => t.token == filter.token).toList();
      }
      if (filter.startDate != null) {
        transactions = transactions.where((t) => t.timestamp.isAfter(filter.startDate!)).toList();
      }
      if (filter.endDate != null) {
        transactions = transactions.where((t) => t.timestamp.isBefore(filter.endDate!)).toList();
      }
    }

    // Paginate
    final start = (page - 1) * limit;
    final end = start + limit;
    if (start >= transactions.length) {
      return right([]);
    }

    return right(transactions.sublist(start, end.clamp(0, transactions.length)));
    } catch (e) {
      return left(TransactionFailure.fetchError(message: 'Failed to load transactions: $e'));
    }
  }
  
  /// Save a transaction to Hive
  Future<void> saveTransaction(Transaction transaction) async {
    try {
      final box = await _transactionsBox;
      await box.put(transaction.id, _transactionToMap(transaction));
    } catch (e) {
      // Handle error silently or log it
    }
  }
  
  /// Save multiple transactions
  Future<void> saveTransactions(List<Transaction> transactions) async {
    try {
      final box = await _transactionsBox;
      for (final tx in transactions) {
        await box.put(tx.id, _transactionToMap(tx));
      }
    } catch (e) {
      // Handle error silently or log it
    }
  }
  
  /// Convert Transaction to Map for Hive storage
  Map<String, dynamic> _transactionToMap(Transaction tx) {
    return {
      'id': tx.id,
      'hash': tx.hash,
      'type': tx.type.index,
      'status': tx.status.index,
      'timestamp': tx.timestamp.toIso8601String(),
      'fromAddress': tx.fromAddress,
      'toAddress': tx.toAddress,
      'amount': tx.amount,
      'token': tx.token,
      'gasFee': tx.gasFee,
      'toToken': tx.toToken,
      'toAmount': tx.toAmount,
      'note': tx.note,
    };
  }
  
  /// Convert Map to Transaction from Hive storage
  Transaction? _transactionFromMap(Map<dynamic, dynamic> map) {
    try {
      return Transaction(
        id: map['id'] as String,
        hash: map['hash'] as String,
        type: TransactionType.values[map['type'] as int],
        status: TransactionStatus.values[map['status'] as int],
        timestamp: DateTime.parse(map['timestamp'] as String),
        fromAddress: map['fromAddress'] as String,
        toAddress: map['toAddress'] as String,
        amount: (map['amount'] as num).toDouble(),
        token: map['token'] as String,
        gasFee: (map['gasFee'] as num).toDouble(),
        toToken: map['toToken'] as String?,
        toAmount: map['toAmount'] != null ? (map['toAmount'] as num).toDouble() : null,
        note: map['note'] as String?,
      );
    } catch (e) {
      return null;
    }
  }
  
  /// Clear all transactions
  Future<void> clearTransactions() async {
    try {
      final box = await _transactionsBox;
      await box.clear();
    } catch (e) {
      // Handle error silently
    }
  }

  List<Transaction> _generateMockTransactions() {
    final transactions = <Transaction>[];
    final tokens = ['ETH', 'BTC', 'SOL', 'USDC', 'DOGE'];
    final types = TransactionType.values;
    final now = DateTime.now();

    for (int i = 0; i < 50; i++) {
      final type = types[_random.nextInt(types.length)];
      final token = tokens[_random.nextInt(tokens.length)];
      final daysAgo = _random.nextInt(60);
      final hoursAgo = _random.nextInt(24);

      transactions.add(Transaction(
        id: 'tx_$i',
        hash: '0x${_generateHexString(64)}',
        type: type,
        status: _random.nextDouble() > 0.1
            ? TransactionStatus.confirmed
            : (_random.nextBool() ? TransactionStatus.pending : TransactionStatus.failed),
        timestamp: now.subtract(Duration(days: daysAgo, hours: hoursAgo)),
        fromAddress: '0x${_generateHexString(40)}',
        toAddress: '0x${_generateHexString(40)}',
        amount: _random.nextDouble() * 10,
        token: token,
        gasFee: _random.nextDouble() * 0.01,
        toToken: type == TransactionType.swap ? tokens[_random.nextInt(tokens.length)] : null,
        toAmount: type == TransactionType.swap ? _random.nextDouble() * 100 : null,
      ));
    }

    // Sort by timestamp (newest first)
    transactions.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return transactions;
  }

  String _generateHexString(int length) {
    const chars = '0123456789abcdef';
    return List.generate(length, (_) => chars[_random.nextInt(chars.length)]).join();
  }
}



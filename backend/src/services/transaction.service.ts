import { Transaction, Wallet } from '../models';
import { Op } from 'sequelize';

export class TransactionService {
  static async getUserTransactions(
    userId: string,
    limit: number = 50,
    offset: number = 0,
    walletId?: string
  ): Promise<{ transactions: Transaction[]; total: number }> {
    const where: any = { userId };
    if (walletId) {
      where.walletId = walletId;
    }

    const { count, rows } = await Transaction.findAndCountAll({
      where,
      include: [{ model: Wallet, attributes: ['id', 'address', 'nickname', 'network'] }],
      order: [['timestamp', 'DESC']],
      limit,
      offset,
    });

    return { transactions: rows, total: count };
  }

  static async syncTransaction(
    userId: string,
    walletId: string,
    txHash: string,
    fromAddress: string,
    toAddress: string,
    amount: string,
    tokenSymbol: string,
    status: 'pending' | 'success' | 'failed',
    timestamp: Date,
    network: string
  ): Promise<Transaction> {
    // Check if transaction already exists
    const existing = await Transaction.findOne({ where: { txHash } });
    if (existing) {
      return existing;
    }

    return await Transaction.create({
      userId,
      walletId,
      txHash,
      fromAddress,
      toAddress,
      amount,
      tokenSymbol,
      status,
      timestamp,
      network,
    });
  }

  static async getTransactionStats(userId: string): Promise<{
    total: number;
    success: number;
    failed: number;
    pending: number;
    totalVolume: number;
  }> {
    const transactions = await Transaction.findAll({
      where: { userId },
      attributes: ['status', 'amount', 'tokenSymbol'],
    });

    const stats = {
      total: transactions.length,
      success: 0,
      failed: 0,
      pending: 0,
      totalVolume: 0,
    };

    transactions.forEach((tx) => {
      if (tx.status === 'success') stats.success++;
      else if (tx.status === 'failed') stats.failed++;
      else stats.pending++;

      if (tx.status === 'success') {
        stats.totalVolume += parseFloat(tx.amount);
      }
    });

    return stats;
  }
}



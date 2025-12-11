import { Request, Response } from 'express';
import { TransactionService } from '../services/transaction.service';
import { ApiResponse } from '../types';

export class TransactionController {
  static async getTransactions(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const limit = parseInt(req.query.limit as string) || 50;
      const offset = parseInt(req.query.offset as string) || 0;
      const walletId = req.query.walletId as string | undefined;

      const { transactions, total } = await TransactionService.getUserTransactions(
        userId,
        limit,
        offset,
        walletId
      );

      const response: ApiResponse = {
        success: true,
        data: {
          transactions,
          pagination: {
            total,
            limit,
            offset,
            hasMore: offset + limit < total,
          },
        },
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to fetch transactions',
      };
      res.status(500).json(response);
    }
  }

  static async syncTransaction(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const { walletId, txHash, fromAddress, toAddress, amount, tokenSymbol, status, timestamp, network } = req.body;

      const transaction = await TransactionService.syncTransaction(
        userId,
        walletId,
        txHash,
        fromAddress,
        toAddress,
        amount,
        tokenSymbol,
        status || 'pending',
        new Date(timestamp),
        network || 'ethereum'
      );

      const response: ApiResponse = {
        success: true,
        data: transaction,
      };

      res.status(201).json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to sync transaction',
      };
      res.status(400).json(response);
    }
  }

  static async getStats(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const stats = await TransactionService.getTransactionStats(userId);

      const response: ApiResponse = {
        success: true,
        data: stats,
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to fetch transaction stats',
      };
      res.status(500).json(response);
    }
  }
}



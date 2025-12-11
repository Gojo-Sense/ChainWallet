import { Request, Response } from 'express';
import { WalletService } from '../services/wallet.service';
import { AuditLogService } from '../services/audit-log.service';
import { ApiResponse } from '../types';

export class WalletController {
  static async getWallets(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const wallets = await WalletService.getUserWallets(userId);

      const response: ApiResponse = {
        success: true,
        data: wallets,
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to fetch wallets',
      };
      res.status(500).json(response);
    }
  }

  static async addWallet(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const { address, network, nickname } = req.body;
      const deviceInfo = req.headers['user-agent'] || 'unknown';
      const ipAddress = req.ip || req.socket.remoteAddress || 'unknown';

      const wallet = await WalletService.addWallet(userId, address, network || 'ethereum', nickname);

      // Log wallet addition
      await AuditLogService.log({
        userId,
        action: 'wallet_added',
        ipAddress,
        deviceInfo,
        metadata: { walletId: wallet.id, address, network },
      });

      const response: ApiResponse = {
        success: true,
        data: wallet,
      };

      res.status(201).json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to add wallet',
      };
      res.status(400).json(response);
    }
  }

  static async deleteWallet(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const { id } = req.params;
      const deviceInfo = req.headers['user-agent'] || 'unknown';
      const ipAddress = req.ip || req.socket.remoteAddress || 'unknown';

      await WalletService.deleteWallet(userId, id);

      // Log wallet deletion
      await AuditLogService.log({
        userId,
        action: 'wallet_deleted',
        ipAddress,
        deviceInfo,
        metadata: { walletId: id },
      });

      const response: ApiResponse = {
        success: true,
        message: 'Wallet deleted successfully',
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to delete wallet',
      };
      res.status(400).json(response);
    }
  }
}



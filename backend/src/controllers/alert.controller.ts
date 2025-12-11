import { Request, Response } from 'express';
import { AlertService } from '../services/alert.service';
import { ApiResponse } from '../types';

export class AlertController {
  static async getAlerts(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const alerts = await AlertService.getUserAlerts(userId);

      const response: ApiResponse = {
        success: true,
        data: alerts,
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to fetch alerts',
      };
      res.status(500).json(response);
    }
  }

  static async createAlert(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const { tokenSymbol, targetPrice, condition } = req.body;

      const alert = await AlertService.createAlert(userId, tokenSymbol, targetPrice, condition);

      const response: ApiResponse = {
        success: true,
        data: alert,
      };

      res.status(201).json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to create alert',
      };
      res.status(400).json(response);
    }
  }

  static async updateAlert(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const { id } = req.params;
      const { targetPrice, condition, isActive } = req.body;

      const updates: any = {};
      if (targetPrice !== undefined) updates.targetPrice = targetPrice;
      if (condition !== undefined) updates.condition = condition;
      if (isActive !== undefined) updates.isActive = isActive;

      const alert = await AlertService.updateAlert(userId, id, updates);

      const response: ApiResponse = {
        success: true,
        data: alert,
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to update alert',
      };
      res.status(400).json(response);
    }
  }

  static async deleteAlert(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const { id } = req.params;

      await AlertService.deleteAlert(userId, id);

      const response: ApiResponse = {
        success: true,
        message: 'Alert deleted successfully',
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to delete alert',
      };
      res.status(400).json(response);
    }
  }
}



import { Request, Response } from 'express';
import { PortfolioService } from '../services/portfolio.service';
import { ApiResponse } from '../types';

export class PortfolioController {
  static async getPortfolio(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const portfolio = await PortfolioService.getCurrentPortfolio(userId);

      const response: ApiResponse = {
        success: true,
        data: portfolio,
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to fetch portfolio',
      };
      res.status(500).json(response);
    }
  }

  static async getHistory(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const days = parseInt(req.query.days as string) || 30;

      const history = await PortfolioService.getPortfolioHistory(userId, days);

      const response: ApiResponse = {
        success: true,
        data: history,
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to fetch portfolio history',
      };
      res.status(500).json(response);
    }
  }

  static async getAnalytics(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const analytics = await PortfolioService.getAnalytics(userId);

      const response: ApiResponse = {
        success: true,
        data: analytics,
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to fetch analytics',
      };
      res.status(500).json(response);
    }
  }
}



import { Request, Response } from 'express';
import { NotificationService } from '../services/notification.service';
import { ApiResponse } from '../types';

export class NotificationController {
  static async getNotifications(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const limit = parseInt(req.query.limit as string) || 50;
      const offset = parseInt(req.query.offset as string) || 0;

      const { notifications, total } = await NotificationService.getUserNotifications(
        userId,
        limit,
        offset
      );

      const response: ApiResponse = {
        success: true,
        data: {
          notifications,
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
        error: error.message || 'Failed to fetch notifications',
      };
      res.status(500).json(response);
    }
  }

  static async markAsRead(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const { id } = req.params;

      const notification = await NotificationService.markAsRead(userId, id);

      const response: ApiResponse = {
        success: true,
        data: notification,
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to mark notification as read',
      };
      res.status(400).json(response);
    }
  }

  static async markAllAsRead(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      await NotificationService.markAllAsRead(userId);

      const response: ApiResponse = {
        success: true,
        message: 'All notifications marked as read',
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to mark all notifications as read',
      };
      res.status(500).json(response);
    }
  }

  static async deleteNotification(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user!.userId;
      const { id } = req.params;

      await NotificationService.deleteNotification(userId, id);

      const response: ApiResponse = {
        success: true,
        message: 'Notification deleted successfully',
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Failed to delete notification',
      };
      res.status(400).json(response);
    }
  }
}



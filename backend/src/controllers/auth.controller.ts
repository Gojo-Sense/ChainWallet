import { Request, Response } from 'express';
import { AuthService } from '../services/auth.service';
import { AuditLogService } from '../services/audit-log.service';
import { ApiResponse } from '../types';

export class AuthController {
  static async register(req: Request, res: Response): Promise<void> {
    try {
      const { email, password } = req.body;
      const deviceInfo = req.headers['user-agent'] || 'unknown';
      const ipAddress = req.ip || req.socket.remoteAddress || 'unknown';

      const { user, accessToken, refreshToken } = await AuthService.register(
        email,
        password,
        deviceInfo,
        ipAddress
      );

      // Log registration
      await AuditLogService.log({
        userId: user.id,
        action: 'user_registered',
        ipAddress,
        deviceInfo,
        metadata: { email },
      });

      const response: ApiResponse = {
        success: true,
        data: {
          user: {
            id: user.id,
            email: user.email,
            emailVerified: user.emailVerified,
          },
          accessToken,
          refreshToken,
        },
      };

      res.status(201).json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Registration failed',
      };
      res.status(400).json(response);
    }
  }

  static async login(req: Request, res: Response): Promise<void> {
    try {
      const { email, password } = req.body;
      const deviceInfo = req.headers['user-agent'] || 'unknown';
      const ipAddress = req.ip || req.socket.remoteAddress || 'unknown';

      const { user, accessToken, refreshToken } = await AuthService.login(
        email,
        password,
        deviceInfo,
        ipAddress
      );

      // Log login
      await AuditLogService.log({
        userId: user.id,
        action: 'user_login',
        ipAddress,
        deviceInfo,
        metadata: { email },
      });

      const response: ApiResponse = {
        success: true,
        data: {
          user: {
            id: user.id,
            email: user.email,
            emailVerified: user.emailVerified,
          },
          accessToken,
          refreshToken,
        },
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Login failed',
      };
      res.status(401).json(response);
    }
  }

  static async refresh(req: Request, res: Response): Promise<void> {
    try {
      const { refreshToken } = req.body;

      const { accessToken, refreshToken: newRefreshToken } = await AuthService.refreshToken(refreshToken);

      const response: ApiResponse = {
        success: true,
        data: {
          accessToken,
          refreshToken: newRefreshToken,
        },
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Token refresh failed',
      };
      res.status(401).json(response);
    }
  }

  static async logout(req: Request, res: Response): Promise<void> {
    try {
      const { refreshToken } = req.body;
      const userId = req.user?.userId;

      await AuthService.logout(refreshToken);

      // Log logout
      if (userId) {
        const deviceInfo = req.headers['user-agent'] || 'unknown';
        const ipAddress = req.ip || req.socket.remoteAddress || 'unknown';
        await AuditLogService.log({
          userId,
          action: 'user_logout',
          ipAddress,
          deviceInfo,
        });
      }

      const response: ApiResponse = {
        success: true,
        message: 'Logged out successfully',
      };

      res.json(response);
    } catch (error: any) {
      const response: ApiResponse = {
        success: false,
        error: error.message || 'Logout failed',
      };
      res.status(400).json(response);
    }
  }
}



import { AuditLog } from '../models';

interface LogData {
  userId?: string;
  action: string;
  ipAddress: string;
  deviceInfo: string;
  metadata?: Record<string, any>;
}

export class AuditLogService {
  static async log(data: LogData): Promise<void> {
    try {
      await AuditLog.create({
        userId: data.userId,
        action: data.action,
        ipAddress: data.ipAddress,
        deviceInfo: data.deviceInfo,
        metadata: data.metadata || {},
        timestamp: new Date(),
      });
    } catch (error) {
      // Don't throw error for audit logging failures
      console.error('Failed to log audit event:', error);
    }
  }
}



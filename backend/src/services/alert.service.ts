import { PriceAlert } from '../models';

export class AlertService {
  static async getUserAlerts(userId: string): Promise<PriceAlert[]> {
    return await PriceAlert.findAll({
      where: { userId },
      order: [['createdAt', 'DESC']],
    });
  }

  static async createAlert(
    userId: string,
    tokenSymbol: string,
    targetPrice: number,
    condition: 'above' | 'below'
  ): Promise<PriceAlert> {
    return await PriceAlert.create({
      userId,
      tokenSymbol,
      targetPrice,
      condition,
      isActive: true,
    });
  }

  static async updateAlert(
    userId: string,
    alertId: string,
    updates: { targetPrice?: number; condition?: 'above' | 'below'; isActive?: boolean }
  ): Promise<PriceAlert> {
    const alert = await PriceAlert.findOne({
      where: { id: alertId, userId },
    });

    if (!alert) {
      throw new Error('Alert not found');
    }

    await alert.update(updates);
    return alert;
  }

  static async deleteAlert(userId: string, alertId: string): Promise<void> {
    const alert = await PriceAlert.findOne({
      where: { id: alertId, userId },
    });

    if (!alert) {
      throw new Error('Alert not found');
    }

    await alert.destroy();
  }

  static async getActiveAlerts(): Promise<PriceAlert[]> {
    return await PriceAlert.findAll({
      where: { isActive: true },
    });
  }
}



import { Notification } from '../models';

export class NotificationService {
  static async getUserNotifications(
    userId: string,
    limit: number = 50,
    offset: number = 0
  ): Promise<{ notifications: Notification[]; total: number }> {
    const { count, rows } = await Notification.findAndCountAll({
      where: { userId },
      order: [['createdAt', 'DESC']],
      limit,
      offset,
    });

    return { notifications: rows, total: count };
  }

  static async createNotification(
    userId: string,
    type: 'price_alert' | 'transaction' | 'security' | 'system',
    title: string,
    message: string
  ): Promise<Notification> {
    return await Notification.create({
      userId,
      type,
      title,
      message,
      read: false,
    });
  }

  static async markAsRead(userId: string, notificationId: string): Promise<Notification> {
    const notification = await Notification.findOne({
      where: { id: notificationId, userId },
    });

    if (!notification) {
      throw new Error('Notification not found');
    }

    await notification.update({ read: true });
    return notification;
  }

  static async markAllAsRead(userId: string): Promise<void> {
    await Notification.update(
      { read: true },
      { where: { userId, read: false } }
    );
  }

  static async deleteNotification(userId: string, notificationId: string): Promise<void> {
    const notification = await Notification.findOne({
      where: { id: notificationId, userId },
    });

    if (!notification) {
      throw new Error('Notification not found');
    }

    await notification.destroy();
  }
}



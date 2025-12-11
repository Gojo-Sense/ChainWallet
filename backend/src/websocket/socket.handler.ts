import { Server, Socket } from 'socket.io';
import jwt from 'jsonwebtoken';
import { config } from '../config/env';
import { priceMonitorQueue } from '../jobs/price-monitor.job';
import { NotificationService } from '../services/notification.service';

interface AuthenticatedSocket extends Socket {
  userId?: string;
}

export const setupWebSocket = (io: Server): void => {
  // Authentication middleware for WebSocket
  io.use((socket: AuthenticatedSocket, next) => {
    const token = socket.handshake.auth.token || socket.handshake.headers.authorization?.replace('Bearer ', '');

    if (!token) {
      return next(new Error('Authentication error'));
    }

    try {
      const decoded = jwt.verify(token, config.jwt.secret) as { userId: string };
      socket.userId = decoded.userId;
      next();
    } catch (error) {
      next(new Error('Authentication error'));
    }
  });

  io.on('connection', (socket: AuthenticatedSocket) => {
    const userId = socket.userId;
    if (!userId) {
      socket.disconnect();
      return;
    }

    console.log(`✅ User ${userId} connected via WebSocket`);

    // Join user's room for personalized updates
    socket.join(`user:${userId}`);

    // Handle price update subscription
    socket.on('subscribe_prices', (tokens: string[]) => {
      tokens.forEach((token) => {
        socket.join(`price:${token.toLowerCase()}`);
      });
    });

    // Handle price update unsubscription
    socket.on('unsubscribe_prices', (tokens: string[]) => {
      tokens.forEach((token) => {
        socket.leave(`price:${token.toLowerCase()}`);
      });
    });

    // Listen for price monitor job completions
    priceMonitorQueue.on('completed', async (job, result) => {
      if (result.triggered && result.userId) {
        // Emit notification to specific user
        io.to(`user:${result.userId}`).emit('alert_triggered', {
          alertId: result.alertId,
          message: 'Price alert triggered',
        });

        // Also send notification update
        const notifications = await NotificationService.getUserNotifications(result.userId, 1, 0);
        if (notifications.notifications.length > 0) {
          io.to(`user:${result.userId}`).emit('notification', notifications.notifications[0]);
        }
      }
    });

    // Handle disconnect
    socket.on('disconnect', () => {
      console.log(`❌ User ${userId} disconnected from WebSocket`);
    });
  });

  console.log('✅ WebSocket server initialized');
};

// Broadcast price updates to subscribed clients
export const broadcastPriceUpdate = (io: Server, tokenSymbol: string, price: number) => {
  io.to(`price:${tokenSymbol.toLowerCase()}`).emit('price_update', {
    tokenSymbol,
    price,
    timestamp: new Date().toISOString(),
  });
};


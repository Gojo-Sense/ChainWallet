import Queue from 'bull';
import { config } from '../config/env';
import { AlertService } from '../services/alert.service';
import { NotificationService } from '../services/notification.service';
import axios from 'axios';
import { config } from '../config/env';

// Create price monitoring queue
export const priceMonitorQueue = new Queue('price-monitor', {
  redis: {
    host: config.redis.host,
    port: config.redis.port,
  },
  defaultJobOptions: {
    removeOnComplete: true,
    removeOnFail: false,
  },
});

// Process price monitoring jobs
priceMonitorQueue.process(async (job) => {
  try {
    const { tokenSymbol, currentPrice } = job.data;

    // Get all active alerts for this token
    const alerts = await AlertService.getActiveAlerts();
    const relevantAlerts = alerts.filter(
      (alert) => alert.tokenSymbol.toLowerCase() === tokenSymbol.toLowerCase() && alert.isActive
    );

    for (const alert of relevantAlerts) {
      const targetPrice = parseFloat(alert.targetPrice.toString());
      const shouldTrigger =
        (alert.condition === 'above' && currentPrice >= targetPrice) ||
        (alert.condition === 'below' && currentPrice <= targetPrice);

      if (shouldTrigger) {
        // Create notification
        await NotificationService.createNotification(
          alert.userId,
          'price_alert',
          `Price Alert: ${alert.tokenSymbol}`,
          `${alert.tokenSymbol} price is ${currentPrice.toFixed(2)} USD, which is ${alert.condition} your target of ${targetPrice.toFixed(2)} USD`
        );

        // Deactivate alert
        await AlertService.updateAlert(alert.userId, alert.id, { isActive: false });

        // Emit WebSocket event (will be handled by socket handler)
        return { triggered: true, alertId: alert.id, userId: alert.userId };
      }
    }

    return { triggered: false };
  } catch (error) {
    console.error('Price monitor job error:', error);
    throw error;
  }
});

// Add job to queue every minute
export const startPriceMonitoring = () => {
  // Monitor prices every minute
  setInterval(async () => {
    try {
      // Get all active alerts to determine which tokens to monitor
      const alerts = await AlertService.getActiveAlerts();
      const uniqueTokens = [...new Set(alerts.map((a) => a.tokenSymbol.toLowerCase()))];

      if (uniqueTokens.length === 0) return;

      // Fetch current prices from CoinGecko
      const ids = uniqueTokens.join(',');
      const response = await axios.get(
        `${config.external.coingeckoApiUrl}/simple/price?ids=${ids}&vs_currencies=usd`
      );

      // Add jobs for each token
      Object.keys(response.data).forEach((tokenSymbol) => {
        const currentPrice = response.data[tokenSymbol].usd;
        priceMonitorQueue.add(
          { tokenSymbol, currentPrice },
          { attempts: 3, backoff: { type: 'exponential', delay: 2000 } }
        );
      });
    } catch (error) {
      console.error('Failed to fetch prices for monitoring:', error);
    }
  }, 60000); // Every minute

  console.log('✅ Price monitoring started');
};


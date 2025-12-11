import { createClient } from 'redis';
import { config } from './env';

export const redisClient = createClient({
  url: config.redis.url,
});

redisClient.on('error', (err) => {
  console.error('❌ Redis Client Error:', err);
});

redisClient.on('connect', () => {
  console.log('✅ Redis Client Connected');
});

export const connectRedis = async (): Promise<void> => {
  try {
    await redisClient.connect();
    console.log('✅ Redis connection established successfully.');
  } catch (error) {
    console.error('❌ Unable to connect to Redis:', error);
    throw error;
  }
};

export const disconnectRedis = async (): Promise<void> => {
  try {
    await redisClient.disconnect();
    console.log('✅ Redis disconnected successfully.');
  } catch (error) {
    console.error('❌ Error disconnecting Redis:', error);
  }
};



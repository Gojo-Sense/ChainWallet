import { PortfolioSnapshot, Wallet, Transaction } from '../models';
import { Op } from 'sequelize';
import axios from 'axios';
import { config } from '../config/env';
import { sequelize } from '../config/database';

export class PortfolioService {
  static async getCurrentPortfolio(userId: string): Promise<{
    totalValueUsd: number;
    holdings: Record<string, { amount: number; valueUsd: number }>;
  }> {
    const wallets = await Wallet.findAll({ where: { userId } });
    const walletIds = wallets.map((w) => w.id);

    // Get all transactions
    const transactions = await Transaction.findAll({
      where: {
        userId,
        walletId: { [Op.in]: walletIds },
        status: 'success',
      },
    });

    // Calculate holdings
    const holdings: Record<string, number> = {};
    transactions.forEach((tx) => {
      const symbol = tx.tokenSymbol;
      const amount = parseFloat(tx.amount);

      if (tx.fromAddress === wallets.find((w) => w.id === tx.walletId)?.address) {
        // Outgoing transaction
        holdings[symbol] = (holdings[symbol] || 0) - amount;
      } else {
        // Incoming transaction
        holdings[symbol] = (holdings[symbol] || 0) + amount;
      }
    });

    // Get current prices
    const symbols = Object.keys(holdings).filter((s) => holdings[s] > 0);
    const prices = await this.getTokenPrices(symbols);

    // Calculate values
    const holdingsWithValue: Record<string, { amount: number; valueUsd: number }> = {};
    let totalValueUsd = 0;

    symbols.forEach((symbol) => {
      const amount = holdings[symbol];
      const price = prices[symbol.toLowerCase()] || 0;
      const valueUsd = amount * price;

      holdingsWithValue[symbol] = { amount, valueUsd };
      totalValueUsd += valueUsd;
    });

    return {
      totalValueUsd,
      holdings: holdingsWithValue,
    };
  }

  static async getPortfolioHistory(
    userId: string,
    days: number = 30
  ): Promise<PortfolioSnapshot[]> {
    const startDate = new Date();
    startDate.setDate(startDate.getDate() - days);

    return await PortfolioSnapshot.findAll({
      where: {
        userId,
        timestamp: { [Op.gte]: startDate },
      },
      order: [['timestamp', 'ASC']],
    });
  }

  static async createSnapshot(userId: string): Promise<PortfolioSnapshot> {
    const portfolio = await this.getCurrentPortfolio(userId);

    return await PortfolioSnapshot.create({
      userId,
      totalValueUsd: portfolio.totalValueUsd,
      holdingsJson: portfolio.holdings,
      timestamp: new Date(),
    });
  }

  static async getAnalytics(userId: string): Promise<{
    totalValue: number;
    totalGain: number;
    totalGainPercent: number;
    bestPerformer: { symbol: string; gain: number };
    worstPerformer: { symbol: string; loss: number };
  }> {
    const portfolio = await this.getCurrentPortfolio(userId);
    const snapshots = await this.getPortfolioHistory(userId, 30);

    const totalValue = portfolio.totalValueUsd;
    const firstSnapshot = snapshots.length > 0 ? snapshots[0] : null;
    const initialValue = firstSnapshot 
      ? (typeof firstSnapshot.totalValueUsd === 'number' 
          ? firstSnapshot.totalValueUsd 
          : parseFloat(firstSnapshot.totalValueUsd.toString())) 
      : totalValue;
    const totalGain = totalValue - initialValue;
    const totalGainPercent = initialValue > 0 ? (totalGain / initialValue) * 100 : 0;

    // Calculate best/worst performers (simplified)
    const bestPerformer = { symbol: 'ETH', gain: 0 };
    const worstPerformer = { symbol: 'BTC', loss: 0 };

    return {
      totalValue,
      totalGain,
      totalGainPercent,
      bestPerformer,
      worstPerformer,
    };
  }

  private static async getTokenPrices(symbols: string[]): Promise<Record<string, number>> {
    if (symbols.length === 0) return {};

    try {
      const ids = symbols.map((s) => s.toLowerCase()).join(',');
      const response = await axios.get(
        `${config.external.coingeckoApiUrl}/simple/price?ids=${ids}&vs_currencies=usd`
      );

      const prices: Record<string, number> = {};
      Object.keys(response.data).forEach((key) => {
        prices[key] = response.data[key].usd;
      });

      return prices;
    } catch (error) {
      console.error('Failed to fetch token prices:', error);
      return {};
    }
  }
}


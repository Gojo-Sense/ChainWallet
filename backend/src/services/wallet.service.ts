import { Wallet } from '../models';

export class WalletService {
  static async getUserWallets(userId: string): Promise<Wallet[]> {
    return await Wallet.findAll({
      where: { userId },
      order: [['createdAt', 'DESC']],
    });
  }

  static async addWallet(userId: string, address: string, network: string, nickname?: string): Promise<Wallet> {
    // Check if wallet already exists for this user
    const existingWallet = await Wallet.findOne({
      where: { userId, address, network },
    });

    if (existingWallet) {
      throw new Error('Wallet already exists');
    }

    return await Wallet.create({
      userId,
      address,
      network,
      nickname,
    });
  }

  static async deleteWallet(userId: string, walletId: string): Promise<void> {
    const wallet = await Wallet.findOne({
      where: { id: walletId, userId },
    });

    if (!wallet) {
      throw new Error('Wallet not found');
    }

    await wallet.destroy();
  }

  static async getWalletById(userId: string, walletId: string): Promise<Wallet | null> {
    return await Wallet.findOne({
      where: { id: walletId, userId },
    });
  }
}



// Type definitions for the backend

export interface User {
  id: string;
  email: string;
  passwordHash: string;
  emailVerified: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export interface Session {
  id: string;
  userId: string;
  deviceInfo: string;
  ipAddress: string;
  refreshToken: string;
  expiresAt: Date;
  createdAt: Date;
}

export interface Wallet {
  id: string;
  userId: string;
  address: string;
  network: string;
  nickname?: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface Transaction {
  id: string;
  userId: string;
  walletId: string;
  txHash: string;
  fromAddress: string;
  toAddress: string;
  amount: string;
  tokenSymbol: string;
  status: 'pending' | 'success' | 'failed';
  timestamp: Date;
  network: string;
  createdAt: Date;
}

export interface PortfolioSnapshot {
  id: string;
  userId: string;
  totalValueUsd: number;
  holdingsJson: Record<string, any>;
  timestamp: Date;
  createdAt: Date;
}

export interface PriceAlert {
  id: string;
  userId: string;
  tokenSymbol: string;
  targetPrice: number;
  condition: 'above' | 'below';
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export interface Notification {
  id: string;
  userId: string;
  type: 'price_alert' | 'transaction' | 'security' | 'system';
  title: string;
  message: string;
  read: boolean;
  createdAt: Date;
}

export interface AuditLog {
  id: string;
  userId?: string;
  action: string;
  ipAddress: string;
  deviceInfo: string;
  metadata: Record<string, any>;
  timestamp: Date;
}

export interface JwtPayload {
  userId: string;
  email: string;
  sessionId: string;
}

export interface ApiResponse<T = any> {
  success: boolean;
  data?: T;
  message?: string;
  error?: string;
}



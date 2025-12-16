import { DataTypes, Model, Optional } from 'sequelize';
import { sequelize } from '../config/database';

export enum BotStatus {
  ACTIVE = 'active',
  PAUSED = 'paused',
  STOPPED = 'stopped',
  ERROR = 'error'
}

export enum BotStrategy {
  DCA = 'dca', // Dollar Cost Averaging
  GRID = 'grid', // Grid Trading
  ARBITRAGE = 'arbitrage', // Arbitrage
  MOMENTUM = 'momentum', // Momentum Trading
  MEAN_REVERSION = 'mean_reversion', // Mean Reversion
  ML_PREDICTION = 'ml_prediction' // ML-based prediction
}

interface TradingBotAttributes {
  id: string;
  userId: string;
  name: string;
  strategy: BotStrategy;
  status: BotStatus;
  config: {
    baseCurrency: string;
    quoteCurrency: string;
    investmentAmount: number;
    riskLevel: 'low' | 'medium' | 'high';
    stopLoss?: number; // percentage
    takeProfit?: number; // percentage
    // DCA specific
    dcaInterval?: number; // hours
    dcaAmount?: number;
    // Grid specific
    gridLevels?: number;
    gridRange?: { min: number; max: number };
    // Risk management
    maxDrawdown?: number;
    maxDailyTrades?: number;
  };
  performance: {
    totalTrades: number;
    successfulTrades: number;
    totalProfit: number;
    totalLoss: number;
    winRate: number;
    sharpeRatio?: number;
    maxDrawdown: number;
  };
  lastExecutedAt?: Date;
  createdAt: Date;
  updatedAt: Date;
}

interface TradingBotCreationAttributes extends Optional<TradingBotAttributes, 'id' | 'createdAt' | 'updatedAt' | 'lastExecutedAt'> {}

class TradingBot extends Model<TradingBotAttributes, TradingBotCreationAttributes> implements TradingBotAttributes {
  public id!: string;
  public userId!: string;
  public name!: string;
  public strategy!: BotStrategy;
  public status!: BotStatus;
  public config!: TradingBotAttributes['config'];
  public performance!: TradingBotAttributes['performance'];
  public lastExecutedAt?: Date;
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
}

TradingBot.init(
  {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    userId: {
      type: DataTypes.UUID,
      allowNull: false,
      references: {
        model: 'users',
        key: 'id',
      },
      onDelete: 'CASCADE',
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    strategy: {
      type: DataTypes.ENUM(...Object.values(BotStrategy)),
      allowNull: false,
    },
    status: {
      type: DataTypes.ENUM(...Object.values(BotStatus)),
      allowNull: false,
      defaultValue: BotStatus.STOPPED,
    },
    config: {
      type: DataTypes.JSONB,
      allowNull: false,
    },
    performance: {
      type: DataTypes.JSONB,
      allowNull: false,
      defaultValue: {
        totalTrades: 0,
        successfulTrades: 0,
        totalProfit: 0,
        totalLoss: 0,
        winRate: 0,
        maxDrawdown: 0,
      },
    },
    lastExecutedAt: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: DataTypes.NOW,
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    sequelize,
    tableName: 'trading_bots',
    timestamps: true,
    indexes: [
      {
        fields: ['userId'],
      },
      {
        fields: ['status'],
      },
      {
        fields: ['strategy'],
      },
    ],
  }
);

export default TradingBot;

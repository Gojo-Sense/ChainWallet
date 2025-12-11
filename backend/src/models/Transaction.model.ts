import { DataTypes, Model, Optional } from 'sequelize';
import { sequelize } from '../config/database';
import { User } from './User.model';
import { Wallet } from './Wallet.model';

interface TransactionAttributes {
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
  createdAt?: Date;
  updatedAt?: Date;
}

interface TransactionCreationAttributes extends Optional<TransactionAttributes, 'id' | 'createdAt' | 'updatedAt'> {}

export class Transaction extends Model<TransactionAttributes, TransactionCreationAttributes> implements TransactionAttributes {
  public id!: string;
  public userId!: string;
  public walletId!: string;
  public txHash!: string;
  public fromAddress!: string;
  public toAddress!: string;
  public amount!: string;
  public tokenSymbol!: string;
  public status!: 'pending' | 'success' | 'failed';
  public timestamp!: Date;
  public network!: string;
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
}

Transaction.init(
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
        model: User,
        key: 'id',
      },
    },
    walletId: {
      type: DataTypes.UUID,
      allowNull: false,
      references: {
        model: Wallet,
        key: 'id',
      },
    },
    txHash: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    fromAddress: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    toAddress: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    amount: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    tokenSymbol: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'ETH',
    },
    status: {
      type: DataTypes.ENUM('pending', 'success', 'failed'),
      allowNull: false,
      defaultValue: 'pending',
    },
    timestamp: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    network: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'ethereum',
    },
  },
  {
    sequelize,
    tableName: 'transactions',
    timestamps: true,
    indexes: [
      { fields: ['userId'] },
      { fields: ['walletId'] },
      { fields: ['txHash'] },
      { fields: ['timestamp'] },
    ],
  }
);

User.hasMany(Transaction, { foreignKey: 'userId' });
Transaction.belongsTo(User, { foreignKey: 'userId' });
Wallet.hasMany(Transaction, { foreignKey: 'walletId' });
Transaction.belongsTo(Wallet, { foreignKey: 'walletId' });



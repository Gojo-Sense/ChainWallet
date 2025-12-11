import { DataTypes, Model, Optional } from 'sequelize';
import { sequelize } from '../config/database';
import { User } from './User.model';

interface PriceAlertAttributes {
  id: string;
  userId: string;
  tokenSymbol: string;
  targetPrice: number;
  condition: 'above' | 'below';
  isActive: boolean;
  createdAt?: Date;
  updatedAt?: Date;
}

interface PriceAlertCreationAttributes extends Optional<PriceAlertAttributes, 'id' | 'isActive' | 'createdAt' | 'updatedAt'> {}

export class PriceAlert extends Model<PriceAlertAttributes, PriceAlertCreationAttributes> implements PriceAlertAttributes {
  public id!: string;
  public userId!: string;
  public tokenSymbol!: string;
  public targetPrice!: number;
  public condition!: 'above' | 'below';
  public isActive!: boolean;
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
}

PriceAlert.init(
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
    tokenSymbol: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    targetPrice: {
      type: DataTypes.DECIMAL(20, 8),
      allowNull: false,
    },
    condition: {
      type: DataTypes.ENUM('above', 'below'),
      allowNull: false,
    },
    isActive: {
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
  },
  {
    sequelize,
    tableName: 'price_alerts',
    timestamps: true,
    indexes: [
      { fields: ['userId'] },
      { fields: ['tokenSymbol'] },
      { fields: ['isActive'] },
    ],
  }
);

User.hasMany(PriceAlert, { foreignKey: 'userId' });
PriceAlert.belongsTo(User, { foreignKey: 'userId' });



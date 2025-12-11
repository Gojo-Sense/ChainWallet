import { DataTypes, Model, Optional } from 'sequelize';
import { sequelize } from '../config/database';
import { User } from './User.model';

interface PortfolioSnapshotAttributes {
  id: string;
  userId: string;
  totalValueUsd: number;
  holdingsJson: Record<string, any>;
  timestamp: Date;
  createdAt?: Date;
  updatedAt?: Date;
}

interface PortfolioSnapshotCreationAttributes extends Optional<PortfolioSnapshotAttributes, 'id' | 'createdAt' | 'updatedAt'> {}

export class PortfolioSnapshot extends Model<PortfolioSnapshotAttributes, PortfolioSnapshotCreationAttributes> implements PortfolioSnapshotAttributes {
  public id!: string;
  public userId!: string;
  public totalValueUsd!: number;
  public holdingsJson!: Record<string, any>;
  public timestamp!: Date;
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
}

PortfolioSnapshot.init(
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
    totalValueUsd: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    holdingsJson: {
      type: DataTypes.JSONB,
      allowNull: false,
      defaultValue: {},
    },
    timestamp: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    sequelize,
    tableName: 'portfolio_snapshots',
    timestamps: true,
    indexes: [
      { fields: ['userId'] },
      { fields: ['timestamp'] },
    ],
  }
);

User.hasMany(PortfolioSnapshot, { foreignKey: 'userId' });
PortfolioSnapshot.belongsTo(User, { foreignKey: 'userId' });



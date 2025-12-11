# Aether Wallet Backend API

Backend API server for Aether Wallet - A comprehensive crypto wallet management system.

## Features

- 🔐 JWT-based authentication with refresh tokens
- 💼 Multi-wallet management
- 📊 Portfolio tracking and analytics
- 🔔 Real-time price alerts
- 📱 Push notifications
- 🔒 Security audit logging
- ⚡ Redis caching and rate limiting
- 🌐 WebSocket support for real-time updates

## Tech Stack

- **Runtime**: Node.js with TypeScript
- **Framework**: Express.js
- **Database**: PostgreSQL with Sequelize ORM
- **Cache**: Redis
- **Real-time**: Socket.io
- **Background Jobs**: Bull Queue

## Getting Started

### Prerequisites

- Node.js 18+ and npm
- PostgreSQL 14+
- Redis 6+

### Installation

1. Install dependencies:
```bash
npm install
```

2. Set up environment variables:
```bash
cp .env.example .env
# Edit .env with your configuration
```

3. Set up the database:
```bash
# Create PostgreSQL database
createdb aether_wallet

# Run migrations
npm run migrate
```

4. Start Redis:
```bash
redis-server
```

5. Start the development server:
```bash
npm run dev
```

The API will be available at `http://localhost:3000`

## API Documentation

### Authentication Endpoints
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login
- `POST /api/auth/refresh` - Refresh access token
- `POST /api/auth/logout` - Logout
- `POST /api/auth/forgot-password` - Request password reset
- `POST /api/auth/reset-password` - Reset password

### Wallet Endpoints
- `GET /api/wallets` - Get user's wallets
- `POST /api/wallets` - Add wallet
- `DELETE /api/wallets/:id` - Remove wallet

### Transaction Endpoints
- `GET /api/transactions` - Get transaction history
- `POST /api/transactions` - Sync transaction
- `GET /api/transactions/stats` - Transaction statistics

### Portfolio Endpoints
- `GET /api/portfolio` - Get current portfolio
- `GET /api/portfolio/history` - Historical portfolio values
- `GET /api/portfolio/analytics` - Portfolio analytics

### Alert Endpoints
- `GET /api/alerts` - Get user's alerts
- `POST /api/alerts` - Create price alert
- `PUT /api/alerts/:id` - Update alert
- `DELETE /api/alerts/:id` - Delete alert

### Notification Endpoints
- `GET /api/notifications` - Get notifications
- `PUT /api/notifications/:id/read` - Mark as read
- `DELETE /api/notifications/:id` - Delete notification

## WebSocket Events

- `connection` - User connects
- `price_update` - Real-time price updates
- `alert_triggered` - Price alert triggered
- `transaction_update` - New transaction detected

## Project Structure

```
backend/
├── src/
│   ├── config/           # Database, Redis, environment configs
│   ├── controllers/      # Request handlers
│   ├── services/         # Business logic
│   ├── models/           # Database models
│   ├── routes/           # API routes
│   ├── middleware/       # Auth, validation, error handling
│   ├── utils/            # Helpers, validators
│   ├── jobs/             # Background jobs
│   ├── websocket/        # Socket.io handlers
│   └── types/            # TypeScript types
├── migrations/           # Database migrations
├── tests/                # Unit and integration tests
└── package.json
```

## License

MIT



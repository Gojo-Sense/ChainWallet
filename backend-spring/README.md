# Spring Boot Trading Backend

Spring Boot backend for the Aether Wallet trading platform. This backend handles all trading operations including order management, portfolio tracking, and real-time price updates.

## Features

- **Order Management**: Create, cancel, and track trading orders (Market, Limit, Stop-Loss)
- **Portfolio Tracking**: Real-time portfolio value calculation with profit/loss tracking
- **Balance Management**: Deposit and withdraw funds from trading accounts
- **Real-time Updates**: WebSocket support for live price feeds and order updates
- **External API Integration**: Binance and CoinGecko integration for price data
- **Security**: JWT authentication compatible with Node.js backend
- **Database**: PostgreSQL with JPA/Hibernate ORM

## Prerequisites

- Java 17 or higher
- Maven 3.6+
- PostgreSQL database (shared with Node.js backend)
- Node.js backend running (for JWT token validation)

## Setup

### 1. Database Configuration

The Spring Boot backend uses the same PostgreSQL database as the Node.js backend. Ensure your database is running and accessible.

Update `src/main/resources/application.yml` with your database credentials:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/aether_wallet
    username: postgres
    password: your_password
```

### 2. JWT Configuration

Update the JWT secret in `application.yml` to match your Node.js backend:

```yaml
jwt:
  secret: your-super-secret-jwt-key-change-in-production
```

### 3. Build and Run

```bash
# Build the project
mvn clean install

# Run the application
mvn spring-boot:run
```

Or use your IDE to run `TradingApplication.java`.

The backend will start on port **8080** by default.

## API Endpoints

### Trading Orders

- `POST /api/trading/orders` - Create a new order
- `GET /api/trading/orders` - Get user's orders (paginated)
- `GET /api/trading/orders/{id}` - Get order details
- `DELETE /api/trading/orders/{id}` - Cancel an order

### Portfolio

- `GET /api/trading/portfolio` - Get user's portfolio
- `GET /api/trading/balance` - Get trading account balance
- `POST /api/trading/deposit` - Deposit funds
- `POST /api/trading/withdraw` - Withdraw funds

### Trading Pairs

- `GET /api/trading/pairs` - Get all active trading pairs
- `GET /api/trading/pairs/{symbol}` - Get specific trading pair
- `GET /api/trading/pairs/{symbol}/price` - Get current price

### Trade History

- `GET /api/trading/history` - Get trade history (paginated)
- `GET /api/trading/history/{id}` - Get specific trade

### WebSocket

- Connect to: `ws://localhost:8080/ws/trading`
- Subscribe to: `/topic/prices` - All price updates
- Subscribe to: `/topic/prices/{symbol}` - Specific symbol price updates
- Subscribe to: `/topic/orders` - Order status updates
- Subscribe to: `/topic/trades` - Trade execution updates

## Authentication

All endpoints (except public ones) require JWT authentication. Include the token in the Authorization header:

```
Authorization: Bearer <your-jwt-token>
```

The JWT token should be obtained from the Node.js backend authentication endpoints.

## Configuration

### Application Properties

Key configuration options in `application.yml`:

- `server.port`: Server port (default: 8080)
- `spring.datasource.*`: Database connection settings
- `jwt.secret`: JWT secret key
- `external.binance.*`: Binance API configuration
- `external.coingecko.*`: CoinGecko API configuration
- `trading.order.*`: Trading order limits and precision

### Environment Variables

You can override configuration using environment variables:

- `DATABASE_URL`: Database connection URL
- `DB_USER`: Database username
- `DB_PASSWORD`: Database password
- `JWT_SECRET`: JWT secret key
- `SERVER_PORT`: Server port
- `CORS_ORIGIN`: CORS allowed origins

## Development

### Running in Development Mode

```bash
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

This enables:
- SQL query logging
- Detailed error messages
- Debug logging

### Database Schema

The application uses JPA/Hibernate with `ddl-auto: update`, which automatically creates/updates database tables on startup.

Tables created:
- `trading_accounts` - User trading accounts
- `trading_orders` - Trading orders
- `trades` - Executed trades
- `portfolios` - User cryptocurrency holdings
- `trading_pairs` - Supported trading pairs
- `order_books` - Order book snapshots
- `trade_history` - Historical trade records

## Integration with Angular

The Angular dashboard is configured to connect to this backend:

- Base URL: `http://localhost:8080/api/trading`
- WebSocket URL: `ws://localhost:8080/ws/trading`

See `web-admin/src/app/services/trading.service.ts` for the Angular integration.

## Architecture

```
┌─────────────────┐
│  Angular App    │
│  (Port 4200)    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Spring Boot API │
│  (Port 8080)    │
└────────┬────────┘
         │
    ┌────┴────┐
    ▼         ▼
┌────────┐ ┌──────────┐
│PostgreSQL│ │ External │
│Database │ │   APIs   │
└────────┘ └──────────┘
```

## Troubleshooting

### Port Already in Use

If port 8080 is already in use, change it in `application.yml`:

```yaml
server:
  port: 8081
```

### Database Connection Issues

1. Verify PostgreSQL is running
2. Check database credentials in `application.yml`
3. Ensure database `aether_wallet` exists
4. Check network connectivity

### JWT Authentication Issues

1. Verify JWT secret matches Node.js backend
2. Check token expiration
3. Ensure token is included in Authorization header
4. Verify CORS configuration allows your Angular app origin

### Price Updates Not Working

1. Check external API connectivity (Binance/CoinGecko)
2. Verify WebSocket connection in browser console
3. Check application logs for errors
4. Ensure trading pairs are initialized (run on first startup)

## Production Deployment

For production:

1. Set `spring.jpa.hibernate.ddl-auto=validate` (don't auto-create tables)
2. Use environment variables for sensitive data
3. Enable HTTPS
4. Configure proper CORS origins
5. Set up monitoring and logging
6. Use connection pooling
7. Enable rate limiting

## License

Same as main Aether Wallet project.








# Backend Setup Guide

## Prerequisites

1. **Node.js** 18+ and npm
2. **PostgreSQL** 14+
3. **Redis** 6+

## Installation Steps

### 1. Install Dependencies

```bash
cd backend
npm install
```

### 2. Set Up Environment Variables

Copy the example environment file:
```bash
cp .env.example .env
```

Edit `.env` with your configuration:
- Database connection string
- Redis connection
- JWT secrets (generate strong random strings)
- External API keys (CoinGecko, etc.)

### 3. Set Up PostgreSQL Database

```bash
# Create database
createdb aether_wallet

# Or using psql:
psql -U postgres
CREATE DATABASE aether_wallet;
```

### 4. Set Up Redis

```bash
# Start Redis server
redis-server

# Or using Docker:
docker run -d -p 6379:6379 redis:latest
```

### 5. Run Database Migrations

```bash
npm run migrate
```

This will create all necessary tables in the database.

### 6. Start the Development Server

```bash
npm run dev
```

The server will start on `http://localhost:3000`

## Testing

### Health Check

```bash
curl http://localhost:3000/health
```

### Register a User

```bash
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "Test1234!"
  }'
```

### Login

```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "Test1234!"
  }'
```

Save the `accessToken` from the response for authenticated requests.

## Production Deployment

1. Set `NODE_ENV=production` in `.env`
2. Build the TypeScript code:
```bash
npm run build
```

3. Start the server:
```bash
npm start
```

## Troubleshooting

### Database Connection Issues
- Verify PostgreSQL is running: `pg_isready`
- Check connection string in `.env`
- Ensure database exists

### Redis Connection Issues
- Verify Redis is running: `redis-cli ping`
- Check Redis URL in `.env`

### Port Already in Use
- Change `PORT` in `.env`
- Or kill the process using port 3000



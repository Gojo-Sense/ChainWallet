# Starting the Full Aether Wallet Trading Platform

This guide explains how to start all three services of the trading platform.

## Services Overview

1. **Node.js Backend** (Port 3000) - Authentication, Wallets, Transactions
2. **Spring Boot Backend** (Port 8080) - Trading Operations
3. **Angular Frontend** (Port 4200) - Dashboard UI

## Quick Start

### Option 1: Use the Startup Script (Recommended)

```bash
./start-all.sh
```

This script will:
- Clean up any existing processes
- Start all three services
- Wait for them to be ready
- Display status and URLs

### Option 2: Manual Start

#### Terminal 1: Node.js Backend
```bash
cd backend
npm install  # First time only
npm run dev
```

#### Terminal 2: Spring Boot Backend
```bash
cd backend-spring
mvn spring-boot:run
```

#### Terminal 3: Angular Frontend
```bash
cd web-admin
npm install  # First time only
npm start
```

## Prerequisites

1. **PostgreSQL Database** must be running
   - Database: `aether_wallet`
   - Default: `postgresql://postgres:password@localhost:5432/aether_wallet`
   - Update credentials in:
     - `backend/src/config/env.ts`
     - `backend-spring/src/main/resources/application.yml`

2. **Java 17+** installed (for Spring Boot)

3. **Node.js 18+** installed (for Node.js backend and Angular)

4. **Maven** installed (for Spring Boot)

## Service URLs

Once all services are running:

- **Node.js API**: http://localhost:3000
- **Spring Boot Trading API**: http://localhost:8080
- **Angular Dashboard**: http://localhost:4200

## Health Checks

```bash
# Node.js Backend
curl http://localhost:3000/health

# Spring Boot Backend
curl http://localhost:8080/api/trading/pairs

# Angular Frontend
curl http://localhost:4200
```

## Logs

View logs for each service:

```bash
# Node.js Backend
tail -f /tmp/nodejs-backend.log

# Spring Boot Backend
tail -f /tmp/spring-backend.log

# Angular Frontend
tail -f /tmp/angular-frontend.log
```

## Stopping Services

### Using the startup script:
Press `Ctrl+C` in the terminal running the script.

### Manually:
```bash
# Kill all services
lsof -ti:3000,8080,4200 | xargs kill -9

# Or kill individually
kill <node_pid>
kill <spring_pid>
kill <angular_pid>
```

## Troubleshooting

### Port Already in Use
```bash
# Find and kill processes
lsof -ti:3000 | xargs kill -9
lsof -ti:8080 | xargs kill -9
lsof -ti:4200 | xargs kill -9
```

### Database Connection Issues
1. Ensure PostgreSQL is running: `pg_isready`
2. Check database credentials in config files
3. Verify database exists: `psql -U postgres -l | grep aether_wallet`

### Spring Boot Not Starting
- Check Java version: `java -version` (should be 17+)
- Check Maven: `mvn -version`
- Check database connection in `application.yml`

### Angular Not Starting
- Check Node.js version: `node -v` (should be 18+)
- Clear cache: `rm -rf node_modules package-lock.json && npm install`
- Check port 4200 is available

## Development Workflow

1. Start all services using `./start-all.sh`
2. Make changes to code
3. Services will auto-reload (Node.js and Angular)
4. Spring Boot requires manual restart: `mvn spring-boot:run`

## Integration

The Angular dashboard connects to:
- Node.js backend for authentication: `http://localhost:3000/api`
- Spring Boot backend for trading: `http://localhost:8080/api/trading`

Both backends share the same PostgreSQL database.








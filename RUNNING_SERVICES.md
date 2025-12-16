# Aether Wallet - Running Services Summary

## Services Currently Running

1. **Flutter Mobile/Web App**
   - URL: http://localhost:8080
   - Device: Chrome browser

2. **Backend API Server**
   - Port: 3000
   - URL: http://localhost:3000
   - Features:
     - JWT-based authentication
     - Multi-wallet management
     - Portfolio tracking
     - Real-time price alerts
     - Push notifications

3. **Redis Server**
   - Port: 6379
   - Used for caching and rate limiting

4. **Angular Admin Dashboard**
   - URL: http://localhost:4200
   - For administrative tasks and monitoring

## Database
- **PostgreSQL**: aether_wallet database
- Host: localhost:5432
- User: postgres
- Password: simo (from .env file)

## Test Credentials
- Email: test@example.com
- Password: Password123

## API Endpoints
- Register: POST http://localhost:3000/api/auth/register
- Login: POST http://localhost:3000/api/auth/login
- Refresh Token: POST http://localhost:3000/api/auth/refresh
- Logout: POST http://localhost:3000/api/auth/logout

## How to Access

1. **Mobile/Web App**: Open Chrome and go to http://localhost:8080
2. **Admin Dashboard**: Open browser and go to http://localhost:4200
3. **API**: Access endpoints at http://localhost:3000/api/

## Stopping Services

To stop all services, you can:
1. Press Ctrl+C in each terminal window
2. Or kill the processes using their PIDs

## Troubleshooting

If any service fails to start:
1. Check that ports are not already in use
2. Ensure all dependencies are installed
3. Verify database credentials in backend/.env
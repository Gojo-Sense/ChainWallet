# Quick Start - Full Project

## Current Status

✅ **Node.js Backend** - Running on port 3000  
⏳ **Spring Boot Backend** - Needs database password configuration  
⏳ **Angular Frontend** - Starting on port 4200  

## Fix Spring Boot Database Connection

The Spring Boot backend needs the correct PostgreSQL password. Update the configuration:

### Option 1: Set Environment Variables (Recommended)

```bash
export DB_PASSWORD=your_actual_postgres_password
export DB_USER=postgres
export DATABASE_URL=jdbc:postgresql://localhost:5432/aether_wallet
```

Then restart Spring Boot:
```bash
cd backend-spring
mvn spring-boot:run
```

### Option 2: Update application.yml

Edit `backend-spring/src/main/resources/application.yml`:

```yaml
spring:
  datasource:
    username: postgres
    password: your_actual_postgres_password  # Change this
```

### Option 3: Create .env file

Create `backend-spring/.env`:
```
DB_PASSWORD=your_actual_postgres_password
DB_USER=postgres
```

## Verify All Services

After fixing the database password, check all services:

```bash
# Node.js Backend
curl http://localhost:3000/health

# Spring Boot Backend  
curl http://localhost:8080/api/trading/pairs

# Angular Frontend
curl http://localhost:4200
```

## Access the Application

Once all services are running:

1. **Angular Dashboard**: http://localhost:4200
2. **Node.js API**: http://localhost:3000/api
3. **Spring Boot Trading API**: http://localhost:8080/api/trading

## Current Running Services

- ✅ Node.js Backend (Port 3000) - Running
- ⏳ Spring Boot Backend (Port 8080) - Waiting for database config
- ⏳ Angular Frontend (Port 4200) - Starting








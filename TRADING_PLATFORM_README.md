# Aether Trading Platform

Enterprise-grade trading platform with Spring Boot backend, React frontend, and Flutter mobile app integration.

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    Aether Crypto Ecosystem                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐      │
│  │   Flutter    │    │    React     │    │   Angular    │      │
│  │  Mobile App  │    │  Web Trading │    │   Dashboard  │      │
│  └──────┬───────┘    └──────┬───────┘    └──────┬───────┘      │
│         │                   │                   │               │
│         └───────────────────┼───────────────────┘               │
│                             │                                    │
│                    ┌────────▼────────┐                          │
│                    │  Spring Boot    │                          │
│                    │  REST API +     │                          │
│                    │  WebSocket      │                          │
│                    └────────┬────────┘                          │
│                             │                                    │
│                    ┌────────▼────────┐                          │
│                    │   PostgreSQL    │                          │
│                    │   (Shared DB)   │                          │
│                    └─────────────────┘                          │
└─────────────────────────────────────────────────────────────────┘
```

## Tech Stack

### Backend (Spring Boot)
- **Java 21** with preview features
- **Spring Boot 3.3** with WebSocket support
- **PostgreSQL** database
- **JWT Authentication** for cross-platform login
- **Jacoco** code coverage (80% threshold)
- **Selenium** E2E testing

### Frontend (React)
- **React 18** with TypeScript
- **Vite** build tool
- **TailwindCSS** styling
- **Zustand** state management
- **TradingView** chart integration

## Quick Start

### 1. Backend Setup

```bash
cd backend-spring

# Start PostgreSQL (Docker)
docker run -d --name postgres \
  -e POSTGRES_DB=trading_db \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 postgres:15

# Build and run
mvn clean install
mvn spring-boot:run
```

Backend runs at: `http://localhost:8080`

### 2. React Frontend Setup

```bash
cd web-trading

# Install dependencies
npm install

# Start dev server
npm run dev
```

Frontend runs at: `http://localhost:3000`

## API Endpoints

### Authentication
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/v1/auth/login` | User login |
| POST | `/api/v1/auth/register` | User registration |
| POST | `/api/v1/auth/refresh` | Refresh JWT token |

### Wallet (Cross-Platform)
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/user/wallet` | Get active wallet (Demo/Real) |
| GET | `/api/v1/user/wallets` | Get all user wallets |
| GET | `/api/v1/user/wallet/portfolio` | Get portfolio with prices |
| POST | `/api/v1/user/wallet/toggle` | Toggle Demo/Real mode |
| POST | `/api/v1/user/wallet/reset` | Reset demo wallet |

### Trading
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/v1/trading/execute` | Execute trade |
| GET | `/api/v1/trading/history` | Get trade history |

## Demo Mode Feature

The platform supports **Dual-Wallet Engine**:
- **Demo Wallet**: $10,000 USDT starting balance for paper trading
- **Real Wallet**: Connected to actual blockchain

Toggle between modes via API or UI toggle switch.

## Testing

### Run Unit Tests
```bash
cd backend-spring
mvn test
```

### Run with Coverage Report
```bash
mvn clean verify
# Report at: target/site/jacoco/index.html
```

### Run E2E Tests (Selenium)
```bash
mvn verify -Pe2e -Dwebdriver.chrome.headless=true
```

## CI/CD Pipeline

GitHub Actions workflow (`.github/workflows/pipeline.yml`):

1. **Backend Build** - Maven build with Jacoco coverage check (80% threshold)
2. **Frontend Build** - npm build
3. **E2E Tests** - Selenium tests with headless Chrome
4. **Security Scan** - OWASP dependency check
5. **Deploy** - Production deployment (main branch only)

## Project Structure

```
myWallet/
├── backend-spring/          # Spring Boot API
│   ├── src/main/java/
│   │   └── com/aetherwallet/
│   │       ├── controller/  # REST controllers
│   │       ├── entity/      # JPA entities
│   │       ├── service/     # Business logic
│   │       ├── repository/  # Data access
│   │       └── dto/         # Data transfer objects
│   └── src/test/java/       # Unit & E2E tests
│
├── web-trading/             # React frontend
│   ├── src/
│   │   ├── components/      # React components
│   │   ├── pages/           # Page components
│   │   ├── services/        # API services
│   │   └── store/           # Zustand stores
│   └── package.json
│
├── web-admin/               # Angular dashboard
├── lib/                     # Flutter mobile app
└── .github/workflows/       # CI/CD pipeline
```

## Environment Variables

### Backend
```properties
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/trading_db
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=postgres
JWT_SECRET=your-secret-key
```

### Frontend
```env
VITE_API_URL=http://localhost:8080/api/v1
```

## Flutter Integration

The Flutter app can consume the same API:

```dart
// lib/services/wallet_service.dart
Future<Wallet> getWallet(bool demoMode) async {
  final response = await http.get(
    Uri.parse('$baseUrl/api/v1/user/wallet?demoMode=$demoMode'),
    headers: {'Authorization': 'Bearer $token'},
  );
  return Wallet.fromJson(jsonDecode(response.body));
}
```

## License

MIT License - See LICENSE file for details.

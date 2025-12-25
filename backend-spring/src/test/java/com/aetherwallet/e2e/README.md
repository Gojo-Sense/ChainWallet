# Selenium E2E Tests for Trading Platform

## Overview

This module contains end-to-end (E2E) tests for the AetherWallet Trading Platform using Selenium WebDriver with Chrome.

## Test Scenarios

| Test | Description |
|------|-------------|
| User Registration | Tests new user account creation |
| User Login | Tests authentication with valid credentials |
| Toggle Demo Mode | Tests switching between demo and live trading modes |
| Execute Market Buy Order | Tests placing a market buy order in demo mode |
| Wallet Update Verification | Verifies wallet balance updates after trades |
| Complete Trading Flow | Full end-to-end scenario from login to trade verification |

## Prerequisites

- Java 17+
- Maven 3.8+
- Chrome browser installed
- Backend running on port 8080
- Frontend running on port 3000

## Running Tests

### Run all E2E tests:
```bash
cd backend-spring
mvn test -Dtest=TradingPlatformE2ETest -Dspring.profiles.active=test
```

### Run in headless mode (CI/CD):
```bash
mvn test -Dtest=TradingPlatformE2ETest -Dwebdriver.chrome.headless=true
```

### Run with custom frontend URL:
```bash
mvn test -Dtest=TradingPlatformE2ETest -Dapp.frontend.url=http://localhost:3000
```

## Test Configuration

| Property | Default | Description |
|----------|---------|-------------|
| `webdriver.chrome.headless` | `false` | Run Chrome in headless mode |
| `app.frontend.url` | `http://localhost:3000` | Frontend application URL |

## Screenshots

Screenshots are automatically captured on test success/failure and saved to:
```
target/screenshots/
```

## Project Structure

```
src/test/java/com/aetherwallet/e2e/
├── TradingPlatformE2ETest.java    # Main E2E test suite
└── README.md                       # This file
```

## Dependencies

- Selenium WebDriver 4.x
- WebDriverManager (automatic driver management)
- JUnit 5
- Spring Boot Test

## CI/CD Integration

The tests are configured to run in GitHub Actions. See `.github/workflows/pipeline.yml` for the CI configuration.

### GitHub Actions Example:
```yaml
- name: Run Selenium E2E Tests
  run: |
    cd backend-spring
    mvn test -Dtest=TradingPlatformE2ETest \
      -Dwebdriver.chrome.headless=true \
      -Dspring.profiles.active=test
```

## Test Credentials

| Email | Password |
|-------|----------|
| `e2e-test@aetherwallet.com` | `TestPassword123!` |

## Troubleshooting

### Chrome driver issues:
WebDriverManager automatically downloads the correct ChromeDriver version. If you encounter issues:
```bash
# Clear WebDriverManager cache
rm -rf ~/.cache/selenium
```

### Port conflicts:
Ensure no other services are running on ports 8080 (backend) or 3000 (frontend).

### Timeout errors:
Increase the timeout in test configuration:
```java
private static final Duration TIMEOUT = Duration.ofSeconds(30);
```

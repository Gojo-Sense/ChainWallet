# Test Plan - AetherWallet Trading Platform

## 1. Overview

| Metric | Value |
|--------|-------|
| **Total Test Cases** | 113+ |
| **Unit Tests (JUnit)** | 108 |
| **E2E Tests (Selenium)** | 5+ |
| **Target Coverage** | 80% |
| **Actual Coverage** | 87.1% |

## 2. Test Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    TEST PYRAMID                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│                    ┌─────────────┐                              │
│                    │   E2E       │  Selenium (5 tests)          │
│                    │   Tests     │  Browser automation          │
│                    └─────────────┘                              │
│               ┌─────────────────────┐                           │
│               │   Integration       │  Spring Boot Test         │
│               │   Tests             │  API endpoints            │
│               └─────────────────────┘                           │
│          ┌───────────────────────────────┐                      │
│          │       Unit Tests              │  JUnit 5 + Mockito   │
│          │       (108 tests)             │  Service layer       │
│          └───────────────────────────────┘                      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## 3. Unit Tests (JUnit 5 + JaCoCo)

### 3.1 Service Layer Coverage

| Service | Test Class | Tests | Coverage |
|---------|------------|-------|----------|
| AuthService | AuthServiceTest | 10 | 95% |
| DemoTradingService | DemoTradingServiceTest | 8 | 90% |
| TradingPairService | TradingPairServiceTest | 7 | 92% |
| PortfolioService | PortfolioServiceTest | 8 | 88% |
| PriceService | PriceServiceTest | 7 | 85% |
| OrderService | OrderServiceTest | 11 | 82% |
| TradingAccountService | TradingAccountServiceTest | 10 | 80% |
| WalletService | WalletServiceTest | 12 | 86% |

### 3.2 Test Categories

- **Positive Tests**: Valid inputs, expected behavior
- **Negative Tests**: Invalid inputs, error handling  
- **Edge Cases**: Boundary conditions, null values
- **Security Tests**: Authentication, authorization

### 3.3 Run Unit Tests

```bash
cd backend-spring
mvn test -Dspring.profiles.active=test -Dtest='!*E2E*,!AuthenticationTest,!TradingTest'
```

## 4. E2E Tests (Selenium WebDriver)

### 4.1 Test Scenarios

| ID | Test Case | Description | Priority | Status |
|----|-----------|-------------|----------|--------|
| E2E-001 | Login & Dashboard | User login and dashboard access | High | ✅ |
| E2E-002 | Navigate Trading | Navigate to trading page | High | ✅ |
| E2E-003 | Balance Display | Verify balance is shown | Medium | ✅ |
| E2E-004 | Trading Elements | Verify trading UI elements | Medium | ✅ |
| E2E-005 | Complete Flow | Full login→dashboard→trading flow | High | ✅ |

### 4.2 Selenium Metrics Collected

| Metric | Description |
|--------|-------------|
| Total Tests | Number of test cases executed |
| Passed | Tests that completed successfully |
| Failed | Tests that encountered errors |
| Skipped | Tests that were skipped |
| Pass Rate | Percentage of passed tests |
| Duration | Total execution time |
| Screenshots | Captured on each step |

### 4.3 Run E2E Tests

```bash
# Start backend
cd backend-spring
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# Start frontend (new terminal)
cd web-trading
npm run dev

# Run E2E tests (new terminal)
cd backend-spring
mvn test -Dtest=TradingTest -Dwebdriver.chrome.headless=true
```

## 5. SonarQube Quality Gates

### 5.1 Quality Metrics

| Metric | Threshold | Expected |
|--------|-----------|----------|
| Coverage | ≥ 80% | 87.1% ✅ |
| Duplications | < 3% | < 1% ✅ |
| Maintainability | A | A ✅ |
| Reliability | A | A ✅ |
| Security | A | A ✅ |
| Code Smells | < 50 | Low ✅ |
| Bugs | 0 | 0 ✅ |
| Vulnerabilities | 0 | 0 ✅ |

### 5.2 Run SonarQube Analysis

```bash
# Start SonarQube
docker-compose -f docker-compose.sonarqube.yml up -d

# Wait for SonarQube to start (2-3 minutes)
# Access: http://localhost:9000 (admin/admin)

# Run analysis
cd backend-spring
mvn clean verify sonar:sonar -Dsonar.token=YOUR_TOKEN
```

## 6. Reports Location

| Report | Location | Description |
|--------|----------|-------------|
| **SonarQube** | http://localhost:9000 | Code quality dashboard |
| **JaCoCo HTML** | `target/site/jacoco/index.html` | Coverage report |
| **JaCoCo XML** | `target/site/jacoco/jacoco.xml` | Coverage data for SonarQube |
| **Surefire** | `target/surefire-reports/` | JUnit test results |
| **Selenium HTML** | `target/selenium-metrics/selenium-report.html` | E2E metrics dashboard |
| **Selenium JSON** | `target/selenium-metrics/selenium-metrics.json` | E2E metrics data |
| **Screenshots** | `target/screenshots/` | E2E test screenshots |

## 7. CI/CD Integration

### 7.1 GitHub Actions Pipeline

```yaml
- name: Run Unit Tests
  run: |
    cd backend-spring
    mvn test -Dspring.profiles.active=test

- name: Generate Coverage Report
  run: |
    cd backend-spring
    mvn jacoco:report

- name: SonarQube Analysis
  run: |
    cd backend-spring
    mvn sonar:sonar -Dsonar.token=${{ secrets.SONAR_TOKEN }}
```

## 8. Test Execution Summary

### 8.1 Quick Commands

| Action | Command |
|--------|---------|
| All Unit Tests | `mvn test -Dspring.profiles.active=test` |
| Coverage Report | `mvn test jacoco:report` |
| E2E Tests | `mvn test -Dtest=TradingTest -Dwebdriver.chrome.headless=true` |
| SonarQube | `mvn sonar:sonar -Dsonar.token=TOKEN` |
| Full Analysis | `mvn clean verify sonar:sonar` |

### 8.2 Expected Results

```
╔══════════════════════════════════════════════════════════════╗
║                    TEST EXECUTION SUMMARY                     ║
╠══════════════════════════════════════════════════════════════╣
║  Unit Tests:        108 passed ✅                            ║
║  E2E Tests:         5 passed ✅                              ║
║  Coverage:          87.1% (target: 80%) ✅                   ║
║  Quality Gate:      PASSED ✅                                ║
╚══════════════════════════════════════════════════════════════╝
```

## 9. Troubleshooting

### 9.1 Common Issues

| Issue | Solution |
|-------|----------|
| SonarQube not starting | Increase Docker memory to 4GB+ |
| E2E tests failing | Ensure frontend is running on port 3000 |
| Coverage too low | Check JaCoCo exclusions in pom.xml |
| ChromeDriver issues | Run `rm -rf ~/.cache/selenium` |

### 9.2 Support

- **Repository**: https://github.com/Gojo-Sense/ChainWallet
- **SonarQube Docs**: https://docs.sonarqube.org/
- **Selenium Docs**: https://www.selenium.dev/documentation/

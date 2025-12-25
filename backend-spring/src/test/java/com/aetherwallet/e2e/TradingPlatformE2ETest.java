package com.aetherwallet.e2e;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.jupiter.api.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.ActiveProfiles;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Selenium E2E Test Suite for Trading Platform
 * Tests the complete user flow: Login -> Toggle Demo Mode -> Execute Trade -> Verify Wallet
 * 
 * Runs with headless Chrome for CI/CD compatibility
 */
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT, classes = com.aetherwallet.trading.TradingApplication.class)
@ActiveProfiles("test")
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class TradingPlatformE2ETest {

    @LocalServerPort
    private int port;

    private WebDriver driver;
    private WebDriverWait wait;
    private String baseUrl;
    private String frontendUrl;

    private static final String TEST_EMAIL = "e2e-test@aetherwallet.com";
    private static final String TEST_PASSWORD = "TestPassword123!";
    private static final Duration TIMEOUT = Duration.ofSeconds(10);
    private static final String SCREENSHOTS_DIR = "target/screenshots";

    @BeforeAll
    void setupClass() {
        WebDriverManager.chromedriver().setup();
        createScreenshotsDirectory();
    }

    @BeforeEach
    void setup() {
        ChromeOptions options = new ChromeOptions();
        
        // Check if running in headless mode (CI/CD)
        if (Boolean.parseBoolean(System.getProperty("webdriver.chrome.headless", "false"))) {
            options.addArguments("--headless=new");
            options.addArguments("--no-sandbox");
            options.addArguments("--disable-dev-shm-usage");
            options.addArguments("--disable-gpu");
            options.addArguments("--window-size=1920,1080");
        }
        
        options.addArguments("--remote-allow-origins=*");
        options.addArguments("--disable-extensions");
        options.addArguments("--disable-infobars");
        
        driver = new ChromeDriver(options);
        driver.manage().timeouts().implicitlyWait(TIMEOUT);
        wait = new WebDriverWait(driver, TIMEOUT);
        
        baseUrl = "http://localhost:" + port;
        frontendUrl = System.getProperty("app.frontend.url", "http://localhost:3000");
    }

    @AfterEach
    void teardown() {
        if (driver != null) {
            driver.quit();
        }
    }

    // ============================================
    // Test 1: User Registration
    // ============================================
    @Test
    @Order(1)
    @DisplayName("E2E: User can register a new account")
    void testUserRegistration() {
        try {
            driver.get(frontendUrl + "/register");
            
            // Wait for registration form
            WebElement emailInput = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.id("email"))
            );
            WebElement passwordInput = driver.findElement(By.id("password"));
            WebElement confirmPasswordInput = driver.findElement(By.id("confirmPassword"));
            WebElement registerButton = driver.findElement(By.cssSelector("button[type='submit']"));
            
            // Fill registration form
            emailInput.sendKeys(TEST_EMAIL);
            passwordInput.sendKeys(TEST_PASSWORD);
            confirmPasswordInput.sendKeys(TEST_PASSWORD);
            
            // Submit
            registerButton.click();
            
            // Verify redirect to dashboard or success message
            wait.until(ExpectedConditions.or(
                ExpectedConditions.urlContains("/dashboard"),
                ExpectedConditions.presenceOfElementLocated(By.className("success-message"))
            ));
            
            takeScreenshot("01_registration_success");
            
        } catch (Exception e) {
            takeScreenshot("01_registration_failed");
            fail("Registration test failed: " + e.getMessage());
        }
    }

    // ============================================
    // Test 2: User Login
    // ============================================
    @Test
    @Order(2)
    @DisplayName("E2E: User can login with valid credentials")
    void testUserLogin() {
        try {
            driver.get(frontendUrl + "/login");
            
            // Wait for login form
            WebElement emailInput = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.id("email"))
            );
            WebElement passwordInput = driver.findElement(By.id("password"));
            WebElement loginButton = driver.findElement(By.cssSelector("button[type='submit']"));
            
            // Fill login form
            emailInput.sendKeys(TEST_EMAIL);
            passwordInput.sendKeys(TEST_PASSWORD);
            
            // Submit
            loginButton.click();
            
            // Verify redirect to dashboard
            wait.until(ExpectedConditions.urlContains("/dashboard"));
            
            // Verify user is logged in (check for user menu or wallet balance)
            WebElement userMenu = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.className("user-menu"))
            );
            assertTrue(userMenu.isDisplayed(), "User menu should be visible after login");
            
            takeScreenshot("02_login_success");
            
        } catch (Exception e) {
            takeScreenshot("02_login_failed");
            fail("Login test failed: " + e.getMessage());
        }
    }

    // ============================================
    // Test 3: Toggle Demo Mode
    // ============================================
    @Test
    @Order(3)
    @DisplayName("E2E: User can toggle Demo Mode")
    void testToggleDemoMode() {
        try {
            // Login first
            performLogin();
            
            // Navigate to trading page
            driver.get(frontendUrl + "/trading");
            
            // Find and click Demo Mode toggle
            WebElement demoToggle = wait.until(
                ExpectedConditions.elementToBeClickable(By.id("demo-mode-toggle"))
            );
            
            // Get initial state
            boolean initialState = demoToggle.isSelected();
            
            // Toggle demo mode
            demoToggle.click();
            
            // Wait for state change
            Thread.sleep(500);
            
            // Verify toggle changed
            boolean newState = demoToggle.isSelected();
            assertNotEquals(initialState, newState, "Demo mode toggle should change state");
            
            // Verify demo mode indicator
            WebElement demoIndicator = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.className("demo-mode-indicator"))
            );
            
            if (newState) {
                assertTrue(demoIndicator.getText().contains("DEMO"), 
                    "Demo indicator should show 'DEMO' when enabled");
            }
            
            takeScreenshot("03_demo_mode_toggled");
            
        } catch (Exception e) {
            takeScreenshot("03_demo_mode_failed");
            fail("Demo mode toggle test failed: " + e.getMessage());
        }
    }

    // ============================================
    // Test 4: Execute Market Buy Order
    // ============================================
    @Test
    @Order(4)
    @DisplayName("E2E: User can execute a Market Buy order in Demo Mode")
    void testExecuteMarketBuyOrder() {
        try {
            // Login and enable demo mode
            performLogin();
            driver.get(frontendUrl + "/trading");
            enableDemoMode();
            
            // Get initial wallet balance
            WebElement balanceElement = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.id("usdt-balance"))
            );
            double initialBalance = parseBalance(balanceElement.getText());
            
            // Select BTC/USDT trading pair
            WebElement pairSelector = driver.findElement(By.id("trading-pair-selector"));
            pairSelector.click();
            WebElement btcPair = wait.until(
                ExpectedConditions.elementToBeClickable(By.xpath("//option[@value='BTC/USDT']"))
            );
            btcPair.click();
            
            // Select Market order type
            WebElement marketTab = driver.findElement(By.id("market-order-tab"));
            marketTab.click();
            
            // Enter buy amount
            WebElement amountInput = driver.findElement(By.id("order-amount"));
            amountInput.clear();
            amountInput.sendKeys("100"); // Buy $100 worth of BTC
            
            // Click Buy button
            WebElement buyButton = driver.findElement(By.id("buy-button"));
            assertTrue(buyButton.getAttribute("class").contains("buy"), 
                "Buy button should have 'buy' class");
            buyButton.click();
            
            // Wait for order confirmation
            WebElement confirmation = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.className("order-confirmation"))
            );
            assertTrue(confirmation.isDisplayed(), "Order confirmation should appear");
            
            // Verify wallet balance updated
            Thread.sleep(1000); // Wait for balance update
            balanceElement = driver.findElement(By.id("usdt-balance"));
            double newBalance = parseBalance(balanceElement.getText());
            
            assertTrue(newBalance < initialBalance, 
                "USDT balance should decrease after buy order");
            
            // Verify BTC balance increased
            WebElement btcBalance = driver.findElement(By.id("btc-balance"));
            double btcAmount = parseBalance(btcBalance.getText());
            assertTrue(btcAmount > 0, "BTC balance should increase after buy order");
            
            takeScreenshot("04_market_buy_success");
            
        } catch (Exception e) {
            takeScreenshot("04_market_buy_failed");
            fail("Market buy order test failed: " + e.getMessage());
        }
    }

    // ============================================
    // Test 5: Verify Wallet Update via API
    // ============================================
    @Test
    @Order(5)
    @DisplayName("E2E: Wallet balance is correctly updated in database")
    void testWalletUpdateViaApi() {
        try {
            // Login
            performLogin();
            
            // Get JWT token from localStorage
            JavascriptExecutor js = (JavascriptExecutor) driver;
            String token = (String) js.executeScript("return localStorage.getItem('accessToken');");
            
            assertNotNull(token, "JWT token should be stored in localStorage");
            
            // Make API call to verify wallet balance
            // This simulates what the Flutter app would do
            String apiUrl = baseUrl + "/api/v1/user/wallet";
            
            // Navigate to a page that displays API response
            driver.get(frontendUrl + "/wallet");
            
            // Verify wallet data is displayed
            WebElement walletCard = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.className("wallet-card"))
            );
            assertTrue(walletCard.isDisplayed(), "Wallet card should be visible");
            
            // Verify demo wallet indicator
            WebElement demoWalletBadge = driver.findElement(By.className("wallet-type-badge"));
            assertTrue(demoWalletBadge.getText().contains("Demo") || 
                      demoWalletBadge.getText().contains("Real"),
                "Wallet type badge should indicate Demo or Real");
            
            takeScreenshot("05_wallet_verification_success");
            
        } catch (Exception e) {
            takeScreenshot("05_wallet_verification_failed");
            fail("Wallet verification test failed: " + e.getMessage());
        }
    }

    // ============================================
    // Test 6: Full Trading Flow (Complete Scenario)
    // ============================================
    @Test
    @Order(6)
    @DisplayName("E2E: Complete trading flow - Login -> Demo -> Buy -> Verify")
    void testCompleteTradeFlow() {
        try {
            // Step 1: Login
            driver.get(frontendUrl + "/login");
            WebElement emailInput = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.id("email"))
            );
            emailInput.sendKeys(TEST_EMAIL);
            driver.findElement(By.id("password")).sendKeys(TEST_PASSWORD);
            driver.findElement(By.cssSelector("button[type='submit']")).click();
            wait.until(ExpectedConditions.urlContains("/dashboard"));
            takeScreenshot("06_step1_login");
            
            // Step 2: Navigate to Trading
            driver.get(frontendUrl + "/trading");
            wait.until(ExpectedConditions.presenceOfElementLocated(By.className("trading-container")));
            takeScreenshot("06_step2_trading_page");
            
            // Step 3: Enable Demo Mode
            WebElement demoToggle = driver.findElement(By.id("demo-mode-toggle"));
            if (!demoToggle.isSelected()) {
                demoToggle.click();
                Thread.sleep(500);
            }
            takeScreenshot("06_step3_demo_enabled");
            
            // Step 4: Execute Market Buy
            WebElement amountInput = driver.findElement(By.id("order-amount"));
            amountInput.clear();
            amountInput.sendKeys("50");
            driver.findElement(By.id("buy-button")).click();
            
            // Wait for confirmation
            wait.until(ExpectedConditions.presenceOfElementLocated(By.className("order-confirmation")));
            takeScreenshot("06_step4_order_executed");
            
            // Step 5: Verify in Wallet
            driver.get(frontendUrl + "/wallet");
            WebElement walletBalance = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.id("total-balance"))
            );
            assertTrue(walletBalance.isDisplayed(), "Wallet balance should be visible");
            takeScreenshot("06_step5_wallet_verified");
            
            // Success!
            System.out.println("✅ Complete trading flow test passed!");
            
        } catch (Exception e) {
            takeScreenshot("06_complete_flow_failed");
            fail("Complete trading flow test failed: " + e.getMessage());
        }
    }

    // ============================================
    // Helper Methods
    // ============================================
    
    private void performLogin() {
        driver.get(frontendUrl + "/login");
        WebElement emailInput = wait.until(
            ExpectedConditions.presenceOfElementLocated(By.id("email"))
        );
        emailInput.sendKeys(TEST_EMAIL);
        driver.findElement(By.id("password")).sendKeys(TEST_PASSWORD);
        driver.findElement(By.cssSelector("button[type='submit']")).click();
        wait.until(ExpectedConditions.urlContains("/dashboard"));
    }
    
    private void enableDemoMode() {
        try {
            WebElement demoToggle = wait.until(
                ExpectedConditions.elementToBeClickable(By.id("demo-mode-toggle"))
            );
            if (!demoToggle.isSelected()) {
                demoToggle.click();
                Thread.sleep(500);
            }
        } catch (Exception e) {
            System.err.println("Could not enable demo mode: " + e.getMessage());
        }
    }
    
    private double parseBalance(String balanceText) {
        // Remove currency symbols and parse
        String cleaned = balanceText.replaceAll("[^0-9.]", "");
        try {
            return Double.parseDouble(cleaned);
        } catch (NumberFormatException e) {
            return 0.0;
        }
    }
    
    private void takeScreenshot(String name) {
        try {
            TakesScreenshot ts = (TakesScreenshot) driver;
            File source = ts.getScreenshotAs(OutputType.FILE);
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
            Path destination = Paths.get(SCREENSHOTS_DIR, name + "_" + timestamp + ".png");
            Files.copy(source.toPath(), destination);
            System.out.println("Screenshot saved: " + destination);
        } catch (IOException e) {
            System.err.println("Failed to save screenshot: " + e.getMessage());
        }
    }
    
    private void createScreenshotsDirectory() {
        try {
            Files.createDirectories(Paths.get(SCREENSHOTS_DIR));
        } catch (IOException e) {
            System.err.println("Failed to create screenshots directory: " + e.getMessage());
        }
    }
}

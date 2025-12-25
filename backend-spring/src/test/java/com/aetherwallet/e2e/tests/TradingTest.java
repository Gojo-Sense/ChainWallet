package com.aetherwallet.e2e.tests;

import com.aetherwallet.e2e.base.BaseTest;
import com.aetherwallet.e2e.pages.LoginPage;
import org.junit.jupiter.api.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Selenium E2E Tests for Trading Functionality
 */
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@DisplayName("Trading E2E Tests")
public class TradingTest extends BaseTest {

    private static final String TEST_EMAIL = "test@gmail.com";
    private static final String TEST_PASSWORD = "test123456";

    private LoginPage loginPage;

    @BeforeEach
    void initPages() {
        loginPage = new LoginPage(driver, frontendUrl);
    }

    private void performLogin() {
        loginPage.navigate();
        loginPage.login(TEST_EMAIL, TEST_PASSWORD);
        wait.until(ExpectedConditions.urlContains("/dashboard"));
    }

    @Test
    @Order(1)
    @DisplayName("User can login and access dashboard")
    void testLoginAndDashboard() {
        try {
            performLogin();
            
            // Verify we're on dashboard
            assertTrue(driver.getCurrentUrl().contains("/dashboard"), 
                "Should be on dashboard after login");
            
            takeScreenshot("login_dashboard_success");
            
        } catch (Exception e) {
            takeScreenshot("login_dashboard_failed");
            fail("Login and dashboard test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(2)
    @DisplayName("User can navigate to Trading page")
    void testNavigateToTrading() {
        try {
            performLogin();
            
            // Navigate to trading page
            driver.get(frontendUrl + "/trading");
            
            // Wait for trading container
            wait.until(ExpectedConditions.presenceOfElementLocated(
                By.className("trading-container")
            ));
            
            assertTrue(driver.getCurrentUrl().contains("/trading"), 
                "Should be on trading page");
            
            takeScreenshot("trading_page_success");
            
        } catch (Exception e) {
            takeScreenshot("trading_page_failed");
            fail("Navigate to trading test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(3)
    @DisplayName("Trading page shows demo balance")
    void testTradingPageShowsBalance() {
        try {
            performLogin();
            driver.get(frontendUrl + "/trading");
            
            // Wait for balance display
            WebElement balanceElement = wait.until(
                ExpectedConditions.presenceOfElementLocated(By.xpath("//*[contains(text(), '$')]"))
            );
            
            assertNotNull(balanceElement, "Balance should be displayed");
            
            takeScreenshot("balance_displayed");
            
        } catch (Exception e) {
            takeScreenshot("balance_failed");
            fail("Balance display test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(4)
    @DisplayName("Trading page shows trading elements")
    void testTradingPageElements() {
        try {
            performLogin();
            driver.get(frontendUrl + "/trading");
            
            // Wait for trading container
            WebElement container = wait.until(
                ExpectedConditions.presenceOfElementLocated(
                    By.className("trading-container")
                )
            );
            
            assertTrue(container.isDisplayed(), "Trading container should be visible");
            
            takeScreenshot("trading_elements_success");
            
        } catch (Exception e) {
            takeScreenshot("trading_elements_failed");
            fail("Trading elements test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(5)
    @DisplayName("Complete flow - Login -> Dashboard -> Trading")
    void testCompleteFlow() {
        try {
            // Step 1: Login
            performLogin();
            takeScreenshot("flow_step1_login");
            
            // Step 2: Verify Dashboard
            assertTrue(driver.getCurrentUrl().contains("/dashboard"));
            takeScreenshot("flow_step2_dashboard");
            
            // Step 3: Navigate to Trading
            driver.get(frontendUrl + "/trading");
            WebElement container = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.className("trading-container")
            ));
            takeScreenshot("flow_step3_trading");
            
            // Step 4: Verify trading page loaded
            assertTrue(container.isDisplayed(), "Trading container should be visible");
            assertTrue(driver.getCurrentUrl().contains("/trading"));
            takeScreenshot("flow_step4_verified");
            
            System.out.println("✅ Complete flow test passed!");
            
        } catch (Exception e) {
            takeScreenshot("complete_flow_failed");
            fail("Complete flow test failed: " + e.getMessage());
        }
    }
}

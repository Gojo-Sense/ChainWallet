package com.aetherwallet.e2e.tests;

import com.aetherwallet.e2e.base.BaseTest;
import com.aetherwallet.e2e.pages.LoginPage;
import com.aetherwallet.e2e.pages.TradingPage;
import org.junit.jupiter.api.*;
import org.openqa.selenium.support.ui.ExpectedConditions;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Selenium E2E Tests for Trading Functionality
 */
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@DisplayName("Trading E2E Tests")
public class TradingTest extends BaseTest {

    private static final String TEST_EMAIL = "selenium-test@aetherwallet.com";
    private static final String TEST_PASSWORD = "TestPassword123!";

    private LoginPage loginPage;
    private TradingPage tradingPage;

    @BeforeEach
    void initPages() {
        loginPage = new LoginPage(driver, frontendUrl);
        tradingPage = new TradingPage(driver, frontendUrl);
    }

    private void performLogin() {
        loginPage.navigate();
        loginPage.login(TEST_EMAIL, TEST_PASSWORD);
        wait.until(ExpectedConditions.urlContains("/dashboard"));
    }

    @Test
    @Order(1)
    @DisplayName("User can toggle Demo Mode")
    void testToggleDemoMode() {
        try {
            performLogin();
            tradingPage.navigate();
            
            boolean initialState = tradingPage.isDemoModeEnabled();
            tradingPage.toggleDemoMode();
            sleep(500);
            
            boolean newState = tradingPage.isDemoModeEnabled();
            assertNotEquals(initialState, newState, "Demo mode should toggle");
            
            takeScreenshot("demo_mode_toggled");
            
        } catch (Exception e) {
            takeScreenshot("demo_mode_failed");
            fail("Demo mode toggle test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(2)
    @DisplayName("User can execute Market Buy order in Demo Mode")
    void testMarketBuyOrder() {
        try {
            performLogin();
            tradingPage.navigate();
            tradingPage.enableDemoMode();
            
            double initialBalance = tradingPage.getUsdtBalance();
            
            tradingPage.selectTradingPair("BTC/USDT");
            tradingPage.executeMarketBuy("100");
            
            assertTrue(tradingPage.isOrderConfirmationDisplayed(), 
                "Order confirmation should appear");
            
            sleep(1000);
            double newBalance = tradingPage.getUsdtBalance();
            assertTrue(newBalance < initialBalance, 
                "USDT balance should decrease after buy");
            
            takeScreenshot("market_buy_success");
            
        } catch (Exception e) {
            takeScreenshot("market_buy_failed");
            fail("Market buy test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(3)
    @DisplayName("User can execute Market Sell order in Demo Mode")
    void testMarketSellOrder() {
        try {
            performLogin();
            tradingPage.navigate();
            tradingPage.enableDemoMode();
            
            // First buy some BTC
            tradingPage.selectTradingPair("BTC/USDT");
            tradingPage.executeMarketBuy("100");
            sleep(1000);
            
            double btcBalance = tradingPage.getBtcBalance();
            
            // Now sell
            tradingPage.executeMarketSell("0.001");
            
            assertTrue(tradingPage.isOrderConfirmationDisplayed(), 
                "Order confirmation should appear");
            
            takeScreenshot("market_sell_success");
            
        } catch (Exception e) {
            takeScreenshot("market_sell_failed");
            fail("Market sell test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(4)
    @DisplayName("User can place Limit Buy order")
    void testLimitBuyOrder() {
        try {
            performLogin();
            tradingPage.navigate();
            tradingPage.enableDemoMode();
            
            tradingPage.selectTradingPair("BTC/USDT");
            tradingPage.executeLimitBuy("100", "45000");
            
            assertTrue(tradingPage.isOrderConfirmationDisplayed(), 
                "Order confirmation should appear");
            
            takeScreenshot("limit_buy_success");
            
        } catch (Exception e) {
            takeScreenshot("limit_buy_failed");
            fail("Limit buy test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(5)
    @DisplayName("Complete trading flow - Login -> Demo -> Buy -> Verify")
    void testCompleteTradingFlow() {
        try {
            // Step 1: Login
            performLogin();
            takeScreenshot("flow_step1_login");
            
            // Step 2: Navigate to Trading
            tradingPage.navigate();
            takeScreenshot("flow_step2_trading");
            
            // Step 3: Enable Demo Mode
            tradingPage.enableDemoMode();
            takeScreenshot("flow_step3_demo");
            
            // Step 4: Execute Market Buy
            double initialBalance = tradingPage.getUsdtBalance();
            tradingPage.selectTradingPair("BTC/USDT");
            tradingPage.executeMarketBuy("50");
            takeScreenshot("flow_step4_buy");
            
            // Step 5: Verify balance changed
            sleep(1000);
            double finalBalance = tradingPage.getUsdtBalance();
            assertTrue(finalBalance < initialBalance, 
                "Balance should decrease after trade");
            takeScreenshot("flow_step5_verified");
            
            System.out.println("✅ Complete trading flow test passed!");
            
        } catch (Exception e) {
            takeScreenshot("complete_flow_failed");
            fail("Complete trading flow test failed: " + e.getMessage());
        }
    }
}

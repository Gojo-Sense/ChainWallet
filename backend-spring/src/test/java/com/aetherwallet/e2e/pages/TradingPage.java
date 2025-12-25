package com.aetherwallet.e2e.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

/**
 * Page Object Model for Trading Page
 */
public class TradingPage {
    private final WebDriver driver;
    private final WebDriverWait wait;
    private final String baseUrl;

    @FindBy(id = "demo-mode-toggle")
    private WebElement demoModeToggle;

    @FindBy(className = "demo-mode-indicator")
    private WebElement demoModeIndicator;

    @FindBy(id = "trading-pair-selector")
    private WebElement pairSelector;

    @FindBy(id = "market-order-tab")
    private WebElement marketOrderTab;

    @FindBy(id = "limit-order-tab")
    private WebElement limitOrderTab;

    @FindBy(id = "order-amount")
    private WebElement amountInput;

    @FindBy(id = "order-price")
    private WebElement priceInput;

    @FindBy(id = "buy-button")
    private WebElement buyButton;

    @FindBy(id = "sell-button")
    private WebElement sellButton;

    @FindBy(id = "usdt-balance")
    private WebElement usdtBalance;

    @FindBy(id = "btc-balance")
    private WebElement btcBalance;

    @FindBy(className = "order-confirmation")
    private WebElement orderConfirmation;

    public TradingPage(WebDriver driver, String baseUrl) {
        this.driver = driver;
        this.baseUrl = baseUrl;
        this.wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        PageFactory.initElements(driver, this);
    }

    public void navigate() {
        driver.get(baseUrl + "/trading");
        wait.until(ExpectedConditions.presenceOfElementLocated(By.className("trading-container")));
    }

    public void toggleDemoMode() {
        wait.until(ExpectedConditions.elementToBeClickable(demoModeToggle));
        demoModeToggle.click();
    }

    public boolean isDemoModeEnabled() {
        try {
            return demoModeToggle.isSelected();
        } catch (Exception e) {
            return false;
        }
    }

    public void enableDemoMode() {
        if (!isDemoModeEnabled()) {
            toggleDemoMode();
        }
    }

    public void selectTradingPair(String pair) {
        pairSelector.click();
        WebElement option = wait.until(
            ExpectedConditions.elementToBeClickable(By.xpath("//option[@value='" + pair + "']"))
        );
        option.click();
    }

    public void selectMarketOrder() {
        marketOrderTab.click();
    }

    public void selectLimitOrder() {
        limitOrderTab.click();
    }

    public void enterAmount(String amount) {
        amountInput.clear();
        amountInput.sendKeys(amount);
    }

    public void enterPrice(String price) {
        priceInput.clear();
        priceInput.sendKeys(price);
    }

    public void clickBuy() {
        buyButton.click();
    }

    public void clickSell() {
        sellButton.click();
    }

    public void executeMarketBuy(String amount) {
        selectMarketOrder();
        enterAmount(amount);
        clickBuy();
    }

    public void executeMarketSell(String amount) {
        selectMarketOrder();
        enterAmount(amount);
        clickSell();
    }

    public void executeLimitBuy(String amount, String price) {
        selectLimitOrder();
        enterAmount(amount);
        enterPrice(price);
        clickBuy();
    }

    public boolean isOrderConfirmationDisplayed() {
        try {
            wait.until(ExpectedConditions.visibilityOf(orderConfirmation));
            return orderConfirmation.isDisplayed();
        } catch (Exception e) {
            return false;
        }
    }

    public double getUsdtBalance() {
        return parseBalance(usdtBalance.getText());
    }

    public double getBtcBalance() {
        return parseBalance(btcBalance.getText());
    }

    private double parseBalance(String balanceText) {
        String cleaned = balanceText.replaceAll("[^0-9.]", "");
        try {
            return Double.parseDouble(cleaned);
        } catch (NumberFormatException e) {
            return 0.0;
        }
    }
}

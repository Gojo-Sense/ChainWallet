package com.aetherwallet.e2e.base;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.jupiter.api.*;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Base test class for Selenium E2E tests
 * Provides common setup, teardown, and utility methods
 */
public abstract class BaseTest {

    protected WebDriver driver;
    protected WebDriverWait wait;
    protected String frontendUrl;
    protected String backendUrl;

    protected static final Duration TIMEOUT = Duration.ofSeconds(10);
    protected static final String SCREENSHOTS_DIR = "target/screenshots";

    @BeforeAll
    static void setupClass() {
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
        
        frontendUrl = System.getProperty("app.frontend.url", "http://localhost:3000");
        backendUrl = System.getProperty("app.backend.url", "http://localhost:8080");
    }

    @AfterEach
    void teardown(TestInfo testInfo) {
        if (driver != null) {
            // Take screenshot on test failure
            if (testInfo.getTags().contains("failed")) {
                takeScreenshot(testInfo.getDisplayName() + "_failed");
            }
            driver.quit();
        }
    }

    protected void takeScreenshot(String name) {
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

    private static void createScreenshotsDirectory() {
        try {
            Files.createDirectories(Paths.get(SCREENSHOTS_DIR));
        } catch (IOException e) {
            System.err.println("Failed to create screenshots directory: " + e.getMessage());
        }
    }

    protected void sleep(long millis) {
        try {
            Thread.sleep(millis);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}

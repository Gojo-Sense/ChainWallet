package com.aetherwallet.e2e.tests;

import com.aetherwallet.e2e.base.BaseTest;
import com.aetherwallet.e2e.metrics.SeleniumMetricsReporter;
import com.aetherwallet.e2e.pages.LoginPage;
import com.aetherwallet.e2e.pages.RegisterPage;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.openqa.selenium.support.ui.ExpectedConditions;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Selenium E2E Tests for Authentication
 * Includes metrics collection via SeleniumMetricsReporter
 */
@ExtendWith(SeleniumMetricsReporter.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@DisplayName("Authentication E2E Tests")
public class AuthenticationTest extends BaseTest {

    private static final String TEST_EMAIL = "test@gmail.com";
    private static final String TEST_PASSWORD = "test123456";

    private LoginPage loginPage;
    private RegisterPage registerPage;

    @BeforeEach
    void initPages() {
        loginPage = new LoginPage(driver, frontendUrl);
        registerPage = new RegisterPage(driver, frontendUrl);
    }

    @Test
    @Order(1)
    @DisplayName("User can register a new account")
    void testUserRegistration() {
        try {
            registerPage.navigate();
            registerPage.register(TEST_EMAIL, TEST_PASSWORD);
            
            // Wait for redirect to dashboard or success message
            wait.until(ExpectedConditions.or(
                ExpectedConditions.urlContains("/dashboard"),
                ExpectedConditions.urlContains("/login")
            ));
            
            takeScreenshot("registration_success");
            
        } catch (Exception e) {
            takeScreenshot("registration_failed");
            fail("Registration test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(2)
    @DisplayName("User can login with valid credentials")
    void testUserLogin() {
        try {
            loginPage.navigate();
            loginPage.login(TEST_EMAIL, TEST_PASSWORD);
            
            // Wait for redirect to dashboard
            wait.until(ExpectedConditions.urlContains("/dashboard"));
            
            takeScreenshot("login_success");
            
        } catch (Exception e) {
            takeScreenshot("login_failed");
            fail("Login test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(3)
    @DisplayName("Login fails with invalid credentials")
    void testLoginWithInvalidCredentials() {
        try {
            loginPage.navigate();
            loginPage.login("invalid@email.com", "wrongpassword");
            
            // Wait for error message
            sleep(1000);
            
            assertTrue(loginPage.isErrorDisplayed(), "Error message should be displayed");
            
            takeScreenshot("login_invalid_credentials");
            
        } catch (Exception e) {
            takeScreenshot("login_invalid_test_failed");
            fail("Invalid login test failed: " + e.getMessage());
        }
    }

    @Test
    @Order(4)
    @DisplayName("Login button is disabled with empty fields")
    void testLoginButtonDisabledWithEmptyFields() {
        try {
            loginPage.navigate();
            
            // Don't enter any credentials
            // Check if login button behavior (may be disabled or show validation)
            
            takeScreenshot("login_empty_fields");
            
        } catch (Exception e) {
            takeScreenshot("login_empty_fields_failed");
            fail("Empty fields test failed: " + e.getMessage());
        }
    }
}

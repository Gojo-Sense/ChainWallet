package com.aetherwallet.trading.config;

import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("JwtUtil Unit Tests")
class JwtUtilTest {

    private JwtUtil jwtUtil;
    private String testSecret = "test-secret-key-that-is-long-enough-for-hmac-sha256-algorithm";
    private String userId;
    private String email;

    @BeforeEach
    void setUp() {
        jwtUtil = new JwtUtil();
        ReflectionTestUtils.setField(jwtUtil, "secret", testSecret);
        ReflectionTestUtils.setField(jwtUtil, "jwtExpiration", 900000L); // 15 minutes
        ReflectionTestUtils.setField(jwtUtil, "refreshExpiration", 604800000L); // 7 days
        
        userId = UUID.randomUUID().toString();
        email = "test@example.com";
    }

    // ============================================
    // Token Generation Tests
    // ============================================

    @Test
    @DisplayName("Should generate valid access token")
    void generateToken_ValidInputs_ReturnsToken() {
        String token = jwtUtil.generateToken(userId, email);

        assertNotNull(token);
        assertFalse(token.isEmpty());
        assertTrue(token.split("\\.").length == 3); // JWT has 3 parts
    }

    @Test
    @DisplayName("Should generate valid refresh token")
    void generateRefreshToken_ValidUserId_ReturnsToken() {
        String token = jwtUtil.generateRefreshToken(userId);

        assertNotNull(token);
        assertFalse(token.isEmpty());
        assertTrue(token.split("\\.").length == 3);
    }

    @Test
    @DisplayName("Access and refresh tokens should be different")
    void generateTokens_SameUser_DifferentTokens() {
        String accessToken = jwtUtil.generateToken(userId, email);
        String refreshToken = jwtUtil.generateRefreshToken(userId);

        assertNotEquals(accessToken, refreshToken);
    }

    // ============================================
    // Token Extraction Tests
    // ============================================

    @Test
    @DisplayName("Should extract userId from token")
    void extractUserId_ValidToken_ReturnsUserId() {
        String token = jwtUtil.generateToken(userId, email);

        String extractedUserId = jwtUtil.extractUserId(token);

        assertEquals(userId, extractedUserId);
    }

    @Test
    @DisplayName("Should extract expiration from token")
    void extractExpiration_ValidToken_ReturnsExpiration() {
        String token = jwtUtil.generateToken(userId, email);

        var expiration = jwtUtil.extractExpiration(token);

        assertNotNull(expiration);
        assertTrue(expiration.getTime() > System.currentTimeMillis());
    }

    // ============================================
    // Token Validation Tests
    // ============================================

    @Test
    @DisplayName("Should validate valid token")
    void validateToken_ValidToken_ReturnsTrue() {
        String token = jwtUtil.generateToken(userId, email);

        boolean isValid = jwtUtil.validateToken(token);

        assertTrue(isValid);
    }

    @Test
    @DisplayName("Should validate token with userId")
    void validateToken_ValidTokenAndUserId_ReturnsTrue() {
        String token = jwtUtil.generateToken(userId, email);

        boolean isValid = jwtUtil.validateToken(token, userId);

        assertTrue(isValid);
    }

    @Test
    @DisplayName("Should fail validation with wrong userId")
    void validateToken_WrongUserId_ReturnsFalse() {
        String token = jwtUtil.generateToken(userId, email);
        String wrongUserId = UUID.randomUUID().toString();

        boolean isValid = jwtUtil.validateToken(token, wrongUserId);

        assertFalse(isValid);
    }

    @Test
    @DisplayName("Should fail validation with malformed token")
    void validateToken_MalformedToken_ReturnsFalse() {
        String malformedToken = "not.a.valid.token";

        boolean isValid = jwtUtil.validateToken(malformedToken);

        assertFalse(isValid);
    }

    @Test
    @DisplayName("Should fail validation with empty token")
    void validateToken_EmptyToken_ReturnsFalse() {
        boolean isValid = jwtUtil.validateToken("");

        assertFalse(isValid);
    }

    // ============================================
    // Expired Token Tests
    // ============================================

    @Test
    @DisplayName("Should detect expired token")
    void validateToken_ExpiredToken_ReturnsFalse() {
        // Create a JwtUtil with very short expiration
        JwtUtil shortExpiryJwtUtil = new JwtUtil();
        ReflectionTestUtils.setField(shortExpiryJwtUtil, "secret", testSecret);
        ReflectionTestUtils.setField(shortExpiryJwtUtil, "jwtExpiration", 1L); // 1ms
        ReflectionTestUtils.setField(shortExpiryJwtUtil, "refreshExpiration", 1L);

        String token = shortExpiryJwtUtil.generateToken(userId, email);

        // Wait for token to expire
        try {
            Thread.sleep(10);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        boolean isValid = shortExpiryJwtUtil.validateToken(token);

        assertFalse(isValid);
    }

    // ============================================
    // Edge Cases
    // ============================================

    @Test
    @DisplayName("Should handle null token gracefully")
    void validateToken_NullToken_ReturnsFalse() {
        boolean isValid = jwtUtil.validateToken(null);

        assertFalse(isValid);
    }

    @Test
    @DisplayName("Should generate different tokens for different users")
    void generateToken_DifferentUsers_DifferentTokens() {
        String token1 = jwtUtil.generateToken(userId, email);
        String token2 = jwtUtil.generateToken(UUID.randomUUID().toString(), "other@example.com");

        assertNotEquals(token1, token2);
    }

    @Test
    @DisplayName("Refresh token should have longer expiration than access token")
    void tokenExpiration_RefreshLongerThanAccess() {
        String accessToken = jwtUtil.generateToken(userId, email);
        String refreshToken = jwtUtil.generateRefreshToken(userId);

        var accessExpiration = jwtUtil.extractExpiration(accessToken);
        var refreshExpiration = jwtUtil.extractExpiration(refreshToken);

        assertTrue(refreshExpiration.after(accessExpiration));
    }
}

package com.aetherwallet.trading.service;

import com.aetherwallet.trading.config.JwtUtil;
import com.aetherwallet.trading.dto.AuthRequest;
import com.aetherwallet.trading.dto.AuthResponse;
import com.aetherwallet.trading.dto.RegisterRequest;
import com.aetherwallet.trading.entity.User;
import com.aetherwallet.trading.repository.UserRepository;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("AuthService Unit Tests")
class AuthServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private JwtUtil jwtUtil;

    @InjectMocks
    private AuthService authService;

    private User testUser;
    private UUID userId;

    @BeforeEach
    void setUp() {
        userId = UUID.randomUUID();
        testUser = User.builder()
            .id(userId)
            .email("test@example.com")
            .passwordHash("hashedPassword123")
            .firstName("Test")
            .lastName("User")
            .emailVerified(false)
            .build();
    }

    // ============================================
    // Login Tests
    // ============================================

    @Test
    @DisplayName("Should login successfully with valid credentials")
    void login_ValidCredentials_ReturnsAuthResponse() {
        AuthRequest request = new AuthRequest();
        request.setEmail("test@example.com");
        request.setPassword("password123");

        when(userRepository.findByEmail("test@example.com"))
            .thenReturn(Optional.of(testUser));
        when(passwordEncoder.matches("password123", "hashedPassword123"))
            .thenReturn(true);
        when(jwtUtil.generateToken(anyString(), anyString()))
            .thenReturn("access-token");
        when(jwtUtil.generateRefreshToken(anyString()))
            .thenReturn("refresh-token");

        AuthResponse response = authService.login(request);

        assertTrue(response.isSuccess());
        assertEquals("Authentication successful", response.getMessage());
        assertEquals("access-token", response.getAccessToken());
        assertEquals("refresh-token", response.getRefreshToken());
        assertNotNull(response.getUser());
        assertEquals("test@example.com", response.getUser().getEmail());
    }

    @Test
    @DisplayName("Should throw exception with non-existent email")
    void login_NonExistentEmail_ThrowsException() {
        AuthRequest request = new AuthRequest();
        request.setEmail("nonexistent@example.com");
        request.setPassword("password123");

        when(userRepository.findByEmail("nonexistent@example.com"))
            .thenReturn(Optional.empty());

        RuntimeException exception = assertThrows(RuntimeException.class, 
            () -> authService.login(request));
        assertEquals("Invalid email or password", exception.getMessage());
    }

    @Test
    @DisplayName("Should throw exception with wrong password")
    void login_WrongPassword_ThrowsException() {
        AuthRequest request = new AuthRequest();
        request.setEmail("test@example.com");
        request.setPassword("wrongpassword");

        when(userRepository.findByEmail("test@example.com"))
            .thenReturn(Optional.of(testUser));
        when(passwordEncoder.matches("wrongpassword", "hashedPassword123"))
            .thenReturn(false);

        RuntimeException exception = assertThrows(RuntimeException.class, 
            () -> authService.login(request));
        assertEquals("Invalid email or password", exception.getMessage());
    }

    // ============================================
    // Register Tests
    // ============================================

    @Test
    @DisplayName("Should register new user successfully")
    void register_NewUser_ReturnsAuthResponse() {
        RegisterRequest request = new RegisterRequest();
        request.setEmail("newuser@example.com");
        request.setPassword("password123");
        request.setFirstName("New");
        request.setLastName("User");

        when(userRepository.existsByEmail("newuser@example.com"))
            .thenReturn(false);
        when(passwordEncoder.encode("password123"))
            .thenReturn("encodedPassword");
        when(userRepository.save(any(User.class)))
            .thenAnswer(inv -> {
                User user = inv.getArgument(0);
                user.setId(UUID.randomUUID());
                return user;
            });
        when(jwtUtil.generateToken(anyString(), anyString()))
            .thenReturn("access-token");
        when(jwtUtil.generateRefreshToken(anyString()))
            .thenReturn("refresh-token");

        AuthResponse response = authService.register(request);

        assertTrue(response.isSuccess());
        assertEquals("access-token", response.getAccessToken());
        assertNotNull(response.getUser());
        verify(userRepository).save(any(User.class));
    }

    @Test
    @DisplayName("Should throw exception with existing email")
    void register_ExistingEmail_ThrowsException() {
        RegisterRequest request = new RegisterRequest();
        request.setEmail("test@example.com");
        request.setPassword("password123");

        when(userRepository.existsByEmail("test@example.com"))
            .thenReturn(true);

        RuntimeException exception = assertThrows(RuntimeException.class, 
            () -> authService.register(request));
        assertEquals("Email already exists", exception.getMessage());
        verify(userRepository, never()).save(any(User.class));
    }

    // ============================================
    // Refresh Token Tests
    // ============================================

    @Test
    @DisplayName("Should refresh token successfully")
    void refreshToken_ValidToken_ReturnsNewTokens() {
        String authHeader = "Bearer valid-refresh-token";

        when(jwtUtil.extractUserId("valid-refresh-token"))
            .thenReturn(userId.toString());
        when(jwtUtil.validateToken("valid-refresh-token"))
            .thenReturn(true);
        when(userRepository.findById(userId))
            .thenReturn(Optional.of(testUser));
        when(jwtUtil.generateToken(anyString(), anyString()))
            .thenReturn("new-access-token");
        when(jwtUtil.generateRefreshToken(anyString()))
            .thenReturn("new-refresh-token");

        AuthResponse response = authService.refreshToken(authHeader);

        assertTrue(response.isSuccess());
        assertEquals("new-access-token", response.getAccessToken());
        assertEquals("new-refresh-token", response.getRefreshToken());
    }

    @Test
    @DisplayName("Should throw exception with invalid token format")
    void refreshToken_InvalidTokenFormat_ThrowsException() {
        String authHeader = "invalid-token";

        RuntimeException exception = assertThrows(RuntimeException.class, 
            () -> authService.refreshToken(authHeader));
        assertEquals("Invalid refresh token", exception.getMessage());
    }

    @Test
    @DisplayName("Should throw exception when user not found")
    void refreshToken_UserNotFound_ThrowsException() {
        String authHeader = "Bearer valid-token";

        when(jwtUtil.extractUserId("valid-token"))
            .thenReturn(userId.toString());
        when(jwtUtil.validateToken("valid-token"))
            .thenReturn(true);
        when(userRepository.findById(userId))
            .thenReturn(Optional.empty());

        RuntimeException exception = assertThrows(RuntimeException.class, 
            () -> authService.refreshToken(authHeader));
        assertEquals("User not found", exception.getMessage());
    }

    // ============================================
    // Edge Cases
    // ============================================

    @Test
    @DisplayName("Should throw exception with null email in login")
    void login_NullEmail_ThrowsException() {
        AuthRequest request = new AuthRequest();
        request.setEmail(null);
        request.setPassword("password123");

        when(userRepository.findByEmail(null))
            .thenReturn(Optional.empty());

        assertThrows(RuntimeException.class, () -> authService.login(request));
    }

    @Test
    @DisplayName("Should throw exception with empty password in login")
    void login_EmptyPassword_ThrowsException() {
        AuthRequest request = new AuthRequest();
        request.setEmail("test@example.com");
        request.setPassword("");

        when(userRepository.findByEmail("test@example.com"))
            .thenReturn(Optional.of(testUser));
        when(passwordEncoder.matches("", "hashedPassword123"))
            .thenReturn(false);

        assertThrows(RuntimeException.class, () -> authService.login(request));
    }
}

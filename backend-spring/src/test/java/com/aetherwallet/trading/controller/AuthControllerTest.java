package com.aetherwallet.trading.controller;

import com.aetherwallet.trading.config.JwtAuthenticationFilter;
import com.aetherwallet.trading.config.JwtUtil;
import com.aetherwallet.trading.dto.AuthRequest;
import com.aetherwallet.trading.dto.AuthResponse;
import com.aetherwallet.trading.dto.RegisterRequest;
import com.aetherwallet.trading.service.AuthService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import java.util.UUID;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(controllers = AuthController.class)
@AutoConfigureMockMvc(addFilters = false)
@DisplayName("AuthController Unit Tests")
class AuthControllerTest {

    @MockBean
    private JwtUtil jwtUtil;

    @MockBean
    private JwtAuthenticationFilter jwtAuthenticationFilter;

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private AuthService authService;

    private AuthResponse successResponse;
    private AuthResponse failureResponse;

    @BeforeEach
    void setUp() {
        AuthResponse.UserDTO userDTO = AuthResponse.UserDTO.builder()
            .id(UUID.randomUUID().toString())
            .email("test@example.com")
            .firstName("Test")
            .lastName("User")
            .build();

        successResponse = AuthResponse.builder()
            .success(true)
            .message("Authentication successful")
            .accessToken("test-access-token")
            .refreshToken("test-refresh-token")
            .user(userDTO)
            .build();

        failureResponse = AuthResponse.builder()
            .success(false)
            .message("Invalid credentials")
            .build();
    }

    // ============================================
    // Login Endpoint Tests
    // ============================================

    @Test
    @DisplayName("POST /api/v1/auth/login - Success")
    void login_ValidCredentials_ReturnsOk() throws Exception {
        AuthRequest request = new AuthRequest();
        request.setEmail("test@example.com");
        request.setPassword("password123");

        when(authService.login(any(AuthRequest.class)))
            .thenReturn(successResponse);

        mockMvc.perform(post("/api/v1/auth/login")
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.success").value(true))
            .andExpect(jsonPath("$.accessToken").value("test-access-token"))
            .andExpect(jsonPath("$.refreshToken").value("test-refresh-token"))
            .andExpect(jsonPath("$.user.email").value("test@example.com"));
    }

    @Test
    @DisplayName("POST /api/v1/auth/login - Invalid Credentials throws exception")
    void login_InvalidCredentials_ReturnsUnauthorized() throws Exception {
        AuthRequest request = new AuthRequest();
        request.setEmail("test@example.com");
        request.setPassword("wrongpassword");

        when(authService.login(any(AuthRequest.class)))
            .thenThrow(new RuntimeException("Invalid email or password"));

        mockMvc.perform(post("/api/v1/auth/login")
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
            .andExpect(status().isUnauthorized());
    }

    @Test
    @DisplayName("POST /api/v1/auth/login - Missing Email")
    void login_MissingEmail_ReturnsBadRequest() throws Exception {
        String requestBody = "{\"password\":\"password123\"}";

        mockMvc.perform(post("/api/v1/auth/login")
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(requestBody))
            .andExpect(status().isBadRequest());
    }

    // ============================================
    // Register Endpoint Tests
    // ============================================

    @Test
    @DisplayName("POST /api/v1/auth/register - Success")
    void register_ValidRequest_ReturnsCreated() throws Exception {
        RegisterRequest request = new RegisterRequest();
        request.setEmail("newuser@example.com");
        request.setPassword("password123");
        request.setFirstName("New");
        request.setLastName("User");

        when(authService.register(any(RegisterRequest.class)))
            .thenReturn(successResponse);

        mockMvc.perform(post("/api/v1/auth/register")
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.success").value(true))
            .andExpect(jsonPath("$.accessToken").exists());
    }

    @Test
    @DisplayName("POST /api/v1/auth/register - Email Already Exists throws exception")
    void register_ExistingEmail_ReturnsBadRequest() throws Exception {
        RegisterRequest request = new RegisterRequest();
        request.setEmail("existing@example.com");
        request.setPassword("password123");

        when(authService.register(any(RegisterRequest.class)))
            .thenThrow(new RuntimeException("Email already exists"));

        mockMvc.perform(post("/api/v1/auth/register")
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
            .andExpect(status().isBadRequest());
    }

    // ============================================
    // Refresh Token Endpoint Tests
    // ============================================

    @Test
    @DisplayName("POST /api/v1/auth/refresh - Success")
    void refreshToken_ValidToken_ReturnsOk() throws Exception {
        when(authService.refreshToken("Bearer valid-refresh-token"))
            .thenReturn(successResponse);

        mockMvc.perform(post("/api/v1/auth/refresh")
                .with(csrf())
                .header("Authorization", "Bearer valid-refresh-token")
                .contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.success").value(true))
            .andExpect(jsonPath("$.accessToken").exists());
    }

    @Test
    @DisplayName("POST /api/v1/auth/refresh - Invalid Token throws exception")
    void refreshToken_InvalidToken_ReturnsUnauthorized() throws Exception {
        when(authService.refreshToken("Bearer invalid-token"))
            .thenThrow(new RuntimeException("Invalid refresh token"));

        mockMvc.perform(post("/api/v1/auth/refresh")
                .with(csrf())
                .header("Authorization", "Bearer invalid-token")
                .contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isUnauthorized());
    }

    // ============================================
    // Content Type Tests
    // ============================================

    @Test
    @DisplayName("POST /api/v1/auth/login - Wrong Content Type")
    void login_WrongContentType_ReturnsUnsupportedMediaType() throws Exception {
        mockMvc.perform(post("/api/v1/auth/login")
                .with(csrf())
                .contentType(MediaType.TEXT_PLAIN)
                .content("email=test@example.com&password=password123"))
            .andExpect(status().isUnsupportedMediaType());
    }
}

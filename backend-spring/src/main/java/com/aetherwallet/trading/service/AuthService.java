package com.aetherwallet.trading.service;

import com.aetherwallet.trading.config.JwtUtil;
import com.aetherwallet.trading.dto.AuthRequest;
import com.aetherwallet.trading.dto.AuthResponse;
import com.aetherwallet.trading.dto.RegisterRequest;
import com.aetherwallet.trading.entity.User;
import com.aetherwallet.trading.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;

    @Transactional
    public AuthResponse login(AuthRequest request) {
        Optional<User> userOpt = userRepository.findByEmail(request.getEmail());
        
        if (userOpt.isEmpty()) {
            log.warn("Login attempt with non-existent email: {}", request.getEmail());
            throw new RuntimeException("Invalid email or password");
        }
        
        User user = userOpt.get();
        
        if (!passwordEncoder.matches(request.getPassword(), user.getPasswordHash())) {
            log.warn("Login attempt with wrong password for email: {}", request.getEmail());
            throw new RuntimeException("Invalid email or password");
        }
        
        String accessToken = jwtUtil.generateToken(user.getId().toString(), user.getEmail());
        String refreshToken = jwtUtil.generateRefreshToken(user.getId().toString());
        
        log.info("User logged in successfully: {}", user.getEmail());
        
        return AuthResponse.success(
            accessToken,
            refreshToken,
            AuthResponse.UserDTO.builder()
                .id(user.getId().toString())
                .email(user.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .build()
        );
    }

    @Transactional
    public AuthResponse register(RegisterRequest request) {
        if (userRepository.existsByEmail(request.getEmail())) {
            log.warn("Registration attempt with existing email: {}", request.getEmail());
            throw new RuntimeException("Email already exists");
        }
        
        User user = User.builder()
            .email(request.getEmail())
            .passwordHash(passwordEncoder.encode(request.getPassword()))
            .firstName(request.getFirstName())
            .lastName(request.getLastName())
            .emailVerified(false)
            .build();
        
        user = userRepository.save(user);
        
        String accessToken = jwtUtil.generateToken(user.getId().toString(), user.getEmail());
        String refreshToken = jwtUtil.generateRefreshToken(user.getId().toString());
        
        log.info("User registered successfully: {}", user.getEmail());
        
        return AuthResponse.success(
            accessToken,
            refreshToken,
            AuthResponse.UserDTO.builder()
                .id(user.getId().toString())
                .email(user.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .build()
        );
    }

    public AuthResponse refreshToken(String authHeader) {
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            throw new RuntimeException("Invalid refresh token");
        }
        
        String refreshToken = authHeader.substring(7);
        String userId = jwtUtil.extractUserId(refreshToken);
        
        if (userId == null || !jwtUtil.validateToken(refreshToken)) {
            throw new RuntimeException("Invalid or expired refresh token");
        }
        
        User user = userRepository.findById(java.util.UUID.fromString(userId))
            .orElseThrow(() -> new RuntimeException("User not found"));
        
        String newAccessToken = jwtUtil.generateToken(user.getId().toString(), user.getEmail());
        String newRefreshToken = jwtUtil.generateRefreshToken(user.getId().toString());
        
        return AuthResponse.success(
            newAccessToken,
            newRefreshToken,
            AuthResponse.UserDTO.builder()
                .id(user.getId().toString())
                .email(user.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .build()
        );
    }
}

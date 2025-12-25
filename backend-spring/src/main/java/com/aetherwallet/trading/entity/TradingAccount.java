package com.aetherwallet.trading.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "trading_accounts")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TradingAccount {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
    @Column(name = "user_id", nullable = false, unique = true)
    private String userId; // Reference to user from Node.js backend
    
    @Column(name = "balance", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal balance = BigDecimal.ZERO;
    
    @Column(name = "available_balance", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal availableBalance = BigDecimal.ZERO;
    
    @Column(name = "locked_balance", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal lockedBalance = BigDecimal.ZERO;
    
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}








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
@Table(name = "portfolios", indexes = {
    @Index(name = "idx_user_pair", columnList = "user_id,trading_pair_id", unique = true)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Portfolio {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
    @Column(name = "user_id", nullable = false)
    private String userId;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trading_pair_id", nullable = false)
    private TradingPair tradingPair;
    
    @Column(name = "amount", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal amount = BigDecimal.ZERO;
    
    @Column(name = "average_buy_price", precision = 20, scale = 8)
    private BigDecimal averageBuyPrice;
    
    @Column(name = "total_cost", precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal totalCost = BigDecimal.ZERO;
    
    @Column(name = "current_value", precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal currentValue = BigDecimal.ZERO;
    
    @Column(name = "profit_loss", precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal profitLoss = BigDecimal.ZERO;
    
    @Column(name = "profit_loss_percentage", precision = 10, scale = 4)
    @Builder.Default
    private BigDecimal profitLossPercentage = BigDecimal.ZERO;
    
    @Column(name = "last_updated", nullable = false)
    private LocalDateTime lastUpdated;
    
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (lastUpdated == null) {
            lastUpdated = LocalDateTime.now();
        }
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
        lastUpdated = LocalDateTime.now();
    }
}








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
@Table(name = "trading_orders", indexes = {
    @Index(name = "idx_user_id", columnList = "user_id"),
    @Index(name = "idx_pair_status", columnList = "trading_pair_id,status"),
    @Index(name = "idx_created_at", columnList = "created_at")
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TradingOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
    @Column(name = "user_id", nullable = false)
    private String userId;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trading_pair_id", nullable = false)
    private TradingPair tradingPair;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "order_type", nullable = false, length = 20)
    private OrderType orderType; // MARKET, LIMIT, STOP_LOSS
    
    @Enumerated(EnumType.STRING)
    @Column(name = "side", nullable = false, length = 10)
    private OrderSide side; // BUY, SELL
    
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, length = 20)
    @Builder.Default
    private OrderStatus status = OrderStatus.PENDING;
    
    @Column(name = "amount", nullable = false, precision = 20, scale = 8)
    private BigDecimal amount;
    
    @Column(name = "price", nullable = false, precision = 20, scale = 8)
    private BigDecimal price;
    
    @Column(name = "filled_amount", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal filledAmount = BigDecimal.ZERO;
    
    @Column(name = "average_price", precision = 20, scale = 8)
    private BigDecimal averagePrice;
    
    @Column(name = "total_cost", precision = 20, scale = 8)
    private BigDecimal totalCost;
    
    @Column(name = "stop_price", precision = 20, scale = 8)
    private BigDecimal stopPrice; // For stop-loss orders
    
    @Column(name = "expires_at")
    private LocalDateTime expiresAt;
    
    @Column(name = "executed_at")
    private LocalDateTime executedAt;
    
    @Column(name = "cancelled_at")
    private LocalDateTime cancelledAt;
    
    @Column(name = "cancel_reason", length = 255)
    private String cancelReason;
    
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
    
    public enum OrderType {
        MARKET, LIMIT, STOP_LOSS
    }
    
    public enum OrderSide {
        BUY, SELL
    }
    
    public enum OrderStatus {
        PENDING, PARTIALLY_FILLED, FILLED, CANCELLED, EXPIRED, REJECTED
    }
}








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
@Table(name = "trades", indexes = {
    @Index(name = "idx_user_id", columnList = "user_id"),
    @Index(name = "idx_order_id", columnList = "order_id"),
    @Index(name = "idx_pair_created", columnList = "trading_pair_id,created_at")
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Trade {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
    @Column(name = "user_id", nullable = false)
    private String userId;
    
    @Column(name = "order_id", nullable = false)
    private UUID orderId;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trading_pair_id", nullable = false)
    private TradingPair tradingPair;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "side", nullable = false, length = 10)
    private OrderSide side; // BUY, SELL
    
    @Column(name = "amount", nullable = false, precision = 20, scale = 8)
    private BigDecimal amount;
    
    @Column(name = "price", nullable = false, precision = 20, scale = 8)
    private BigDecimal price;
    
    @Column(name = "total", nullable = false, precision = 20, scale = 8)
    private BigDecimal total; // amount * price
    
    @Column(name = "fee", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal fee = BigDecimal.ZERO;
    
    @Column(name = "fee_currency", length = 10)
    private String feeCurrency;
    
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (total == null && amount != null && price != null) {
            total = amount.multiply(price);
        }
    }
    
    public enum OrderSide {
        BUY, SELL
    }
}








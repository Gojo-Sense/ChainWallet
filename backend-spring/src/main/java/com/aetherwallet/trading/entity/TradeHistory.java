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
@Table(name = "trade_history", indexes = {
    @Index(name = "idx_user_created", columnList = "user_id,created_at"),
    @Index(name = "idx_pair_created", columnList = "trading_pair_id,created_at")
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TradeHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
    @Column(name = "user_id", nullable = false)
    private String userId;
    
    @Column(name = "trade_id", nullable = false)
    private UUID tradeId;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trading_pair_id", nullable = false)
    private TradingPair tradingPair;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "side", nullable = false, length = 10)
    private OrderSide side;
    
    @Column(name = "amount", nullable = false, precision = 20, scale = 8)
    private BigDecimal amount;
    
    @Column(name = "price", nullable = false, precision = 20, scale = 8)
    private BigDecimal price;
    
    @Column(name = "total", nullable = false, precision = 20, scale = 8)
    private BigDecimal total;
    
    @Column(name = "fee", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal fee = BigDecimal.ZERO;
    
    @Column(name = "portfolio_value_after", precision = 20, scale = 8)
    private BigDecimal portfolioValueAfter;
    
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
    
    public enum OrderSide {
        BUY, SELL
    }
}








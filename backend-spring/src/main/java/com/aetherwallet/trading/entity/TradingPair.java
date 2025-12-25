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
@Table(name = "trading_pairs")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TradingPair {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
    @Column(name = "symbol", nullable = false, unique = true, length = 20)
    private String symbol; // e.g., "BTC/USD", "ETH/USD"
    
    @Column(name = "base_currency", nullable = false, length = 10)
    private String baseCurrency; // e.g., "BTC", "ETH"
    
    @Column(name = "quote_currency", nullable = false, length = 10)
    private String quoteCurrency; // e.g., "USD"
    
    @Column(name = "name", nullable = false, length = 100)
    private String name; // e.g., "Bitcoin", "Ethereum"
    
    @Column(name = "current_price", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal currentPrice = BigDecimal.ZERO;
    
    @Column(name = "change_24h", nullable = false, precision = 10, scale = 4)
    @Builder.Default
    private BigDecimal change24h = BigDecimal.ZERO;
    
    @Column(name = "volume_24h", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal volume24h = BigDecimal.ZERO;
    
    @Column(name = "is_active", nullable = false)
    @Builder.Default
    private Boolean isActive = true;
    
    @Column(name = "price_precision", nullable = false)
    @Builder.Default
    private Integer pricePrecision = 8;
    
    @Column(name = "amount_precision", nullable = false)
    @Builder.Default
    private Integer amountPrecision = 8;
    
    @Column(name = "min_order_amount", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal minOrderAmount = BigDecimal.valueOf(0.0001);
    
    @Column(name = "max_order_amount", nullable = false, precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal maxOrderAmount = BigDecimal.valueOf(1000000);
    
    @Column(name = "last_price_update", nullable = false)
    private LocalDateTime lastPriceUpdate;
    
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (lastPriceUpdate == null) {
            lastPriceUpdate = LocalDateTime.now();
        }
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}








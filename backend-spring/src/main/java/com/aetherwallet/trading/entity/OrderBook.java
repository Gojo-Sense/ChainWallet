package com.aetherwallet.trading.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "order_books", indexes = {
    @Index(name = "idx_pair_created", columnList = "trading_pair_id,created_at")
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderBook {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trading_pair_id", nullable = false)
    private TradingPair tradingPair;
    
    @Column(name = "bids_json", columnDefinition = "TEXT")
    private String bidsJson; // JSON array of bid orders
    
    @Column(name = "asks_json", columnDefinition = "TEXT")
    private String asksJson; // JSON array of ask orders
    
    @Column(name = "best_bid_price", precision = 20, scale = 8)
    private java.math.BigDecimal bestBidPrice;
    
    @Column(name = "best_ask_price", precision = 20, scale = 8)
    private java.math.BigDecimal bestAskPrice;
    
    @Column(name = "spread", precision = 20, scale = 8)
    private java.math.BigDecimal spread;
    
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}








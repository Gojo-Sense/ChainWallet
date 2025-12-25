package com.aetherwallet.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Transaction Entity - Records all trading activities
 * Compatible with Flutter mobile app and React web app
 */
@Entity
@Table(name = "transactions", indexes = {
    @Index(name = "idx_tx_user_id", columnList = "user_id"),
    @Index(name = "idx_tx_wallet_id", columnList = "wallet_id"),
    @Index(name = "idx_tx_type", columnList = "type"),
    @Index(name = "idx_tx_status", columnList = "status"),
    @Index(name = "idx_tx_created_at", columnList = "created_at")
})
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id", updatable = false, nullable = false)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "wallet_id", nullable = false)
    private Wallet wallet;

    @Enumerated(EnumType.STRING)
    @Column(name = "type", nullable = false)
    private TransactionType type;

    @Enumerated(EnumType.STRING)
    @Column(name = "order_type")
    private OrderType orderType;

    @Column(name = "from_currency", length = 20, nullable = false)
    private String fromCurrency;

    @Column(name = "to_currency", length = 20, nullable = false)
    private String toCurrency;

    @Column(name = "amount", precision = 20, scale = 8, nullable = false)
    private BigDecimal amount;

    @Column(name = "price", precision = 20, scale = 8)
    private BigDecimal price;

    @Column(name = "total_value", precision = 20, scale = 8)
    private BigDecimal totalValue;

    @Column(name = "fee", precision = 20, scale = 8)
    @Builder.Default
    private BigDecimal fee = BigDecimal.ZERO;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    @Builder.Default
    private TransactionStatus status = TransactionStatus.PENDING;

    @Column(name = "is_demo", nullable = false)
    @Builder.Default
    private Boolean isDemo = false;

    @Column(name = "tx_hash", length = 100)
    private String txHash;

    @Column(name = "notes", length = 500)
    private String notes;

    @Column(name = "ip_address", length = 45)
    private String ipAddress;

    @Column(name = "user_agent", length = 500)
    private String userAgent;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "executed_at")
    private LocalDateTime executedAt;

    // ============================================
    // Enums
    // ============================================

    public enum TransactionType {
        BUY,
        SELL,
        DEPOSIT,
        WITHDRAWAL,
        TRANSFER,
        SWAP
    }

    public enum OrderType {
        MARKET,
        LIMIT,
        STOP_LOSS,
        TAKE_PROFIT
    }

    public enum TransactionStatus {
        PENDING,
        PROCESSING,
        COMPLETED,
        FAILED,
        CANCELLED
    }

    // ============================================
    // Business Methods
    // ============================================

    public void markCompleted() {
        this.status = TransactionStatus.COMPLETED;
        this.executedAt = LocalDateTime.now();
    }

    public void markFailed(String reason) {
        this.status = TransactionStatus.FAILED;
        this.notes = reason;
    }

    public void markCancelled(String reason) {
        this.status = TransactionStatus.CANCELLED;
        this.notes = reason;
    }

    public BigDecimal getNetAmount() {
        return amount.subtract(fee != null ? fee : BigDecimal.ZERO);
    }

    public String getTradingPair() {
        return fromCurrency + "/" + toCurrency;
    }

    // ============================================
    // Factory Methods
    // ============================================

    public static Transaction createBuyOrder(User user, Wallet wallet, String baseCurrency, 
                                              String quoteCurrency, BigDecimal amount, 
                                              BigDecimal price, OrderType orderType) {
        return Transaction.builder()
            .user(user)
            .wallet(wallet)
            .type(TransactionType.BUY)
            .orderType(orderType)
            .fromCurrency(quoteCurrency)
            .toCurrency(baseCurrency)
            .amount(amount)
            .price(price)
            .totalValue(amount.multiply(price))
            .isDemo(wallet.getIsDemo())
            .status(TransactionStatus.PENDING)
            .build();
    }

    public static Transaction createSellOrder(User user, Wallet wallet, String baseCurrency,
                                               String quoteCurrency, BigDecimal amount,
                                               BigDecimal price, OrderType orderType) {
        return Transaction.builder()
            .user(user)
            .wallet(wallet)
            .type(TransactionType.SELL)
            .orderType(orderType)
            .fromCurrency(baseCurrency)
            .toCurrency(quoteCurrency)
            .amount(amount)
            .price(price)
            .totalValue(amount.multiply(price))
            .isDemo(wallet.getIsDemo())
            .status(TransactionStatus.PENDING)
            .build();
    }
}

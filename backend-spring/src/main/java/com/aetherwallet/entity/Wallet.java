package com.aetherwallet.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Wallet Entity - Supports both Demo and Real wallets
 * Compatible with Flutter mobile app and React web app
 * 
 * API Endpoint: GET /api/v1/user/wallet
 */
@Entity
@Table(name = "wallets", indexes = {
    @Index(name = "idx_wallet_user_id", columnList = "user_id"),
    @Index(name = "idx_wallet_is_demo", columnList = "is_demo"),
    @Index(name = "idx_wallet_user_demo", columnList = "user_id, is_demo")
})
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Wallet {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id", updatable = false, nullable = false)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "balance_usdt", precision = 20, scale = 8, nullable = false)
    @Builder.Default
    private BigDecimal balanceUsdt = BigDecimal.ZERO;

    @Column(name = "balance_btc", precision = 20, scale = 8, nullable = false)
    @Builder.Default
    private BigDecimal balanceBtc = BigDecimal.ZERO;

    @Column(name = "balance_eth", precision = 20, scale = 8, nullable = false)
    @Builder.Default
    private BigDecimal balanceEth = BigDecimal.ZERO;

    @Column(name = "balance_bnb", precision = 20, scale = 8, nullable = false)
    @Builder.Default
    private BigDecimal balanceBnb = BigDecimal.ZERO;

    @Column(name = "balance_sol", precision = 20, scale = 8, nullable = false)
    @Builder.Default
    private BigDecimal balanceSol = BigDecimal.ZERO;

    @Column(name = "is_demo", nullable = false)
    @Builder.Default
    private Boolean isDemo = false;

    @Column(name = "is_active", nullable = false)
    @Builder.Default
    private Boolean isActive = true;

    @Column(name = "wallet_address", length = 100)
    private String walletAddress;

    @Column(name = "network", length = 50)
    @Builder.Default
    private String network = "ethereum";

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Version
    @Column(name = "version")
    private Long version;

    // ============================================
    // Business Methods
    // ============================================

    /**
     * Get balance for a specific currency
     */
    public BigDecimal getBalance(String currency) {
        return switch (currency.toUpperCase()) {
            case "USDT" -> balanceUsdt;
            case "BTC" -> balanceBtc;
            case "ETH" -> balanceEth;
            case "BNB" -> balanceBnb;
            case "SOL" -> balanceSol;
            default -> BigDecimal.ZERO;
        };
    }

    /**
     * Update balance for a specific currency
     */
    public void updateBalance(String currency, BigDecimal amount) {
        switch (currency.toUpperCase()) {
            case "USDT" -> this.balanceUsdt = amount;
            case "BTC" -> this.balanceBtc = amount;
            case "ETH" -> this.balanceEth = amount;
            case "BNB" -> this.balanceBnb = amount;
            case "SOL" -> this.balanceSol = amount;
        }
    }

    /**
     * Add to balance for a specific currency
     */
    public void addBalance(String currency, BigDecimal amount) {
        BigDecimal current = getBalance(currency);
        updateBalance(currency, current.add(amount));
    }

    /**
     * Subtract from balance for a specific currency
     */
    public void subtractBalance(String currency, BigDecimal amount) {
        BigDecimal current = getBalance(currency);
        if (current.compareTo(amount) < 0) {
            throw new IllegalArgumentException("Insufficient balance for " + currency);
        }
        updateBalance(currency, current.subtract(amount));
    }

    /**
     * Check if wallet has sufficient balance
     */
    public boolean hasSufficientBalance(String currency, BigDecimal amount) {
        return getBalance(currency).compareTo(amount) >= 0;
    }

    /**
     * Calculate total portfolio value in USDT
     */
    public BigDecimal getTotalValueUsdt(BigDecimal btcPrice, BigDecimal ethPrice, 
                                         BigDecimal bnbPrice, BigDecimal solPrice) {
        return balanceUsdt
            .add(balanceBtc.multiply(btcPrice))
            .add(balanceEth.multiply(ethPrice))
            .add(balanceBnb.multiply(bnbPrice))
            .add(balanceSol.multiply(solPrice));
    }

    /**
     * Reset demo wallet to initial balance
     */
    public void resetDemoWallet() {
        if (Boolean.TRUE.equals(isDemo)) {
            this.balanceUsdt = new BigDecimal("10000.00");
            this.balanceBtc = BigDecimal.ZERO;
            this.balanceEth = BigDecimal.ZERO;
            this.balanceBnb = BigDecimal.ZERO;
            this.balanceSol = BigDecimal.ZERO;
        }
    }

    /**
     * Create a new demo wallet with initial balance
     */
    public static Wallet createDemoWallet(User user) {
        return Wallet.builder()
            .user(user)
            .isDemo(true)
            .balanceUsdt(new BigDecimal("10000.00"))
            .balanceBtc(BigDecimal.ZERO)
            .balanceEth(BigDecimal.ZERO)
            .balanceBnb(BigDecimal.ZERO)
            .balanceSol(BigDecimal.ZERO)
            .isActive(true)
            .network("demo")
            .build();
    }

    /**
     * Create a new real wallet
     */
    public static Wallet createRealWallet(User user, String walletAddress) {
        return Wallet.builder()
            .user(user)
            .isDemo(false)
            .walletAddress(walletAddress)
            .balanceUsdt(BigDecimal.ZERO)
            .balanceBtc(BigDecimal.ZERO)
            .balanceEth(BigDecimal.ZERO)
            .balanceBnb(BigDecimal.ZERO)
            .balanceSol(BigDecimal.ZERO)
            .isActive(true)
            .network("ethereum")
            .build();
    }
}

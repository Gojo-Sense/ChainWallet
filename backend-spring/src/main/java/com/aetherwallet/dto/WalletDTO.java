package com.aetherwallet.dto;

import com.aetherwallet.entity.Wallet;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Wallet DTO - Cross-platform response format for Flutter and React
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WalletDTO {

    private UUID id;
    private UUID userId;
    private BigDecimal balanceUsdt;
    private BigDecimal balanceBtc;
    private BigDecimal balanceEth;
    private BigDecimal balanceBnb;
    private BigDecimal balanceSol;
    private Boolean isDemo;
    private Boolean isActive;
    private String walletAddress;
    private String network;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    // Portfolio values (calculated with current prices)
    private BigDecimal totalValueUsdt;
    private BigDecimal btcValueUsdt;
    private BigDecimal ethValueUsdt;
    private BigDecimal bnbValueUsdt;
    private BigDecimal solValueUsdt;
    
    // Current prices (for display)
    private BigDecimal btcPrice;
    private BigDecimal ethPrice;
    private BigDecimal bnbPrice;
    private BigDecimal solPrice;

    public static WalletDTO fromEntity(Wallet wallet) {
        return WalletDTO.builder()
            .id(wallet.getId())
            .userId(wallet.getUser().getId())
            .balanceUsdt(wallet.getBalanceUsdt())
            .balanceBtc(wallet.getBalanceBtc())
            .balanceEth(wallet.getBalanceEth())
            .balanceBnb(wallet.getBalanceBnb())
            .balanceSol(wallet.getBalanceSol())
            .isDemo(wallet.getIsDemo())
            .isActive(wallet.getIsActive())
            .walletAddress(wallet.getWalletAddress())
            .network(wallet.getNetwork())
            .createdAt(wallet.getCreatedAt())
            .updatedAt(wallet.getUpdatedAt())
            .build();
    }

    public WalletDTO withPrices(BigDecimal btcPrice, BigDecimal ethPrice, 
                                 BigDecimal bnbPrice, BigDecimal solPrice) {
        this.btcPrice = btcPrice;
        this.ethPrice = ethPrice;
        this.bnbPrice = bnbPrice;
        this.solPrice = solPrice;
        
        this.btcValueUsdt = balanceBtc.multiply(btcPrice);
        this.ethValueUsdt = balanceEth.multiply(ethPrice);
        this.bnbValueUsdt = balanceBnb.multiply(bnbPrice);
        this.solValueUsdt = balanceSol.multiply(solPrice);
        
        this.totalValueUsdt = balanceUsdt
            .add(btcValueUsdt)
            .add(ethValueUsdt)
            .add(bnbValueUsdt)
            .add(solValueUsdt);
        
        return this;
    }
}

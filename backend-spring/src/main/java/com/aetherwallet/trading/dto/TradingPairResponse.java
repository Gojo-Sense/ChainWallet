package com.aetherwallet.trading.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TradingPairResponse {
    private UUID id;
    private String symbol;
    private String baseCurrency;
    private String quoteCurrency;
    private String name;
    private BigDecimal currentPrice;
    private BigDecimal change24h;
    private BigDecimal volume24h;
    private Boolean isActive;
    private Integer pricePrecision;
    private Integer amountPrecision;
    private BigDecimal minOrderAmount;
    private BigDecimal maxOrderAmount;
}








package com.aetherwallet.trading.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PriceUpdateMessage {
    private String symbol;
    private BigDecimal price;
    private BigDecimal change24h;
    private BigDecimal volume24h;
    private Long timestamp;
}








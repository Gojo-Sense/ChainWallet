package com.aetherwallet.trading.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TradeResponse {
    private UUID id;
    private UUID orderId;
    private String symbol;
    private String side;
    private BigDecimal amount;
    private BigDecimal price;
    private BigDecimal total;
    private BigDecimal fee;
    private String feeCurrency;
    private LocalDateTime createdAt;
}








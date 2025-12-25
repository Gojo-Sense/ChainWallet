package com.aetherwallet.trading.dto;

import lombok.Builder;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Builder
public class DemoTradeResponse {
    private String id;
    private String symbol;
    private String side; // BUY or SELL
    private String orderType; // MARKET, LIMIT, STOP_LOSS
    private BigDecimal amount;
    private BigDecimal price;
    private BigDecimal totalPrice;
    private String status; // EXECUTED, PENDING, CANCELLED
    private LocalDateTime executedAt;
    private BigDecimal profitLoss;
    private BigDecimal profitLossPercentage;
}
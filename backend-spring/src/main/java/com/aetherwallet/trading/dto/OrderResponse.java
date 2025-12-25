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
public class OrderResponse {
    private UUID id;
    private String symbol;
    private String orderType;
    private String side;
    private String status;
    private BigDecimal amount;
    private BigDecimal price;
    private BigDecimal filledAmount;
    private BigDecimal averagePrice;
    private BigDecimal totalCost;
    private BigDecimal stopPrice;
    private LocalDateTime expiresAt;
    private LocalDateTime executedAt;
    private LocalDateTime cancelledAt;
    private String cancelReason;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}








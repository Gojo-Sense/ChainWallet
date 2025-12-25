package com.aetherwallet.trading.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class CreateOrderRequest {
    @NotBlank(message = "Trading pair symbol is required")
    private String symbol; // e.g., "BTC/USD"
    
    @NotNull(message = "Order type is required")
    private String orderType; // MARKET, LIMIT, STOP_LOSS
    
    @NotNull(message = "Side is required")
    private String side; // BUY, SELL
    
    @NotNull(message = "Amount is required")
    @DecimalMin(value = "0.0001", message = "Amount must be at least 0.0001")
    private BigDecimal amount;
    
    @DecimalMin(value = "0.0001", message = "Price must be at least 0.0001")
    private BigDecimal price; // Required for LIMIT and STOP_LOSS orders
    
    private BigDecimal stopPrice; // Required for STOP_LOSS orders
    
    private Long expiresInMinutes; // Optional expiration time
}








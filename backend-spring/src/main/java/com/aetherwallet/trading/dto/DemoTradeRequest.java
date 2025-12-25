package com.aetherwallet.trading.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import java.math.BigDecimal;

@Data
public class DemoTradeRequest {
    @NotBlank
    private String symbol;
    
    @NotNull
    private TradeSide side; // BUY or SELL
    
    @NotNull
    @DecimalMin(value = "0.0001", message = "Amount must be greater than 0.0001")
    private BigDecimal amount;
    
    @DecimalMin(value = "0.01", message = "Price must be greater than 0.01")
    private BigDecimal price; // For limit orders
    
    @NotNull
    private OrderType orderType; // MARKET, LIMIT, STOP_LOSS
    
    public enum TradeSide {
        BUY, SELL
    }
    
    public enum OrderType {
        MARKET, LIMIT, STOP_LOSS
    }
}
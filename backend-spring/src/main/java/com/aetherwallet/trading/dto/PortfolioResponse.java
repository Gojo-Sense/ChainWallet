package com.aetherwallet.trading.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PortfolioResponse {
    private BigDecimal totalValue;
    private BigDecimal totalProfitLoss;
    private BigDecimal totalProfitLossPercentage;
    private List<PortfolioItem> holdings;
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class PortfolioItem {
        private String symbol;
        private String name;
        private BigDecimal amount;
        private BigDecimal averageBuyPrice;
        private BigDecimal currentPrice;
        private BigDecimal currentValue;
        private BigDecimal profitLoss;
        private BigDecimal profitLossPercentage;
    }
}








package com.aetherwallet.trading.dto;

import lombok.Builder;
import lombok.Data;
import java.math.BigDecimal;

@Data
@Builder
public class DemoPerformanceResponse {
    private int totalTrades;
    private int profitableTrades;
    private int lossMakingTrades;
    private BigDecimal totalProfitLoss;
    private BigDecimal totalProfitLossPercentage;
    private BigDecimal winRate;
    private BigDecimal avgProfitPerTrade;
    private BigDecimal avgLossPerTrade;
    private boolean passedDemo; // True if user has passed demo requirements
    private String certificationMessage; // Message for passing/failing
}
package com.aetherwallet.trading.service;

import com.aetherwallet.trading.dto.DemoPerformanceResponse;
import com.aetherwallet.trading.dto.DemoTradeRequest;
import com.aetherwallet.trading.dto.DemoTradeResponse;
import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.TradingPairRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

@Service
@RequiredArgsConstructor
public class DemoTradingService {
    
    private final TradingPairRepository tradingPairRepository;
    
    // In-memory storage for demo trades (in a real app, this would be stored in a database)
    private final Map<String, List<DemoTrade>> userDemoTrades = new ConcurrentHashMap<>();
    
    // Demo account starting balance
    private static final BigDecimal DEMO_STARTING_BALANCE = new BigDecimal("10000.00");
    
    public DemoTradeResponse executeDemoTrade(String userId, DemoTradeRequest request) {
        // Get the trading pair
        TradingPair tradingPair = tradingPairRepository.findBySymbol(request.getSymbol())
                .orElseThrow(() -> new IllegalArgumentException("Invalid trading pair: " + request.getSymbol()));
        
        // Create a demo trade
        DemoTrade demoTrade = new DemoTrade();
        demoTrade.setId(UUID.randomUUID().toString());
        demoTrade.setUserId(userId);
        demoTrade.setSymbol(request.getSymbol());
        demoTrade.setSide(request.getSide().name());
        demoTrade.setOrderType(request.getOrderType().name());
        demoTrade.setAmount(request.getAmount());
        
        // Set price based on order type
        BigDecimal price;
        if (DemoTradeRequest.OrderType.MARKET.equals(request.getOrderType())) {
            price = tradingPair.getCurrentPrice();
        } else {
            price = request.getPrice();
        }
        demoTrade.setPrice(price);
        
        // Calculate total price
        BigDecimal totalPrice = request.getAmount().multiply(price);
        demoTrade.setTotalPrice(totalPrice);
        demoTrade.setStatus("EXECUTED");
        demoTrade.setExecutedAt(LocalDateTime.now());
        
        // For demo purposes, we'll simulate profit/loss calculation
        // In a real implementation, this would be based on actual market movements
        BigDecimal profitLoss = calculateSimulatedProfitLoss(demoTrade);
        demoTrade.setProfitLoss(profitLoss);
        
        // Calculate profit/loss percentage
        if (totalPrice.compareTo(BigDecimal.ZERO) > 0) {
            BigDecimal profitLossPercentage = profitLoss.multiply(new BigDecimal("100"))
                    .divide(totalPrice, 2, RoundingMode.HALF_UP);
            demoTrade.setProfitLossPercentage(profitLossPercentage);
        } else {
            demoTrade.setProfitLossPercentage(BigDecimal.ZERO);
        }
        
        // Store the demo trade
        userDemoTrades.computeIfAbsent(userId, k -> new ArrayList<>()).add(demoTrade);
        
        // Convert to response DTO
        return DemoTradeResponse.builder()
                .id(demoTrade.getId())
                .symbol(demoTrade.getSymbol())
                .side(demoTrade.getSide())
                .orderType(demoTrade.getOrderType())
                .amount(demoTrade.getAmount())
                .price(demoTrade.getPrice())
                .totalPrice(demoTrade.getTotalPrice())
                .status(demoTrade.getStatus())
                .executedAt(demoTrade.getExecutedAt())
                .profitLoss(demoTrade.getProfitLoss())
                .profitLossPercentage(demoTrade.getProfitLossPercentage())
                .build();
    }
    
    public DemoPerformanceResponse getDemoPerformance(String userId) {
        List<DemoTrade> trades = userDemoTrades.getOrDefault(userId, new ArrayList<>());
        
        int totalTrades = trades.size();
        int profitableTrades = 0;
        int lossMakingTrades = 0;
        BigDecimal totalProfitLoss = BigDecimal.ZERO;
        
        for (DemoTrade trade : trades) {
            totalProfitLoss = totalProfitLoss.add(trade.getProfitLoss());
            if (trade.getProfitLoss().compareTo(BigDecimal.ZERO) > 0) {
                profitableTrades++;
            } else if (trade.getProfitLoss().compareTo(BigDecimal.ZERO) < 0) {
                lossMakingTrades++;
            }
        }
        
        BigDecimal winRate = totalTrades > 0 
                ? new BigDecimal(profitableTrades).multiply(new BigDecimal("100"))
                    .divide(new BigDecimal(totalTrades), 2, RoundingMode.HALF_UP)
                : BigDecimal.ZERO;
        
        BigDecimal avgProfitPerTrade = profitableTrades > 0 
                ? totalProfitLoss.max(BigDecimal.ZERO)
                    .divide(new BigDecimal(profitableTrades), 2, RoundingMode.HALF_UP)
                : BigDecimal.ZERO;
        
        BigDecimal avgLossPerTrade = lossMakingTrades > 0 
                ? totalProfitLoss.min(BigDecimal.ZERO).abs()
                    .divide(new BigDecimal(lossMakingTrades), 2, RoundingMode.HALF_UP)
                : BigDecimal.ZERO;
        
        // Calculate total profit/loss percentage based on starting balance
        BigDecimal totalProfitLossPercentage = totalProfitLoss.multiply(new BigDecimal("100"))
                .divide(DEMO_STARTING_BALANCE, 2, RoundingMode.HALF_UP);
        
        // Check if user has passed demo requirements
        // Requirements: At least 10 trades, win rate >= 50%, positive total profit/loss
        boolean passedDemo = totalTrades >= 10 && 
                winRate.compareTo(new BigDecimal("50")) >= 0 && 
                totalProfitLoss.compareTo(BigDecimal.ZERO) > 0;
        
        String certificationMessage = passedDemo 
                ? "Congratulations! You have successfully completed the demo trading challenge." 
                : "Keep practicing! You need at least 10 trades with a 50%+ win rate and positive overall returns.";
        
        return DemoPerformanceResponse.builder()
                .totalTrades(totalTrades)
                .profitableTrades(profitableTrades)
                .lossMakingTrades(lossMakingTrades)
                .totalProfitLoss(totalProfitLoss)
                .totalProfitLossPercentage(totalProfitLossPercentage)
                .winRate(winRate)
                .avgProfitPerTrade(avgProfitPerTrade)
                .avgLossPerTrade(avgLossPerTrade)
                .passedDemo(passedDemo)
                .certificationMessage(certificationMessage)
                .build();
    }
    
    private BigDecimal calculateSimulatedProfitLoss(DemoTrade trade) {
        // This is a simplified simulation - in a real implementation, this would be more complex
        // For demo purposes, we'll generate random profit/loss between -5% and +5%
        double randomFactor = (Math.random() * 0.10) - 0.05; // Between -0.05 and +0.05
        BigDecimal randomMultiplier = new BigDecimal(String.valueOf(1 + randomFactor));
        BigDecimal simulatedValue = trade.getTotalPrice().multiply(randomMultiplier);
        return simulatedValue.subtract(trade.getTotalPrice());
    }
    
    // Inner class to represent a demo trade
    private static class DemoTrade {
        private String id;
        private String userId;
        private String symbol;
        private String side;
        private String orderType;
        private BigDecimal amount;
        private BigDecimal price;
        private BigDecimal totalPrice;
        private String status;
        private LocalDateTime executedAt;
        private BigDecimal profitLoss;
        private BigDecimal profitLossPercentage;
        
        // Getters and setters
        public String getId() { return id; }
        public void setId(String id) { this.id = id; }
        
        public String getUserId() { return userId; }
        public void setUserId(String userId) { this.userId = userId; }
        
        public String getSymbol() { return symbol; }
        public void setSymbol(String symbol) { this.symbol = symbol; }
        
        public String getSide() { return side; }
        public void setSide(String side) { this.side = side; }
        
        public String getOrderType() { return orderType; }
        public void setOrderType(String orderType) { this.orderType = orderType; }
        
        public BigDecimal getAmount() { return amount; }
        public void setAmount(BigDecimal amount) { this.amount = amount; }
        
        public BigDecimal getPrice() { return price; }
        public void setPrice(BigDecimal price) { this.price = price; }
        
        public BigDecimal getTotalPrice() { return totalPrice; }
        public void setTotalPrice(BigDecimal totalPrice) { this.totalPrice = totalPrice; }
        
        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }
        
        public LocalDateTime getExecutedAt() { return executedAt; }
        public void setExecutedAt(LocalDateTime executedAt) { this.executedAt = executedAt; }
        
        public BigDecimal getProfitLoss() { return profitLoss; }
        public void setProfitLoss(BigDecimal profitLoss) { this.profitLoss = profitLoss; }
        
        public BigDecimal getProfitLossPercentage() { return profitLossPercentage; }
        public void setProfitLossPercentage(BigDecimal profitLossPercentage) { this.profitLossPercentage = profitLossPercentage; }
    }
}
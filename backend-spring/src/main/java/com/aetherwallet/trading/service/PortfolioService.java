package com.aetherwallet.trading.service;

import com.aetherwallet.trading.dto.PortfolioResponse;
import com.aetherwallet.trading.entity.Portfolio;
import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.PortfolioRepository;
import com.aetherwallet.trading.repository.TradingPairRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class PortfolioService {
    private final PortfolioRepository portfolioRepository;
    private final TradingPairRepository tradingPairRepository;
    private final PriceService priceService;
    
    @Transactional
    public PortfolioResponse getPortfolio(String userId) {
        List<Portfolio> holdings = portfolioRepository.findNonZeroHoldingsByUserId(userId);
        
        BigDecimal totalValue = BigDecimal.ZERO;
        BigDecimal totalCost = BigDecimal.ZERO;
        
        List<PortfolioResponse.PortfolioItem> items = holdings.stream()
                .map(holding -> {
                    TradingPair pair = holding.getTradingPair();
                    BigDecimal currentPrice = priceService.getPrice(pair.getSymbol());
                    BigDecimal currentValue = holding.getAmount().multiply(currentPrice);
                    
                    BigDecimal profitLoss = BigDecimal.ZERO;
                    BigDecimal profitLossPercentage = BigDecimal.ZERO;
                    
                    if (holding.getAverageBuyPrice() != null && holding.getAverageBuyPrice().compareTo(BigDecimal.ZERO) > 0) {
                        BigDecimal cost = holding.getAmount().multiply(holding.getAverageBuyPrice());
                        profitLoss = currentValue.subtract(cost);
                        if (cost.compareTo(BigDecimal.ZERO) > 0) {
                            profitLossPercentage = profitLoss.divide(cost, 4, RoundingMode.HALF_UP)
                                    .multiply(BigDecimal.valueOf(100));
                        }
                    }
                    
                    // Update holding
                    holding.setCurrentValue(currentValue);
                    holding.setProfitLoss(profitLoss);
                    holding.setProfitLossPercentage(profitLossPercentage);
                    portfolioRepository.save(holding);
                    
                    return PortfolioResponse.PortfolioItem.builder()
                            .symbol(pair.getSymbol())
                            .name(pair.getName())
                            .amount(holding.getAmount())
                            .averageBuyPrice(holding.getAverageBuyPrice())
                            .currentPrice(currentPrice)
                            .currentValue(currentValue)
                            .profitLoss(profitLoss)
                            .profitLossPercentage(profitLossPercentage)
                            .build();
                })
                .collect(Collectors.toList());
        
        totalValue = items.stream()
                .map(PortfolioResponse.PortfolioItem::getCurrentValue)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        
        totalCost = items.stream()
                .filter(item -> item.getAverageBuyPrice() != null)
                .map(item -> item.getAmount().multiply(item.getAverageBuyPrice()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        
        BigDecimal totalProfitLoss = totalValue.subtract(totalCost);
        BigDecimal totalProfitLossPercentage = BigDecimal.ZERO;
        if (totalCost.compareTo(BigDecimal.ZERO) > 0) {
            totalProfitLossPercentage = totalProfitLoss.divide(totalCost, 4, RoundingMode.HALF_UP)
                    .multiply(BigDecimal.valueOf(100));
        }
        
        return PortfolioResponse.builder()
                .totalValue(totalValue)
                .totalProfitLoss(totalProfitLoss)
                .totalProfitLossPercentage(totalProfitLossPercentage)
                .holdings(items)
                .build();
    }
    
    @Transactional
    public void updatePortfolioAfterTrade(String userId, UUID tradingPairId, 
                                          BigDecimal amount, BigDecimal price, 
                                          boolean isBuy) {
        Optional<Portfolio> portfolioOpt = portfolioRepository
                .findByUserIdAndTradingPairId(userId, tradingPairId);
        
        TradingPair pair = tradingPairRepository.findById(tradingPairId)
                .orElseThrow(() -> new IllegalArgumentException("Trading pair not found"));
        
        Portfolio portfolio;
        if (portfolioOpt.isPresent()) {
            portfolio = portfolioOpt.get();
        } else {
            portfolio = Portfolio.builder()
                    .userId(userId)
                    .tradingPair(pair)
                    .amount(BigDecimal.ZERO)
                    .totalCost(BigDecimal.ZERO)
                    .build();
        }
        
        if (isBuy) {
            // Buying: add to portfolio
            BigDecimal newTotalCost = portfolio.getTotalCost().add(amount.multiply(price));
            BigDecimal newAmount = portfolio.getAmount().add(amount);
            BigDecimal newAveragePrice = newAmount.compareTo(BigDecimal.ZERO) > 0 ?
                    newTotalCost.divide(newAmount, 8, RoundingMode.HALF_UP) : BigDecimal.ZERO;
            
            portfolio.setAmount(newAmount);
            portfolio.setTotalCost(newTotalCost);
            portfolio.setAverageBuyPrice(newAveragePrice);
        } else {
            // Selling: subtract from portfolio
            if (portfolio.getAmount().compareTo(amount) < 0) {
                throw new IllegalArgumentException("Insufficient portfolio amount");
            }
            
            BigDecimal newAmount = portfolio.getAmount().subtract(amount);
            BigDecimal newTotalCost = portfolio.getTotalCost().subtract(
                    amount.multiply(portfolio.getAverageBuyPrice() != null ? 
                            portfolio.getAverageBuyPrice() : price)
            );
            
            portfolio.setAmount(newAmount);
            portfolio.setTotalCost(newTotalCost);
            
            if (newAmount.compareTo(BigDecimal.ZERO) == 0) {
                portfolio.setAverageBuyPrice(null);
            }
        }
        
        portfolioRepository.save(portfolio);
    }
}








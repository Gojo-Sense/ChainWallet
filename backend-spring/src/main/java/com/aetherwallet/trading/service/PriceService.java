package com.aetherwallet.trading.service;

import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.TradingPairRepository;
import com.aetherwallet.trading.service.external.BinanceService;
import com.aetherwallet.trading.service.external.CoinGeckoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class PriceService {
    private final TradingPairRepository tradingPairRepository;
    private final BinanceService binanceService;
    private final CoinGeckoService coinGeckoService;
    
    public BigDecimal getPrice(String symbol) {
        Optional<TradingPair> pairOpt = tradingPairRepository.findBySymbol(symbol);
        if (pairOpt.isPresent()) {
            return pairOpt.get().getCurrentPrice();
        }
        
        // Try to fetch from external API
        BigDecimal price = binanceService.getPrice(symbol).block();
        if (price == null || price.compareTo(BigDecimal.ZERO) == 0) {
            price = coinGeckoService.getPrice(symbol);
        }
        
        return price != null ? price : BigDecimal.ZERO;
    }
    
    public Map<String, BigDecimal> getMultiplePrices(String[] symbols) {
        Map<String, BigDecimal> prices = new HashMap<>();
        
        for (String symbol : symbols) {
            Optional<TradingPair> pairOpt = tradingPairRepository.findBySymbol(symbol);
            if (pairOpt.isPresent()) {
                prices.put(symbol, pairOpt.get().getCurrentPrice());
            } else {
                BigDecimal price = binanceService.getPrice(symbol).block();
                if (price == null || price.compareTo(BigDecimal.ZERO) == 0) {
                    price = coinGeckoService.getPrice(symbol);
                }
                prices.put(symbol, price != null ? price : BigDecimal.ZERO);
            }
        }
        
        return prices;
    }
    
    @Scheduled(fixedRate = 30000) // Update every 30 seconds
    @Transactional
    public void updatePrices() {
        List<TradingPair> activePairs = tradingPairRepository.findByIsActiveTrue();
        
        for (TradingPair pair : activePairs) {
            try {
                // Try Binance first
                Map<String, Object> ticker = binanceService.getTicker24h(pair.getSymbol()).block();
                
                if (ticker == null || ticker.isEmpty()) {
                    // Fallback to CoinGecko
                    ticker = coinGeckoService.getTicker24h(pair.getSymbol());
                }
                
                if (ticker != null && !ticker.isEmpty()) {
                    if (ticker.containsKey("price")) {
                        pair.setCurrentPrice((BigDecimal) ticker.get("price"));
                    }
                    if (ticker.containsKey("change24h")) {
                        pair.setChange24h((BigDecimal) ticker.get("change24h"));
                    }
                    if (ticker.containsKey("volume24h")) {
                        pair.setVolume24h((BigDecimal) ticker.get("volume24h"));
                    }
                    pair.setLastPriceUpdate(LocalDateTime.now());
                    tradingPairRepository.save(pair);
                }
            } catch (Exception e) {
                log.error("Error updating price for {}: {}", pair.getSymbol(), e.getMessage());
            }
        }
    }
}








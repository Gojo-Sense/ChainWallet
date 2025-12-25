package com.aetherwallet.trading.service;

import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.TradingPairRepository;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class TradingPairService {
    private final TradingPairRepository tradingPairRepository;
    
    public List<TradingPair> getActivePairs() {
        return tradingPairRepository.findByIsActiveTrue();
    }
    
    public List<String> getActiveSymbols() {
        return getActivePairs().stream()
                .map(TradingPair::getSymbol)
                .collect(Collectors.toList());
    }
    
    public PairData getPairData(String symbol) {
        return tradingPairRepository.findBySymbol(symbol)
                .map(pair -> new PairData(pair.getChange24h(), pair.getVolume24h()))
                .orElse(null);
    }
    
    @Data
    public static class PairData {
        private final BigDecimal change24h;
        private final BigDecimal volume24h;
    }
    
    @Transactional
    public void initializeDefaultPairs() {
        if (tradingPairRepository.count() == 0) {
            createPair("BTC/USD", "BTC", "USD", "Bitcoin", BigDecimal.valueOf(50000), 8, 8);
            createPair("ETH/USD", "ETH", "USD", "Ethereum", BigDecimal.valueOf(3000), 8, 8);
            createPair("BNB/USD", "BNB", "USD", "Binance Coin", BigDecimal.valueOf(300), 8, 8);
            createPair("SOL/USD", "SOL", "USD", "Solana", BigDecimal.valueOf(100), 8, 8);
        }
    }
    
    private void createPair(String symbol, String base, String quote, String name, 
                           BigDecimal initialPrice, int pricePrecision, int amountPrecision) {
        TradingPair pair = TradingPair.builder()
                .symbol(symbol)
                .baseCurrency(base)
                .quoteCurrency(quote)
                .name(name)
                .currentPrice(initialPrice)
                .change24h(BigDecimal.ZERO)
                .volume24h(BigDecimal.ZERO)
                .isActive(true)
                .pricePrecision(pricePrecision)
                .amountPrecision(amountPrecision)
                .minOrderAmount(BigDecimal.valueOf(0.0001))
                .maxOrderAmount(BigDecimal.valueOf(1000000))
                .build();
        tradingPairRepository.save(pair);
    }
}








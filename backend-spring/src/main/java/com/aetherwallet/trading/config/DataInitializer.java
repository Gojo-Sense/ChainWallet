package com.aetherwallet.trading.config;

import com.aetherwallet.trading.service.TradingPairService;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DataInitializer {
    private final TradingPairService tradingPairService;
    
    @PostConstruct
    public void init() {
        tradingPairService.initializeDefaultPairs();
    }
}








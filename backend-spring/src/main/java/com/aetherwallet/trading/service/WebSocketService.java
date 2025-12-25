package com.aetherwallet.trading.service;

import com.aetherwallet.trading.dto.PriceUpdateMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class WebSocketService {
    private final SimpMessagingTemplate messagingTemplate;
    private final PriceService priceService;
    private final TradingPairService tradingPairService;
    
    public void sendPriceUpdate(String symbol, BigDecimal price, BigDecimal change24h, BigDecimal volume24h) {
        PriceUpdateMessage message = PriceUpdateMessage.builder()
                .symbol(symbol)
                .price(price)
                .change24h(change24h)
                .volume24h(volume24h)
                .timestamp(System.currentTimeMillis())
                .build();
        
        messagingTemplate.convertAndSend("/topic/prices/" + symbol, message);
        messagingTemplate.convertAndSend("/topic/prices", message);
    }
    
    @Scheduled(fixedRate = 5000) // Every 5 seconds
    public void broadcastPriceUpdates() {
        List<String> activeSymbols = tradingPairService.getActiveSymbols();
        
        for (String symbol : activeSymbols) {
            try {
                BigDecimal price = priceService.getPrice(symbol);
                // Get additional data from trading pair
                var pairData = tradingPairService.getPairData(symbol);
                if (pairData != null) {
                    sendPriceUpdate(symbol, price, pairData.getChange24h(), pairData.getVolume24h());
                }
            } catch (Exception e) {
                log.error("Error broadcasting price update for {}: {}", symbol, e.getMessage());
            }
        }
    }
}








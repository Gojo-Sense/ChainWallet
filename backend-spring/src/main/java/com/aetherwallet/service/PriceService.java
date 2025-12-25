package com.aetherwallet.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.math.BigDecimal;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Price Service - Fetches real-time cryptocurrency prices
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class PriceService {

    private final WebClient.Builder webClientBuilder;
    
    // Cache prices for 30 seconds
    private final Map<String, PriceCache> priceCache = new ConcurrentHashMap<>();
    private static final long CACHE_TTL_MS = 30_000;

    /**
     * Get current price for a cryptocurrency
     */
    public BigDecimal getPrice(String symbol) {
        PriceCache cached = priceCache.get(symbol.toUpperCase());
        if (cached != null && !cached.isExpired()) {
            return cached.price;
        }
        
        try {
            BigDecimal price = fetchPriceFromApi(symbol);
            priceCache.put(symbol.toUpperCase(), new PriceCache(price));
            return price;
        } catch (Exception e) {
            log.warn("Failed to fetch price for {}, using fallback", symbol, e);
            return getFallbackPrice(symbol);
        }
    }

    private BigDecimal fetchPriceFromApi(String symbol) {
        String coinId = getCoinGeckoId(symbol);
        
        Map<String, Object> response = webClientBuilder.build()
            .get()
            .uri("https://api.coingecko.com/api/v3/simple/price?ids={id}&vs_currencies=usd", coinId)
            .retrieve()
            .bodyToMono(Map.class)
            .block();
        
        if (response != null && response.containsKey(coinId)) {
            Map<String, Object> priceData = (Map<String, Object>) response.get(coinId);
            Number usdPrice = (Number) priceData.get("usd");
            return BigDecimal.valueOf(usdPrice.doubleValue());
        }
        
        return getFallbackPrice(symbol);
    }

    private String getCoinGeckoId(String symbol) {
        return switch (symbol.toUpperCase()) {
            case "BTC" -> "bitcoin";
            case "ETH" -> "ethereum";
            case "BNB" -> "binancecoin";
            case "SOL" -> "solana";
            default -> symbol.toLowerCase();
        };
    }

    private BigDecimal getFallbackPrice(String symbol) {
        return switch (symbol.toUpperCase()) {
            case "BTC" -> new BigDecimal("43000.00");
            case "ETH" -> new BigDecimal("2200.00");
            case "BNB" -> new BigDecimal("310.00");
            case "SOL" -> new BigDecimal("100.00");
            default -> BigDecimal.ONE;
        };
    }

    private static class PriceCache {
        final BigDecimal price;
        final long timestamp;

        PriceCache(BigDecimal price) {
            this.price = price;
            this.timestamp = System.currentTimeMillis();
        }

        boolean isExpired() {
            return System.currentTimeMillis() - timestamp > CACHE_TTL_MS;
        }
    }
}

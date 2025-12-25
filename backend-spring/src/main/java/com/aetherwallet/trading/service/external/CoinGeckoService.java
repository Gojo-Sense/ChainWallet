package com.aetherwallet.trading.service.external;

import com.fasterxml.jackson.databind.JsonNode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class CoinGeckoService {
    private final WebClient webClient;
    private final String apiUrl;
    private final String apiKey;
    
    private static final Map<String, String> COIN_ID_MAP = Map.of(
        "BTC", "bitcoin",
        "ETH", "ethereum",
        "BNB", "binancecoin",
        "SOL", "solana",
        "ADA", "cardano",
        "DOT", "polkadot",
        "MATIC", "matic-network",
        "AVAX", "avalanche-2",
        "LINK", "chainlink",
        "UNI", "uniswap"
    );
    
    public CoinGeckoService(
            @Value("${external.coingecko.api-url}") String apiUrl,
            @Value("${external.coingecko.api-key:}") String apiKey) {
        this.apiUrl = apiUrl;
        this.apiKey = apiKey;
        this.webClient = WebClient.builder()
                .baseUrl(apiUrl)
                .defaultHeader("x-cg-demo-api-key", apiKey)
                .build();
    }
    
    public BigDecimal getPrice(String symbol) {
        String coinId = getCoinId(symbol);
        if (coinId == null) {
            return BigDecimal.ZERO;
        }
        
        try {
            JsonNode response = webClient.get()
                    .uri("/simple/price?ids={coinId}&vs_currencies=usd", coinId)
                    .retrieve()
                    .bodyToMono(JsonNode.class)
                    .block();
            
            if (response != null && response.has(coinId)) {
                return new BigDecimal(response.get(coinId).get("usd").asText());
            }
        } catch (Exception e) {
            log.error("Error fetching price from CoinGecko for {}: {}", symbol, e.getMessage());
        }
        
        return BigDecimal.ZERO;
    }
    
    public Map<String, BigDecimal> getMultiplePrices(String[] symbols) {
        Map<String, BigDecimal> prices = new HashMap<>();
        StringBuilder coinIds = new StringBuilder();
        
        for (String symbol : symbols) {
            String coinId = getCoinId(symbol);
            if (coinId != null) {
                if (coinIds.length() > 0) coinIds.append(",");
                coinIds.append(coinId);
            }
        }
        
        if (coinIds.length() == 0) {
            return prices;
        }
        
        try {
            JsonNode response = webClient.get()
                    .uri("/simple/price?ids={coinIds}&vs_currencies=usd&include_24hr_change=true", coinIds.toString())
                    .retrieve()
                    .bodyToMono(JsonNode.class)
                    .block();
            
            if (response != null) {
                for (String symbol : symbols) {
                    String coinId = getCoinId(symbol);
                    if (coinId != null && response.has(coinId)) {
                        JsonNode coinData = response.get(coinId);
                        if (coinData.has("usd")) {
                            prices.put(symbol, new BigDecimal(coinData.get("usd").asText()));
                        }
                    }
                }
            }
        } catch (Exception e) {
            log.error("Error fetching multiple prices from CoinGecko: {}", e.getMessage());
        }
        
        return prices;
    }
    
    public Map<String, Object> getTicker24h(String symbol) {
        String coinId = getCoinId(symbol);
        if (coinId == null) {
            return new HashMap<>();
        }
        
        try {
            JsonNode response = webClient.get()
                    .uri("/coins/{coinId}?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false", coinId)
                    .retrieve()
                    .bodyToMono(JsonNode.class)
                    .block();
            
            if (response != null && response.has("market_data")) {
                JsonNode marketData = response.get("market_data");
                Map<String, Object> ticker = new HashMap<>();
                
                if (marketData.has("current_price") && marketData.get("current_price").has("usd")) {
                    ticker.put("price", new BigDecimal(marketData.get("current_price").get("usd").asText()));
                }
                
                if (marketData.has("price_change_percentage_24h")) {
                    ticker.put("change24h", new BigDecimal(marketData.get("price_change_percentage_24h").asText()));
                }
                
                if (marketData.has("total_volume") && marketData.get("total_volume").has("usd")) {
                    ticker.put("volume24h", new BigDecimal(marketData.get("total_volume").get("usd").asText()));
                }
                
                return ticker;
            }
        } catch (Exception e) {
            log.error("Error fetching 24h ticker from CoinGecko for {}: {}", symbol, e.getMessage());
        }
        
        return new HashMap<>();
    }
    
    private String getCoinId(String symbol) {
        String baseSymbol = symbol.split("/")[0];
        return COIN_ID_MAP.get(baseSymbol.toUpperCase());
    }
}








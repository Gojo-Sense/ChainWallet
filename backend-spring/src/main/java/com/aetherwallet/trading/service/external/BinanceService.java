package com.aetherwallet.trading.service.external;

import com.fasterxml.jackson.databind.JsonNode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class BinanceService {
    private final WebClient webClient;
    private final String restUrl;
    
    public BinanceService(@Value("${external.binance.rest-url}") String restUrl) {
        this.restUrl = restUrl;
        this.webClient = WebClient.builder()
                .baseUrl(restUrl)
                .build();
    }
    
    public Mono<BigDecimal> getPrice(String symbol) {
        String binanceSymbol = convertToBinanceSymbol(symbol);
        return webClient.get()
                .uri("/ticker/price?symbol={symbol}", binanceSymbol)
                .retrieve()
                .bodyToMono(JsonNode.class)
                .map(json -> new BigDecimal(json.get("price").asText()))
                .doOnError(error -> log.error("Error fetching price from Binance for {}: {}", symbol, error.getMessage()))
                .onErrorReturn(BigDecimal.ZERO);
    }
    
    public Mono<Map<String, BigDecimal>> getMultiplePrices(String[] symbols) {
        StringBuilder symbolsParam = new StringBuilder();
        for (int i = 0; i < symbols.length; i++) {
            if (i > 0) symbolsParam.append(",");
            symbolsParam.append(convertToBinanceSymbol(symbols[i]));
        }
        
        return webClient.get()
                .uri("/ticker/price")
                .retrieve()
                .bodyToFlux(JsonNode.class)
                .collectMap(
                    json -> convertFromBinanceSymbol(json.get("symbol").asText()),
                    json -> new BigDecimal(json.get("price").asText())
                )
                .doOnError(error -> log.error("Error fetching multiple prices from Binance: {}", error.getMessage()))
                .onErrorReturn(new HashMap<>());
    }
    
    public Mono<Map<String, Object>> getTicker24h(String symbol) {
        String binanceSymbol = convertToBinanceSymbol(symbol);
        return webClient.get()
                .uri("/ticker/24hr?symbol={symbol}", binanceSymbol)
                .retrieve()
                .bodyToMono(JsonNode.class)
                .map(json -> {
                    Map<String, Object> ticker = new HashMap<>();
                    ticker.put("price", new BigDecimal(json.get("lastPrice").asText()));
                    ticker.put("change24h", new BigDecimal(json.get("priceChangePercent").asText()));
                    ticker.put("volume24h", new BigDecimal(json.get("volume").asText()));
                    return ticker;
                })
                .doOnError(error -> log.error("Error fetching 24h ticker from Binance for {}: {}", symbol, error.getMessage()))
                .onErrorReturn(new HashMap<>());
    }
    
    private String convertToBinanceSymbol(String symbol) {
        // Convert "BTC/USD" to "BTCUSDT" (assuming USD = USDT for Binance)
        String[] parts = symbol.split("/");
        if (parts.length == 2) {
            return (parts[0] + "USDT").toUpperCase();
        }
        return symbol.toUpperCase();
    }
    
    private String convertFromBinanceSymbol(String binanceSymbol) {
        // Convert "BTCUSDT" to "BTC/USD"
        if (binanceSymbol.endsWith("USDT")) {
            String base = binanceSymbol.substring(0, binanceSymbol.length() - 4);
            return base + "/USD";
        }
        return binanceSymbol;
    }
}








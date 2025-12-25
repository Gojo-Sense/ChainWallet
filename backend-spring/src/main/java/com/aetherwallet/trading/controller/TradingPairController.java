package com.aetherwallet.trading.controller;

import com.aetherwallet.trading.dto.TradingPairResponse;
import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.service.PriceService;
import com.aetherwallet.trading.service.TradingPairService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/trading/pairs")
@RequiredArgsConstructor
public class TradingPairController {
    private final TradingPairService tradingPairService;
    private final PriceService priceService;
    
    @GetMapping
    public ResponseEntity<List<TradingPairResponse>> getTradingPairs() {
        List<TradingPair> pairs = tradingPairService.getActivePairs();
        List<TradingPairResponse> responses = pairs.stream()
                .map(this::convertToResponse)
                .collect(Collectors.toList());
        return ResponseEntity.ok(responses);
    }
    
    @GetMapping("/{symbol}")
    public ResponseEntity<TradingPairResponse> getTradingPair(@PathVariable String symbol) {
        return tradingPairService.getActivePairs().stream()
                .filter(p -> p.getSymbol().equals(symbol))
                .findFirst()
                .map(this::convertToResponse)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @GetMapping("/{symbol}/price")
    public ResponseEntity<BigDecimal> getPrice(@PathVariable String symbol) {
        BigDecimal price = priceService.getPrice(symbol);
        if (price.compareTo(BigDecimal.ZERO) == 0) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(price);
    }
    
    private TradingPairResponse convertToResponse(TradingPair pair) {
        return TradingPairResponse.builder()
                .id(pair.getId())
                .symbol(pair.getSymbol())
                .baseCurrency(pair.getBaseCurrency())
                .quoteCurrency(pair.getQuoteCurrency())
                .name(pair.getName())
                .currentPrice(pair.getCurrentPrice())
                .change24h(pair.getChange24h())
                .volume24h(pair.getVolume24h())
                .isActive(pair.getIsActive())
                .pricePrecision(pair.getPricePrecision())
                .amountPrecision(pair.getAmountPrecision())
                .minOrderAmount(pair.getMinOrderAmount())
                .maxOrderAmount(pair.getMaxOrderAmount())
                .build();
    }
}








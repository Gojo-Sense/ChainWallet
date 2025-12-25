package com.aetherwallet.trading.controller;

import com.aetherwallet.trading.config.UserContext;
import com.aetherwallet.trading.dto.TradeResponse;
import com.aetherwallet.trading.entity.Trade;
import com.aetherwallet.trading.repository.TradeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/trading/history")
@RequiredArgsConstructor
public class TradeHistoryController {
    private final TradeRepository tradeRepository;
    
    @GetMapping
    public ResponseEntity<Page<TradeResponse>> getTradeHistory(
            @PageableDefault(size = 20) Pageable pageable) {
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        
        Page<Trade> trades = tradeRepository.findByUserIdOrderByCreatedAtDesc(userId, pageable);
        Page<TradeResponse> responses = trades.map(this::convertToResponse);
        return ResponseEntity.ok(responses);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<TradeResponse> getTrade(@PathVariable UUID id) {
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        
        return tradeRepository.findById(id)
                .filter(trade -> trade.getUserId().equals(userId))
                .map(this::convertToResponse)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    private TradeResponse convertToResponse(Trade trade) {
        return TradeResponse.builder()
                .id(trade.getId())
                .orderId(trade.getOrderId())
                .symbol(trade.getTradingPair().getSymbol())
                .side(trade.getSide().name())
                .amount(trade.getAmount())
                .price(trade.getPrice())
                .total(trade.getTotal())
                .fee(trade.getFee())
                .feeCurrency(trade.getFeeCurrency())
                .createdAt(trade.getCreatedAt())
                .build();
    }
}








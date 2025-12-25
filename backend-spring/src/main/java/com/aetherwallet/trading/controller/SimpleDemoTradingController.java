package com.aetherwallet.trading.controller;

import com.aetherwallet.trading.dto.DemoPerformanceResponse;
import com.aetherwallet.trading.dto.DemoTradeRequest;
import com.aetherwallet.trading.dto.DemoTradeResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@RestController
@RequestMapping("/api/trading/simple-demo")
@CrossOrigin(origins = "*")
public class SimpleDemoTradingController {
    
    @PostMapping("/trade")
    public ResponseEntity<DemoTradeResponse> executeDemoTrade(@RequestBody DemoTradeRequest request) {
        // Simulate a demo trade response
        DemoTradeResponse response = DemoTradeResponse.builder()
                .id(UUID.randomUUID().toString())
                .symbol(request.getSymbol())
                .side(request.getSide().name())
                .orderType(request.getOrderType().name())
                .amount(request.getAmount())
                .price(request.getPrice() != null ? request.getPrice() : new BigDecimal("50000"))
                .totalPrice(request.getAmount().multiply(request.getPrice() != null ? request.getPrice() : new BigDecimal("50000")))
                .status("EXECUTED")
                .executedAt(LocalDateTime.now())
                .profitLoss(new BigDecimal("125.50"))
                .profitLossPercentage(new BigDecimal("2.5"))
                .build();
        
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/performance")
    public ResponseEntity<DemoPerformanceResponse> getDemoPerformance() {
        // Simulate a demo performance response
        DemoPerformanceResponse response = DemoPerformanceResponse.builder()
                .totalTrades(12)
                .profitableTrades(8)
                .lossMakingTrades(4)
                .totalProfitLoss(new BigDecimal("450.75"))
                .totalProfitLossPercentage(new BigDecimal("4.5"))
                .winRate(new BigDecimal("66.67"))
                .avgProfitPerTrade(new BigDecimal("56.34"))
                .avgLossPerTrade(new BigDecimal("32.10"))
                .passedDemo(true)
                .certificationMessage("Congratulations! You have successfully completed the demo trading challenge.")
                .build();
        
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> healthCheck() {
        return ResponseEntity.ok("Simple Demo Trading service is running");
    }
}
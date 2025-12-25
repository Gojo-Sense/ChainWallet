package com.aetherwallet.trading.controller;

import com.aetherwallet.trading.config.UserContext;
import com.aetherwallet.trading.dto.DemoPerformanceResponse;
import com.aetherwallet.trading.dto.DemoTradeRequest;
import com.aetherwallet.trading.dto.DemoTradeResponse;
import com.aetherwallet.trading.service.DemoTradingService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/trading/demo")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class DemoTradingController {
    
    private final DemoTradingService demoTradingService;
    
    @PostMapping("/trade")
    public ResponseEntity<DemoTradeResponse> executeDemoTrade(@Valid @RequestBody DemoTradeRequest request) {
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            userId = "demo-user-" + System.currentTimeMillis(); // Generate demo user ID
        }
        
        try {
            DemoTradeResponse response = demoTradingService.executeDemoTrade(userId, request);
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    @GetMapping("/performance")
    public ResponseEntity<DemoPerformanceResponse> getDemoPerformance() {
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            userId = "demo-user-" + System.currentTimeMillis(); // Generate demo user ID
        }
        
        DemoPerformanceResponse response = demoTradingService.getDemoPerformance(userId);
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> healthCheck() {
        return ResponseEntity.ok("Demo Trading service is running");
    }
}
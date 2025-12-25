package com.aetherwallet.trading.controller;

import com.aetherwallet.trading.config.UserContext;
import com.aetherwallet.trading.dto.BalanceResponse;
import com.aetherwallet.trading.dto.DepositRequest;
import com.aetherwallet.trading.dto.PortfolioResponse;
import com.aetherwallet.trading.dto.WithdrawRequest;
import com.aetherwallet.trading.entity.TradingAccount;
import com.aetherwallet.trading.service.PortfolioService;
import com.aetherwallet.trading.service.TradingAccountService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/trading")
@RequiredArgsConstructor
public class PortfolioController {
    private final PortfolioService portfolioService;
    private final TradingAccountService tradingAccountService;
    
    @GetMapping("/portfolio")
    public ResponseEntity<PortfolioResponse> getPortfolio() {
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        
        return ResponseEntity.ok(portfolioService.getPortfolio(userId));
    }
    
    @GetMapping("/balance")
    public ResponseEntity<BalanceResponse> getBalance() {
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        
        TradingAccount account = tradingAccountService.getOrCreateAccount(userId);
        BalanceResponse balance = BalanceResponse.builder()
                .balance(account.getBalance())
                .availableBalance(account.getAvailableBalance())
                .lockedBalance(account.getLockedBalance())
                .build();
        
        return ResponseEntity.ok(balance);
    }
    
    @PostMapping("/deposit")
    public ResponseEntity<BalanceResponse> deposit(@Valid @RequestBody DepositRequest request) {
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        
        try {
            TradingAccount account = tradingAccountService.deposit(userId, request.getAmount());
            BalanceResponse balance = BalanceResponse.builder()
                    .balance(account.getBalance())
                    .availableBalance(account.getAvailableBalance())
                    .lockedBalance(account.getLockedBalance())
                    .build();
            return ResponseEntity.ok(balance);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    @PostMapping("/withdraw")
    public ResponseEntity<BalanceResponse> withdraw(@Valid @RequestBody WithdrawRequest request) {
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        
        try {
            TradingAccount account = tradingAccountService.withdraw(userId, request.getAmount());
            BalanceResponse balance = BalanceResponse.builder()
                    .balance(account.getBalance())
                    .availableBalance(account.getAvailableBalance())
                    .lockedBalance(account.getLockedBalance())
                    .build();
            return ResponseEntity.ok(balance);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }
}








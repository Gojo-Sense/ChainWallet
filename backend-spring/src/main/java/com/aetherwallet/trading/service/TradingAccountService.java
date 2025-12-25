package com.aetherwallet.trading.service;

import com.aetherwallet.trading.entity.TradingAccount;
import com.aetherwallet.trading.repository.TradingAccountRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class TradingAccountService {
    private final TradingAccountRepository tradingAccountRepository;
    
    @Transactional
    public TradingAccount getOrCreateAccount(String userId) {
        Optional<TradingAccount> accountOpt = tradingAccountRepository.findByUserId(userId);
        if (accountOpt.isPresent()) {
            return accountOpt.get();
        }
        
        TradingAccount account = TradingAccount.builder()
                .userId(userId)
                .balance(BigDecimal.ZERO)
                .availableBalance(BigDecimal.ZERO)
                .lockedBalance(BigDecimal.ZERO)
                .build();
        
        return tradingAccountRepository.save(account);
    }
    
    @Transactional
    public TradingAccount deposit(String userId, BigDecimal amount) {
        TradingAccount account = getOrCreateAccount(userId);
        account.setBalance(account.getBalance().add(amount));
        account.setAvailableBalance(account.getAvailableBalance().add(amount));
        return tradingAccountRepository.save(account);
    }
    
    @Transactional
    public TradingAccount withdraw(String userId, BigDecimal amount) {
        TradingAccount account = getOrCreateAccount(userId);
        
        if (account.getAvailableBalance().compareTo(amount) < 0) {
            throw new IllegalArgumentException("Insufficient balance");
        }
        
        account.setBalance(account.getBalance().subtract(amount));
        account.setAvailableBalance(account.getAvailableBalance().subtract(amount));
        return tradingAccountRepository.save(account);
    }
    
    @Transactional
    public TradingAccount lockBalance(String userId, BigDecimal amount) {
        TradingAccount account = getOrCreateAccount(userId);
        
        if (account.getAvailableBalance().compareTo(amount) < 0) {
            throw new IllegalArgumentException("Insufficient available balance");
        }
        
        account.setAvailableBalance(account.getAvailableBalance().subtract(amount));
        account.setLockedBalance(account.getLockedBalance().add(amount));
        return tradingAccountRepository.save(account);
    }
    
    @Transactional
    public TradingAccount unlockBalance(String userId, BigDecimal amount) {
        TradingAccount account = getOrCreateAccount(userId);
        
        if (account.getLockedBalance().compareTo(amount) < 0) {
            throw new IllegalArgumentException("Insufficient locked balance");
        }
        
        account.setLockedBalance(account.getLockedBalance().subtract(amount));
        account.setAvailableBalance(account.getAvailableBalance().add(amount));
        return tradingAccountRepository.save(account);
    }
    
    @Transactional
    public TradingAccount releaseLockedBalance(String userId, BigDecimal amount) {
        TradingAccount account = getOrCreateAccount(userId);
        
        if (account.getLockedBalance().compareTo(amount) < 0) {
            log.warn("Attempted to release more locked balance than available for user {}", userId);
            amount = account.getLockedBalance();
        }
        
        account.setLockedBalance(account.getLockedBalance().subtract(amount));
        account.setAvailableBalance(account.getAvailableBalance().add(amount));
        return tradingAccountRepository.save(account);
    }
}








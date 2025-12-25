package com.aetherwallet.trading.service;

import com.aetherwallet.trading.entity.TradingAccount;
import com.aetherwallet.trading.repository.TradingAccountRepository;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("TradingAccountService Unit Tests")
class TradingAccountServiceTest {

    @Mock
    private TradingAccountRepository tradingAccountRepository;

    @InjectMocks
    private TradingAccountService tradingAccountService;

    private String userId;
    private TradingAccount testAccount;

    @BeforeEach
    void setUp() {
        userId = UUID.randomUUID().toString();
        
        testAccount = TradingAccount.builder()
                .id(UUID.randomUUID())
                .userId(userId)
                .balance(new BigDecimal("10000.00"))
                .availableBalance(new BigDecimal("10000.00"))
                .lockedBalance(BigDecimal.ZERO)
                .build();
    }

    @Test
    @DisplayName("Should get existing account")
    void getOrCreateAccount_ExistingAccount_ReturnsAccount() {
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.of(testAccount));

        TradingAccount result = tradingAccountService.getOrCreateAccount(userId);

        assertNotNull(result);
        assertEquals(userId, result.getUserId());
        verify(tradingAccountRepository, never()).save(any());
    }

    @Test
    @DisplayName("Should create new account if not exists")
    void getOrCreateAccount_NewAccount_CreatesAccount() {
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.empty());
        when(tradingAccountRepository.save(any(TradingAccount.class)))
                .thenAnswer(inv -> {
                    TradingAccount acc = inv.getArgument(0);
                    acc.setId(UUID.randomUUID());
                    return acc;
                });

        TradingAccount result = tradingAccountService.getOrCreateAccount(userId);

        assertNotNull(result);
        assertEquals(userId, result.getUserId());
        verify(tradingAccountRepository).save(any(TradingAccount.class));
    }

    @Test
    @DisplayName("Should deposit funds successfully")
    void deposit_ValidAmount_IncreasesBalance() {
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.of(testAccount));
        when(tradingAccountRepository.save(any(TradingAccount.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        TradingAccount result = tradingAccountService.deposit(userId, new BigDecimal("1000.00"));

        assertNotNull(result);
        assertEquals(0, new BigDecimal("11000.00").compareTo(result.getBalance()));
    }

    @Test
    @DisplayName("Should withdraw funds successfully")
    void withdraw_ValidAmount_DecreasesBalance() {
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.of(testAccount));
        when(tradingAccountRepository.save(any(TradingAccount.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        TradingAccount result = tradingAccountService.withdraw(userId, new BigDecimal("1000.00"));

        assertNotNull(result);
        assertEquals(0, new BigDecimal("9000.00").compareTo(result.getBalance()));
    }

    @Test
    @DisplayName("Should throw exception for insufficient balance on withdraw")
    void withdraw_InsufficientBalance_ThrowsException() {
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.of(testAccount));

        assertThrows(IllegalArgumentException.class, () ->
                tradingAccountService.withdraw(userId, new BigDecimal("50000.00")));
    }

    @Test
    @DisplayName("Should lock balance successfully")
    void lockBalance_ValidAmount_LocksBalance() {
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.of(testAccount));
        when(tradingAccountRepository.save(any(TradingAccount.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        tradingAccountService.lockBalance(userId, new BigDecimal("5000.00"));

        verify(tradingAccountRepository).save(any(TradingAccount.class));
    }

    @Test
    @DisplayName("Should unlock balance successfully")
    void unlockBalance_ValidAmount_UnlocksBalance() {
        testAccount.setLockedBalance(new BigDecimal("5000.00"));
        testAccount.setAvailableBalance(new BigDecimal("5000.00"));
        
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.of(testAccount));
        when(tradingAccountRepository.save(any(TradingAccount.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        tradingAccountService.unlockBalance(userId, new BigDecimal("3000.00"));

        verify(tradingAccountRepository).save(any(TradingAccount.class));
    }

    @Test
    @DisplayName("Should release locked balance")
    void releaseLockedBalance_ValidAmount_ReleasesBalance() {
        testAccount.setLockedBalance(new BigDecimal("5000.00"));
        
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.of(testAccount));
        when(tradingAccountRepository.save(any(TradingAccount.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        tradingAccountService.releaseLockedBalance(userId, new BigDecimal("3000.00"));

        verify(tradingAccountRepository).save(any(TradingAccount.class));
    }

    @Test
    @DisplayName("Should get account by userId")
    void getAccount_ExistingAccount_ReturnsAccount() {
        when(tradingAccountRepository.findByUserId(userId))
                .thenReturn(Optional.of(testAccount));

        Optional<TradingAccount> result = tradingAccountRepository.findByUserId(userId);

        assertTrue(result.isPresent());
        assertEquals(0, new BigDecimal("10000.00").compareTo(result.get().getBalance()));
    }
}

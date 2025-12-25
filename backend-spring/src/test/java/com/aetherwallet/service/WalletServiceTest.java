package com.aetherwallet.service;

import com.aetherwallet.dto.WalletBalanceUpdateDTO;
import com.aetherwallet.dto.WalletDTO;
import com.aetherwallet.entity.User;
import com.aetherwallet.entity.Wallet;
import com.aetherwallet.exception.ResourceNotFoundException;
import com.aetherwallet.repository.UserRepository;
import com.aetherwallet.repository.WalletRepository;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("WalletService Unit Tests")
class WalletServiceTest {

    @Mock
    private WalletRepository walletRepository;

    @Mock
    private UserRepository userRepository;

    @Mock
    private PriceService priceService;

    @InjectMocks
    private WalletService walletService;

    private User testUser;
    private Wallet demoWallet;
    private Wallet realWallet;
    private UUID userId;

    @BeforeEach
    void setUp() {
        userId = UUID.randomUUID();
        
        testUser = User.builder()
            .id(userId)
            .email("test@example.com")
            .passwordHash("hashedPassword")
            .firstName("Test")
            .lastName("User")
            .build();

        demoWallet = Wallet.builder()
            .id(UUID.randomUUID())
            .user(testUser)
            .isDemo(true)
            .balanceUsdt(new BigDecimal("10000.00"))
            .balanceBtc(BigDecimal.ZERO)
            .balanceEth(BigDecimal.ZERO)
            .balanceBnb(BigDecimal.ZERO)
            .balanceSol(BigDecimal.ZERO)
            .isActive(true)
            .network("demo")
            .build();

        realWallet = Wallet.builder()
            .id(UUID.randomUUID())
            .user(testUser)
            .isDemo(false)
            .balanceUsdt(new BigDecimal("1000.00"))
            .balanceBtc(new BigDecimal("0.5"))
            .balanceEth(new BigDecimal("2.0"))
            .balanceBnb(BigDecimal.ZERO)
            .balanceSol(BigDecimal.ZERO)
            .isActive(true)
            .network("ethereum")
            .build();
    }

    // ============================================
    // getActiveWallet Tests
    // ============================================

    @Test
    @DisplayName("Should return demo wallet when demoMode is true")
    void getActiveWallet_DemoMode_ReturnsDemoWallet() {
        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.of(demoWallet));

        WalletDTO result = walletService.getActiveWallet(userId, true);

        assertNotNull(result);
        assertTrue(result.getIsDemo());
        assertEquals(new BigDecimal("10000.00"), result.getBalanceUsdt());
        verify(walletRepository).findByUserIdAndIsDemo(userId, true);
    }

    @Test
    @DisplayName("Should return real wallet when demoMode is false")
    void getActiveWallet_RealMode_ReturnsRealWallet() {
        when(walletRepository.findByUserIdAndIsDemo(userId, false))
            .thenReturn(Optional.of(realWallet));

        WalletDTO result = walletService.getActiveWallet(userId, false);

        assertNotNull(result);
        assertFalse(result.getIsDemo());
        assertEquals(new BigDecimal("1000.00"), result.getBalanceUsdt());
        verify(walletRepository).findByUserIdAndIsDemo(userId, false);
    }

    @Test
    @DisplayName("Should create demo wallet if not exists")
    void getActiveWallet_WalletNotExists_CreatesNewWallet() {
        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.empty());
        when(userRepository.findById(userId))
            .thenReturn(Optional.of(testUser));
        when(walletRepository.save(any(Wallet.class)))
            .thenReturn(demoWallet);

        WalletDTO result = walletService.getActiveWallet(userId, true);

        assertNotNull(result);
        verify(walletRepository).save(any(Wallet.class));
    }

    // ============================================
    // getAllWallets Tests
    // ============================================

    @Test
    @DisplayName("Should return all wallets for user")
    void getAllWallets_ReturnsAllWallets() {
        when(walletRepository.findByUserId(userId))
            .thenReturn(List.of(demoWallet, realWallet));

        List<WalletDTO> result = walletService.getAllWallets(userId);

        assertEquals(2, result.size());
        verify(walletRepository).findByUserId(userId);
    }

    @Test
    @DisplayName("Should return empty list when no wallets exist")
    void getAllWallets_NoWallets_ReturnsEmptyList() {
        when(walletRepository.findByUserId(userId))
            .thenReturn(List.of());

        List<WalletDTO> result = walletService.getAllWallets(userId);

        assertTrue(result.isEmpty());
    }

    // ============================================
    // getDemoWallet Tests
    // ============================================

    @Test
    @DisplayName("Should return demo wallet")
    void getDemoWallet_WalletExists_ReturnsWallet() {
        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.of(demoWallet));

        WalletDTO result = walletService.getDemoWallet(userId);

        assertNotNull(result);
        assertTrue(result.getIsDemo());
    }

    @Test
    @DisplayName("Should throw exception when demo wallet not found")
    void getDemoWallet_NotFound_ThrowsException() {
        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.empty());

        assertThrows(ResourceNotFoundException.class, 
            () -> walletService.getDemoWallet(userId));
    }

    // ============================================
    // resetDemoWallet Tests
    // ============================================

    @Test
    @DisplayName("Should reset demo wallet to initial balance")
    void resetDemoWallet_ResetsBalance() {
        demoWallet.setBalanceUsdt(new BigDecimal("5000.00"));
        demoWallet.setBalanceBtc(new BigDecimal("0.1"));
        
        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.of(demoWallet));
        when(walletRepository.save(any(Wallet.class)))
            .thenAnswer(inv -> inv.getArgument(0));

        WalletDTO result = walletService.resetDemoWallet(userId);

        assertEquals(new BigDecimal("10000.00"), result.getBalanceUsdt());
        assertEquals(BigDecimal.ZERO, result.getBalanceBtc());
        verify(walletRepository).save(any(Wallet.class));
    }

    // ============================================
    // updateBalance Tests
    // ============================================

    @Test
    @DisplayName("Should add balance correctly")
    void updateBalance_AddOperation_AddsBalance() {
        WalletBalanceUpdateDTO updateDTO = WalletBalanceUpdateDTO.builder()
            .currency("USDT")
            .amount(new BigDecimal("500.00"))
            .isDemo(true)
            .operation("ADD")
            .build();

        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.of(demoWallet));
        when(walletRepository.save(any(Wallet.class)))
            .thenAnswer(inv -> inv.getArgument(0));

        WalletDTO result = walletService.updateBalance(userId, updateDTO);

        assertEquals(new BigDecimal("10500.00"), result.getBalanceUsdt());
    }

    @Test
    @DisplayName("Should subtract balance correctly")
    void updateBalance_SubtractOperation_SubtractsBalance() {
        WalletBalanceUpdateDTO updateDTO = WalletBalanceUpdateDTO.builder()
            .currency("USDT")
            .amount(new BigDecimal("500.00"))
            .isDemo(true)
            .operation("SUBTRACT")
            .build();

        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.of(demoWallet));
        when(walletRepository.save(any(Wallet.class)))
            .thenAnswer(inv -> inv.getArgument(0));

        WalletDTO result = walletService.updateBalance(userId, updateDTO);

        assertEquals(new BigDecimal("9500.00"), result.getBalanceUsdt());
    }

    @Test
    @DisplayName("Should set balance correctly")
    void updateBalance_SetOperation_SetsBalance() {
        WalletBalanceUpdateDTO updateDTO = WalletBalanceUpdateDTO.builder()
            .currency("BTC")
            .amount(new BigDecimal("1.5"))
            .isDemo(true)
            .operation("SET")
            .build();

        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.of(demoWallet));
        when(walletRepository.save(any(Wallet.class)))
            .thenAnswer(inv -> inv.getArgument(0));

        WalletDTO result = walletService.updateBalance(userId, updateDTO);

        assertEquals(new BigDecimal("1.5"), result.getBalanceBtc());
    }

    // ============================================
    // getPortfolioWithPrices Tests
    // ============================================

    @Test
    @DisplayName("Should return portfolio with calculated values")
    void getPortfolioWithPrices_CalculatesCorrectly() {
        realWallet.setBalanceBtc(new BigDecimal("1.0"));
        realWallet.setBalanceEth(new BigDecimal("10.0"));
        
        when(walletRepository.findByUserIdAndIsDemo(userId, false))
            .thenReturn(Optional.of(realWallet));
        when(priceService.getPrice("BTC")).thenReturn(new BigDecimal("40000.00"));
        when(priceService.getPrice("ETH")).thenReturn(new BigDecimal("2000.00"));
        when(priceService.getPrice("BNB")).thenReturn(new BigDecimal("300.00"));
        when(priceService.getPrice("SOL")).thenReturn(new BigDecimal("100.00"));

        WalletDTO result = walletService.getPortfolioWithPrices(userId, false);

        assertNotNull(result.getTotalValueUsdt());
        assertEquals(new BigDecimal("40000.00"), result.getBtcPrice());
        // Total = 1000 USDT + (1 BTC * 40000) + (10 ETH * 2000) = 61000
        assertEquals(0, new BigDecimal("61000.00").compareTo(result.getTotalValueUsdt()));
    }

    // ============================================
    // createWalletsForUser Tests
    // ============================================

    @Test
    @DisplayName("Should create both demo and real wallets for new user")
    void createWalletsForUser_CreatesBothWallets() {
        when(walletRepository.save(any(Wallet.class)))
            .thenAnswer(inv -> inv.getArgument(0));

        walletService.createWalletsForUser(testUser);

        verify(walletRepository, times(2)).save(any(Wallet.class));
    }

    // ============================================
    // executeTrade Tests
    // ============================================

    @Test
    @DisplayName("Should execute buy trade correctly")
    void executeTrade_BuyOrder_UpdatesBalances() {
        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.of(demoWallet));
        when(walletRepository.save(any(Wallet.class)))
            .thenAnswer(inv -> inv.getArgument(0));

        // Buy 0.1 BTC at $40,000 = $4,000 USDT
        WalletDTO result = walletService.executeTrade(
            userId, true, "USDT", "BTC", 
            new BigDecimal("0.1"), new BigDecimal("40000.00")
        );

        // USDT should decrease by 4000, BTC should increase by 0.1
        assertEquals(0, new BigDecimal("6000.00").compareTo(result.getBalanceUsdt()));
        assertEquals(0, new BigDecimal("0.1").compareTo(result.getBalanceBtc()));
    }

    @Test
    @DisplayName("Should throw exception for insufficient balance")
    void executeTrade_InsufficientBalance_ThrowsException() {
        when(walletRepository.findByUserIdAndIsDemo(userId, true))
            .thenReturn(Optional.of(demoWallet));

        // Try to buy 1 BTC at $40,000 = $40,000 USDT (only have $10,000)
        assertThrows(IllegalArgumentException.class, () ->
            walletService.executeTrade(
                userId, true, "USDT", "BTC",
                new BigDecimal("1.0"), new BigDecimal("40000.00")
            )
        );
    }
}

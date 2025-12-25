package com.aetherwallet.entity;

import org.junit.jupiter.api.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@DisplayName("Wallet Entity Unit Tests")
class WalletTest {

    private User testUser;

    @BeforeEach
    void setUp() {
        testUser = User.builder()
                .id(UUID.randomUUID())
                .email("test@example.com")
                .build();
    }

    @Test
    @DisplayName("Should create wallet with builder")
    void createWallet_WithBuilder_Success() {
        UUID id = UUID.randomUUID();
        LocalDateTime now = LocalDateTime.now();

        Wallet wallet = Wallet.builder()
                .id(id)
                .user(testUser)
                .balanceUsdt(new BigDecimal("10000.00"))
                .balanceBtc(new BigDecimal("0.5"))
                .balanceEth(new BigDecimal("2.0"))
                .isDemo(true)
                .createdAt(now)
                .updatedAt(now)
                .build();

        assertEquals(id, wallet.getId());
        assertEquals(testUser, wallet.getUser());
        assertEquals(new BigDecimal("10000.00"), wallet.getBalanceUsdt());
        assertEquals(new BigDecimal("0.5"), wallet.getBalanceBtc());
        assertEquals(new BigDecimal("2.0"), wallet.getBalanceEth());
        assertTrue(wallet.getIsDemo());
    }

    @Test
    @DisplayName("Should get balance for different currencies")
    void wallet_GetBalance_Works() {
        Wallet wallet = Wallet.builder()
                .balanceUsdt(new BigDecimal("1000.00"))
                .balanceBtc(new BigDecimal("0.5"))
                .balanceEth(new BigDecimal("2.0"))
                .balanceBnb(new BigDecimal("10.0"))
                .balanceSol(new BigDecimal("50.0"))
                .build();

        assertEquals(new BigDecimal("1000.00"), wallet.getBalance("USDT"));
        assertEquals(new BigDecimal("0.5"), wallet.getBalance("BTC"));
        assertEquals(new BigDecimal("2.0"), wallet.getBalance("ETH"));
        assertEquals(new BigDecimal("10.0"), wallet.getBalance("BNB"));
        assertEquals(new BigDecimal("50.0"), wallet.getBalance("SOL"));
        assertEquals(BigDecimal.ZERO, wallet.getBalance("UNKNOWN"));
    }

    @Test
    @DisplayName("Should update balance for different currencies")
    void wallet_UpdateBalance_Works() {
        Wallet wallet = new Wallet();

        wallet.updateBalance("USDT", new BigDecimal("5000.00"));
        wallet.updateBalance("BTC", new BigDecimal("1.0"));
        wallet.updateBalance("ETH", new BigDecimal("10.0"));

        assertEquals(new BigDecimal("5000.00"), wallet.getBalanceUsdt());
        assertEquals(new BigDecimal("1.0"), wallet.getBalanceBtc());
        assertEquals(new BigDecimal("10.0"), wallet.getBalanceEth());
    }

    @Test
    @DisplayName("Should add to balance")
    void wallet_AddBalance_Works() {
        Wallet wallet = Wallet.builder()
                .balanceUsdt(new BigDecimal("1000.00"))
                .build();

        wallet.addBalance("USDT", new BigDecimal("500.00"));

        assertEquals(new BigDecimal("1500.00"), wallet.getBalanceUsdt());
    }

    @Test
    @DisplayName("Should subtract from balance")
    void wallet_SubtractBalance_Works() {
        Wallet wallet = Wallet.builder()
                .balanceUsdt(new BigDecimal("1000.00"))
                .build();

        wallet.subtractBalance("USDT", new BigDecimal("300.00"));

        assertEquals(new BigDecimal("700.00"), wallet.getBalanceUsdt());
    }

    @Test
    @DisplayName("Should throw exception for insufficient balance")
    void wallet_SubtractBalance_InsufficientBalance_ThrowsException() {
        Wallet wallet = Wallet.builder()
                .balanceUsdt(new BigDecimal("100.00"))
                .build();

        assertThrows(IllegalArgumentException.class, () ->
                wallet.subtractBalance("USDT", new BigDecimal("500.00")));
    }

    @Test
    @DisplayName("Should check sufficient balance")
    void wallet_HasSufficientBalance_Works() {
        Wallet wallet = Wallet.builder()
                .balanceUsdt(new BigDecimal("1000.00"))
                .build();

        assertTrue(wallet.hasSufficientBalance("USDT", new BigDecimal("500.00")));
        assertFalse(wallet.hasSufficientBalance("USDT", new BigDecimal("2000.00")));
    }

    @Test
    @DisplayName("Should calculate total value in USDT")
    void wallet_GetTotalValueUsdt_Works() {
        Wallet wallet = Wallet.builder()
                .balanceUsdt(new BigDecimal("1000.00"))
                .balanceBtc(new BigDecimal("0.1"))
                .balanceEth(new BigDecimal("1.0"))
                .balanceBnb(new BigDecimal("10.0"))
                .balanceSol(new BigDecimal("100.0"))
                .build();

        BigDecimal total = wallet.getTotalValueUsdt(
                new BigDecimal("50000.00"),  // BTC price
                new BigDecimal("3000.00"),   // ETH price
                new BigDecimal("300.00"),    // BNB price
                new BigDecimal("100.00")     // SOL price
        );

        // 1000 + (0.1 * 50000) + (1 * 3000) + (10 * 300) + (100 * 100)
        // = 1000 + 5000 + 3000 + 3000 + 10000 = 22000
        assertEquals(0, new BigDecimal("22000.00").compareTo(total));
    }

    @Test
    @DisplayName("Should reset demo wallet")
    void wallet_ResetDemoWallet_Works() {
        Wallet wallet = Wallet.builder()
                .isDemo(true)
                .balanceUsdt(new BigDecimal("5000.00"))
                .balanceBtc(new BigDecimal("1.0"))
                .build();

        wallet.resetDemoWallet();

        assertEquals(new BigDecimal("10000.00"), wallet.getBalanceUsdt());
        assertEquals(BigDecimal.ZERO, wallet.getBalanceBtc());
    }

    @Test
    @DisplayName("Should create demo wallet")
    void wallet_CreateDemoWallet_Works() {
        Wallet wallet = Wallet.createDemoWallet(testUser);

        assertTrue(wallet.getIsDemo());
        assertEquals(new BigDecimal("10000.00"), wallet.getBalanceUsdt());
        assertEquals(testUser, wallet.getUser());
    }

    @Test
    @DisplayName("Should create real wallet")
    void wallet_CreateRealWallet_Works() {
        Wallet wallet = Wallet.createRealWallet(testUser, "0x123456");

        assertFalse(wallet.getIsDemo());
        assertEquals("0x123456", wallet.getWalletAddress());
        assertEquals(testUser, wallet.getUser());
    }
}

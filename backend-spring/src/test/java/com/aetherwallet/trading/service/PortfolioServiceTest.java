package com.aetherwallet.trading.service;

import com.aetherwallet.trading.dto.PortfolioResponse;
import com.aetherwallet.trading.entity.Portfolio;
import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.PortfolioRepository;
import com.aetherwallet.trading.repository.TradingPairRepository;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Collections;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("PortfolioService Unit Tests")
class PortfolioServiceTest {

    @Mock
    private PortfolioRepository portfolioRepository;

    @Mock
    private TradingPairRepository tradingPairRepository;

    @Mock
    private PriceService priceService;

    @InjectMocks
    private PortfolioService portfolioService;

    private String userId;
    private TradingPair btcPair;
    private Portfolio btcPortfolio;

    @BeforeEach
    void setUp() {
        userId = UUID.randomUUID().toString();
        
        btcPair = TradingPair.builder()
                .id(UUID.randomUUID())
                .symbol("BTC/USD")
                .baseCurrency("BTC")
                .quoteCurrency("USD")
                .name("Bitcoin")
                .currentPrice(new BigDecimal("50000.00"))
                .isActive(true)
                .build();

        btcPortfolio = Portfolio.builder()
                .id(UUID.randomUUID())
                .userId(userId)
                .tradingPair(btcPair)
                .amount(new BigDecimal("1.5"))
                .averageBuyPrice(new BigDecimal("45000.00"))
                .totalCost(new BigDecimal("67500.00"))
                .build();
    }

    @Test
    @DisplayName("Should return empty portfolio for user with no holdings")
    void getPortfolio_NoHoldings_ReturnsEmpty() {
        when(portfolioRepository.findNonZeroHoldingsByUserId(userId))
                .thenReturn(Collections.emptyList());

        PortfolioResponse response = portfolioService.getPortfolio(userId);

        assertNotNull(response);
        assertEquals(0, BigDecimal.ZERO.compareTo(response.getTotalValue()));
        assertTrue(response.getHoldings().isEmpty());
    }

    @Test
    @DisplayName("Should calculate portfolio with holdings")
    void getPortfolio_WithHoldings_CalculatesCorrectly() {
        when(portfolioRepository.findNonZeroHoldingsByUserId(userId))
                .thenReturn(Arrays.asList(btcPortfolio));
        when(priceService.getPrice("BTC/USD"))
                .thenReturn(new BigDecimal("50000.00"));
        when(portfolioRepository.save(any(Portfolio.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        PortfolioResponse response = portfolioService.getPortfolio(userId);

        assertNotNull(response);
        assertEquals(1, response.getHoldings().size());
        // 1.5 BTC * 50000 = 75000
        assertEquals(0, new BigDecimal("75000.00").compareTo(response.getTotalValue()));
    }

    @Test
    @DisplayName("Should calculate profit/loss correctly")
    void getPortfolio_CalculatesProfitLoss() {
        when(portfolioRepository.findNonZeroHoldingsByUserId(userId))
                .thenReturn(Arrays.asList(btcPortfolio));
        when(priceService.getPrice("BTC/USD"))
                .thenReturn(new BigDecimal("50000.00"));
        when(portfolioRepository.save(any(Portfolio.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        PortfolioResponse response = portfolioService.getPortfolio(userId);

        // Cost: 1.5 * 45000 = 67500
        // Value: 1.5 * 50000 = 75000
        // Profit: 75000 - 67500 = 7500
        PortfolioResponse.PortfolioItem item = response.getHoldings().get(0);
        assertEquals(0, new BigDecimal("7500.0000").compareTo(item.getProfitLoss()));
    }

    @Test
    @DisplayName("Should update portfolio after buy trade")
    void updatePortfolioAfterTrade_Buy_UpdatesCorrectly() {
        UUID pairId = btcPair.getId();
        
        when(portfolioRepository.findByUserIdAndTradingPairId(userId, pairId))
                .thenReturn(Optional.of(btcPortfolio));
        when(tradingPairRepository.findById(pairId))
                .thenReturn(Optional.of(btcPair));
        when(portfolioRepository.save(any(Portfolio.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        portfolioService.updatePortfolioAfterTrade(
                userId, pairId, 
                new BigDecimal("0.5"), new BigDecimal("52000.00"), 
                true);

        verify(portfolioRepository).save(any(Portfolio.class));
    }

    @Test
    @DisplayName("Should update portfolio after sell trade")
    void updatePortfolioAfterTrade_Sell_UpdatesCorrectly() {
        UUID pairId = btcPair.getId();
        
        when(portfolioRepository.findByUserIdAndTradingPairId(userId, pairId))
                .thenReturn(Optional.of(btcPortfolio));
        when(tradingPairRepository.findById(pairId))
                .thenReturn(Optional.of(btcPair));
        when(portfolioRepository.save(any(Portfolio.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        portfolioService.updatePortfolioAfterTrade(
                userId, pairId, 
                new BigDecimal("0.5"), new BigDecimal("52000.00"), 
                false);

        verify(portfolioRepository).save(any(Portfolio.class));
    }

    @Test
    @DisplayName("Should create new portfolio entry for new holding")
    void updatePortfolioAfterTrade_NewHolding_CreatesPortfolio() {
        UUID pairId = btcPair.getId();
        
        when(portfolioRepository.findByUserIdAndTradingPairId(userId, pairId))
                .thenReturn(Optional.empty());
        when(tradingPairRepository.findById(pairId))
                .thenReturn(Optional.of(btcPair));
        when(portfolioRepository.save(any(Portfolio.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        portfolioService.updatePortfolioAfterTrade(
                userId, pairId, 
                new BigDecimal("1.0"), new BigDecimal("50000.00"), 
                true);

        verify(portfolioRepository).save(any(Portfolio.class));
    }

    @Test
    @DisplayName("Should throw exception for insufficient balance on sell")
    void updatePortfolioAfterTrade_InsufficientBalance_ThrowsException() {
        UUID pairId = btcPair.getId();
        
        when(portfolioRepository.findByUserIdAndTradingPairId(userId, pairId))
                .thenReturn(Optional.of(btcPortfolio));
        when(tradingPairRepository.findById(pairId))
                .thenReturn(Optional.of(btcPair));

        // Try to sell 10 BTC when only have 1.5
        assertThrows(IllegalArgumentException.class, () ->
                portfolioService.updatePortfolioAfterTrade(
                        userId, pairId, 
                        new BigDecimal("10.0"), new BigDecimal("50000.00"), 
                        false));
    }

    @Test
    @DisplayName("Should throw exception for invalid trading pair")
    void updatePortfolioAfterTrade_InvalidPair_ThrowsException() {
        UUID invalidPairId = UUID.randomUUID();
        
        when(portfolioRepository.findByUserIdAndTradingPairId(userId, invalidPairId))
                .thenReturn(Optional.empty());
        when(tradingPairRepository.findById(invalidPairId))
                .thenReturn(Optional.empty());

        assertThrows(IllegalArgumentException.class, () ->
                portfolioService.updatePortfolioAfterTrade(
                        userId, invalidPairId, 
                        new BigDecimal("1.0"), new BigDecimal("50000.00"), 
                        true));
    }
}

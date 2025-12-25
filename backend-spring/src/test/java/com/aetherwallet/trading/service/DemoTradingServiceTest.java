package com.aetherwallet.trading.service;

import com.aetherwallet.trading.dto.DemoPerformanceResponse;
import com.aetherwallet.trading.dto.DemoTradeRequest;
import com.aetherwallet.trading.dto.DemoTradeResponse;
import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.TradingPairRepository;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("DemoTradingService Unit Tests")
class DemoTradingServiceTest {

    @Mock
    private TradingPairRepository tradingPairRepository;

    @InjectMocks
    private DemoTradingService demoTradingService;

    private TradingPair testPair;
    private String userId;

    @BeforeEach
    void setUp() {
        userId = UUID.randomUUID().toString();
        testPair = TradingPair.builder()
                .id(UUID.randomUUID())
                .symbol("BTC/USD")
                .baseCurrency("BTC")
                .quoteCurrency("USD")
                .name("Bitcoin")
                .currentPrice(new BigDecimal("50000.00"))
                .change24h(BigDecimal.ZERO)
                .volume24h(BigDecimal.ZERO)
                .isActive(true)
                .build();
    }

    @Test
    @DisplayName("Should execute market buy trade successfully")
    void executeDemoTrade_MarketBuy_Success() {
        DemoTradeRequest request = new DemoTradeRequest();
        request.setSymbol("BTC/USD");
        request.setSide(DemoTradeRequest.TradeSide.BUY);
        request.setOrderType(DemoTradeRequest.OrderType.MARKET);
        request.setAmount(new BigDecimal("0.1"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(testPair));

        DemoTradeResponse response = demoTradingService.executeDemoTrade(userId, request);

        assertNotNull(response);
        assertEquals("BTC/USD", response.getSymbol());
        assertEquals("BUY", response.getSide());
        assertEquals("MARKET", response.getOrderType());
        assertEquals(new BigDecimal("0.1"), response.getAmount());
        assertEquals("EXECUTED", response.getStatus());
        assertNotNull(response.getExecutedAt());
        assertNotNull(response.getProfitLoss());
    }

    @Test
    @DisplayName("Should execute market sell trade successfully")
    void executeDemoTrade_MarketSell_Success() {
        DemoTradeRequest request = new DemoTradeRequest();
        request.setSymbol("BTC/USD");
        request.setSide(DemoTradeRequest.TradeSide.SELL);
        request.setOrderType(DemoTradeRequest.OrderType.MARKET);
        request.setAmount(new BigDecimal("0.5"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(testPair));

        DemoTradeResponse response = demoTradingService.executeDemoTrade(userId, request);

        assertNotNull(response);
        assertEquals("SELL", response.getSide());
        assertEquals("EXECUTED", response.getStatus());
    }

    @Test
    @DisplayName("Should execute limit order with custom price")
    void executeDemoTrade_LimitOrder_Success() {
        DemoTradeRequest request = new DemoTradeRequest();
        request.setSymbol("BTC/USD");
        request.setSide(DemoTradeRequest.TradeSide.BUY);
        request.setOrderType(DemoTradeRequest.OrderType.LIMIT);
        request.setAmount(new BigDecimal("1.0"));
        request.setPrice(new BigDecimal("48000.00"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(testPair));

        DemoTradeResponse response = demoTradingService.executeDemoTrade(userId, request);

        assertNotNull(response);
        assertEquals(new BigDecimal("48000.00"), response.getPrice());
        assertEquals("LIMIT", response.getOrderType());
    }

    @Test
    @DisplayName("Should throw exception for invalid trading pair")
    void executeDemoTrade_InvalidPair_ThrowsException() {
        DemoTradeRequest request = new DemoTradeRequest();
        request.setSymbol("INVALID/PAIR");
        request.setSide(DemoTradeRequest.TradeSide.BUY);
        request.setOrderType(DemoTradeRequest.OrderType.MARKET);
        request.setAmount(new BigDecimal("1.0"));

        when(tradingPairRepository.findBySymbol("INVALID/PAIR"))
                .thenReturn(Optional.empty());

        assertThrows(IllegalArgumentException.class, 
                () -> demoTradingService.executeDemoTrade(userId, request));
    }

    @Test
    @DisplayName("Should return empty performance for new user")
    void getDemoPerformance_NewUser_ReturnsEmpty() {
        String newUserId = UUID.randomUUID().toString();

        DemoPerformanceResponse response = demoTradingService.getDemoPerformance(newUserId);

        assertNotNull(response);
        assertEquals(0, response.getTotalTrades());
        assertEquals(0, response.getProfitableTrades());
        assertEquals(0, response.getLossMakingTrades());
        assertEquals(0, BigDecimal.ZERO.compareTo(response.getTotalProfitLoss()));
        assertEquals(0, BigDecimal.ZERO.compareTo(response.getWinRate()));
        assertFalse(response.isPassedDemo());
    }

    @Test
    @DisplayName("Should calculate performance after trades")
    void getDemoPerformance_AfterTrades_CalculatesCorrectly() {
        DemoTradeRequest request = new DemoTradeRequest();
        request.setSymbol("BTC/USD");
        request.setSide(DemoTradeRequest.TradeSide.BUY);
        request.setOrderType(DemoTradeRequest.OrderType.MARKET);
        request.setAmount(new BigDecimal("0.1"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(testPair));

        // Execute multiple trades
        for (int i = 0; i < 5; i++) {
            demoTradingService.executeDemoTrade(userId, request);
        }

        DemoPerformanceResponse response = demoTradingService.getDemoPerformance(userId);

        assertNotNull(response);
        assertEquals(5, response.getTotalTrades());
        assertNotNull(response.getTotalProfitLoss());
        assertNotNull(response.getWinRate());
    }

    @Test
    @DisplayName("Should calculate total price correctly")
    void executeDemoTrade_CalculatesTotalPrice() {
        DemoTradeRequest request = new DemoTradeRequest();
        request.setSymbol("BTC/USD");
        request.setSide(DemoTradeRequest.TradeSide.BUY);
        request.setOrderType(DemoTradeRequest.OrderType.MARKET);
        request.setAmount(new BigDecimal("2.0"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(testPair));

        DemoTradeResponse response = demoTradingService.executeDemoTrade(userId, request);

        // 2.0 * 50000 = 100000
        assertEquals(0, new BigDecimal("100000.00").compareTo(response.getTotalPrice()));
    }

    @Test
    @DisplayName("Should not pass demo with insufficient trades")
    void getDemoPerformance_InsufficientTrades_NotPassed() {
        DemoTradeRequest request = new DemoTradeRequest();
        request.setSymbol("BTC/USD");
        request.setSide(DemoTradeRequest.TradeSide.BUY);
        request.setOrderType(DemoTradeRequest.OrderType.MARKET);
        request.setAmount(new BigDecimal("0.1"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(testPair));

        // Only 5 trades (need 10)
        for (int i = 0; i < 5; i++) {
            demoTradingService.executeDemoTrade(userId, request);
        }

        DemoPerformanceResponse response = demoTradingService.getDemoPerformance(userId);

        assertFalse(response.isPassedDemo());
        assertTrue(response.getCertificationMessage().contains("Keep practicing"));
    }
}

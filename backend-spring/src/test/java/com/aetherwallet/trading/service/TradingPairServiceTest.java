package com.aetherwallet.trading.service;

import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.TradingPairRepository;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("TradingPairService Unit Tests")
class TradingPairServiceTest {

    @Mock
    private TradingPairRepository tradingPairRepository;

    @InjectMocks
    private TradingPairService tradingPairService;

    private TradingPair btcPair;
    private TradingPair ethPair;

    @BeforeEach
    void setUp() {
        btcPair = TradingPair.builder()
                .id(UUID.randomUUID())
                .symbol("BTC/USD")
                .baseCurrency("BTC")
                .quoteCurrency("USD")
                .name("Bitcoin")
                .currentPrice(new BigDecimal("50000.00"))
                .change24h(new BigDecimal("2.5"))
                .volume24h(new BigDecimal("1000000000"))
                .isActive(true)
                .pricePrecision(8)
                .amountPrecision(8)
                .build();

        ethPair = TradingPair.builder()
                .id(UUID.randomUUID())
                .symbol("ETH/USD")
                .baseCurrency("ETH")
                .quoteCurrency("USD")
                .name("Ethereum")
                .currentPrice(new BigDecimal("3000.00"))
                .change24h(new BigDecimal("-1.2"))
                .volume24h(new BigDecimal("500000000"))
                .isActive(true)
                .pricePrecision(8)
                .amountPrecision(8)
                .build();
    }

    @Test
    @DisplayName("Should return all active trading pairs")
    void getActivePairs_ReturnsActivePairs() {
        when(tradingPairRepository.findByIsActiveTrue())
                .thenReturn(Arrays.asList(btcPair, ethPair));

        List<TradingPair> result = tradingPairService.getActivePairs();

        assertNotNull(result);
        assertEquals(2, result.size());
        verify(tradingPairRepository).findByIsActiveTrue();
    }

    @Test
    @DisplayName("Should return empty list when no active pairs")
    void getActivePairs_NoActivePairs_ReturnsEmpty() {
        when(tradingPairRepository.findByIsActiveTrue())
                .thenReturn(Arrays.asList());

        List<TradingPair> result = tradingPairService.getActivePairs();

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    @Test
    @DisplayName("Should return active symbols")
    void getActiveSymbols_ReturnsSymbols() {
        when(tradingPairRepository.findByIsActiveTrue())
                .thenReturn(Arrays.asList(btcPair, ethPair));

        List<String> result = tradingPairService.getActiveSymbols();

        assertNotNull(result);
        assertEquals(2, result.size());
        assertTrue(result.contains("BTC/USD"));
        assertTrue(result.contains("ETH/USD"));
    }

    @Test
    @DisplayName("Should return pair data for valid symbol")
    void getPairData_ValidSymbol_ReturnsPairData() {
        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));

        TradingPairService.PairData result = tradingPairService.getPairData("BTC/USD");

        assertNotNull(result);
        assertEquals(new BigDecimal("2.5"), result.getChange24h());
        assertEquals(new BigDecimal("1000000000"), result.getVolume24h());
    }

    @Test
    @DisplayName("Should return null for invalid symbol")
    void getPairData_InvalidSymbol_ReturnsNull() {
        when(tradingPairRepository.findBySymbol("INVALID/PAIR"))
                .thenReturn(Optional.empty());

        TradingPairService.PairData result = tradingPairService.getPairData("INVALID/PAIR");

        assertNull(result);
    }

    @Test
    @DisplayName("Should initialize default pairs when repository is empty")
    void initializeDefaultPairs_EmptyRepository_CreatesPairs() {
        when(tradingPairRepository.count()).thenReturn(0L);
        when(tradingPairRepository.save(any(TradingPair.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        tradingPairService.initializeDefaultPairs();

        verify(tradingPairRepository, times(4)).save(any(TradingPair.class));
    }

    @Test
    @DisplayName("Should not initialize pairs when repository has data")
    void initializeDefaultPairs_NonEmptyRepository_DoesNothing() {
        when(tradingPairRepository.count()).thenReturn(4L);

        tradingPairService.initializeDefaultPairs();

        verify(tradingPairRepository, never()).save(any(TradingPair.class));
    }
}

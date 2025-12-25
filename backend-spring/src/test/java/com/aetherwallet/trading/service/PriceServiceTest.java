package com.aetherwallet.trading.service;

import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.TradingPairRepository;
import com.aetherwallet.trading.service.external.BinanceService;
import com.aetherwallet.trading.service.external.CoinGeckoService;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import reactor.core.publisher.Mono;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("PriceService Unit Tests")
class PriceServiceTest {

    @Mock
    private TradingPairRepository tradingPairRepository;

    @Mock
    private BinanceService binanceService;

    @Mock
    private CoinGeckoService coinGeckoService;

    @InjectMocks
    private PriceService priceService;

    private TradingPair btcPair;

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
                .build();
    }

    @Test
    @DisplayName("Should return price for valid symbol")
    void getPrice_ValidSymbol_ReturnsPrice() {
        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));

        BigDecimal price = priceService.getPrice("BTC/USD");

        assertNotNull(price);
        assertEquals(new BigDecimal("50000.00"), price);
    }

    @Test
    @DisplayName("Should fallback to external API for unknown symbol")
    void getPrice_UnknownSymbol_FallsBackToExternalApi() {
        when(tradingPairRepository.findBySymbol("NEW/PAIR"))
                .thenReturn(Optional.empty());
        when(binanceService.getPrice("NEW/PAIR"))
                .thenReturn(Mono.just(new BigDecimal("100.00")));

        BigDecimal price = priceService.getPrice("NEW/PAIR");

        assertEquals(new BigDecimal("100.00"), price);
    }

    @Test
    @DisplayName("Should fallback to CoinGecko when Binance fails")
    void getPrice_BinanceFails_FallsToCoinGecko() {
        when(tradingPairRepository.findBySymbol("ALT/PAIR"))
                .thenReturn(Optional.empty());
        when(binanceService.getPrice("ALT/PAIR"))
                .thenReturn(Mono.just(BigDecimal.ZERO));
        when(coinGeckoService.getPrice("ALT/PAIR"))
                .thenReturn(new BigDecimal("50.00"));

        BigDecimal price = priceService.getPrice("ALT/PAIR");

        assertEquals(new BigDecimal("50.00"), price);
    }

    @Test
    @DisplayName("Should return zero when all sources fail")
    void getPrice_AllSourcesFail_ReturnsZero() {
        when(tradingPairRepository.findBySymbol("INVALID/PAIR"))
                .thenReturn(Optional.empty());
        when(binanceService.getPrice("INVALID/PAIR"))
                .thenReturn(Mono.just(BigDecimal.ZERO));
        when(coinGeckoService.getPrice("INVALID/PAIR"))
                .thenReturn(null);

        BigDecimal price = priceService.getPrice("INVALID/PAIR");

        assertEquals(BigDecimal.ZERO, price);
    }

    @Test
    @DisplayName("Should get multiple prices")
    void getMultiplePrices_ReturnsAllPrices() {
        TradingPair ethPair = TradingPair.builder()
                .id(UUID.randomUUID())
                .symbol("ETH/USD")
                .currentPrice(new BigDecimal("3000.00"))
                .build();

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));
        when(tradingPairRepository.findBySymbol("ETH/USD"))
                .thenReturn(Optional.of(ethPair));

        Map<String, BigDecimal> prices = priceService.getMultiplePrices(
                new String[]{"BTC/USD", "ETH/USD"});

        assertEquals(2, prices.size());
        assertEquals(new BigDecimal("50000.00"), prices.get("BTC/USD"));
        assertEquals(new BigDecimal("3000.00"), prices.get("ETH/USD"));
    }

    @Test
    @DisplayName("Should update prices from external APIs")
    void updatePrices_UpdatesFromExternalApis() {
        when(tradingPairRepository.findByIsActiveTrue())
                .thenReturn(Arrays.asList(btcPair));
        when(binanceService.getTicker24h("BTC/USD"))
                .thenReturn(Mono.just(Map.of(
                        "price", new BigDecimal("51000.00"),
                        "change24h", new BigDecimal("2.0"),
                        "volume24h", new BigDecimal("1000000")
                )));
        when(tradingPairRepository.save(any(TradingPair.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        priceService.updatePrices();

        verify(tradingPairRepository).save(any(TradingPair.class));
    }

    @Test
    @DisplayName("Should fallback to CoinGecko when Binance ticker fails")
    void updatePrices_BinanceFails_FallsToCoinGecko() {
        when(tradingPairRepository.findByIsActiveTrue())
                .thenReturn(Arrays.asList(btcPair));
        when(binanceService.getTicker24h("BTC/USD"))
                .thenReturn(Mono.empty());
        when(coinGeckoService.getTicker24h("BTC/USD"))
                .thenReturn(Map.of(
                        "price", new BigDecimal("50500.00")
                ));
        when(tradingPairRepository.save(any(TradingPair.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        priceService.updatePrices();

        verify(tradingPairRepository).save(any(TradingPair.class));
    }
}

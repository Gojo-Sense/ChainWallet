package com.aetherwallet.trading.service;

import com.aetherwallet.trading.dto.CreateOrderRequest;
import com.aetherwallet.trading.dto.OrderResponse;
import com.aetherwallet.trading.entity.TradingAccount;
import com.aetherwallet.trading.entity.TradingOrder;
import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.TradingOrderRepository;
import com.aetherwallet.trading.repository.TradingPairRepository;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("OrderService Unit Tests")
class OrderServiceTest {

    @Mock
    private TradingOrderRepository tradingOrderRepository;

    @Mock
    private TradingPairRepository tradingPairRepository;

    @Mock
    private TradingAccountService tradingAccountService;

    @Mock
    private PriceService priceService;

    @InjectMocks
    private OrderService orderService;

    private String userId;
    private TradingPair btcPair;
    private TradingAccount testAccount;

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
                .minOrderAmount(new BigDecimal("0.0001"))
                .maxOrderAmount(new BigDecimal("1000"))
                .build();

        testAccount = TradingAccount.builder()
                .id(UUID.randomUUID())
                .userId(userId)
                .balance(new BigDecimal("100000.00"))
                .availableBalance(new BigDecimal("100000.00"))
                .lockedBalance(BigDecimal.ZERO)
                .build();
    }

    @Test
    @DisplayName("Should create market buy order successfully")
    void createOrder_MarketBuy_Success() {
        CreateOrderRequest request = new CreateOrderRequest();
        request.setSymbol("BTC/USD");
        request.setSide("BUY");
        request.setOrderType("MARKET");
        request.setAmount(new BigDecimal("0.1"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));
        when(tradingAccountService.getOrCreateAccount(userId))
                .thenReturn(testAccount);
        when(tradingOrderRepository.save(any(TradingOrder.class)))
                .thenAnswer(inv -> {
                    TradingOrder order = inv.getArgument(0);
                    order.setId(UUID.randomUUID());
                    return order;
                });
        when(priceService.getPrice("BTC/USD"))
                .thenReturn(new BigDecimal("50000.00"));

        OrderResponse response = orderService.createOrder(userId, request);

        assertNotNull(response);
        assertEquals("BTC/USD", response.getSymbol());
        assertEquals("BUY", response.getSide());
        verify(tradingAccountService).lockBalance(eq(userId), any(BigDecimal.class));
    }

    @Test
    @DisplayName("Should throw exception for invalid trading pair")
    void createOrder_InvalidPair_ThrowsException() {
        CreateOrderRequest request = new CreateOrderRequest();
        request.setSymbol("INVALID/PAIR");
        request.setSide("BUY");
        request.setOrderType("MARKET");
        request.setAmount(new BigDecimal("0.1"));

        when(tradingPairRepository.findBySymbol("INVALID/PAIR"))
                .thenReturn(Optional.empty());

        assertThrows(IllegalArgumentException.class, () ->
                orderService.createOrder(userId, request));
    }

    @Test
    @DisplayName("Should throw exception for inactive trading pair")
    void createOrder_InactivePair_ThrowsException() {
        btcPair.setIsActive(false);
        
        CreateOrderRequest request = new CreateOrderRequest();
        request.setSymbol("BTC/USD");
        request.setSide("BUY");
        request.setOrderType("MARKET");
        request.setAmount(new BigDecimal("0.1"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));

        assertThrows(IllegalArgumentException.class, () ->
                orderService.createOrder(userId, request));
    }

    @Test
    @DisplayName("Should throw exception for amount below minimum")
    void createOrder_AmountBelowMin_ThrowsException() {
        CreateOrderRequest request = new CreateOrderRequest();
        request.setSymbol("BTC/USD");
        request.setSide("BUY");
        request.setOrderType("MARKET");
        request.setAmount(new BigDecimal("0.00001")); // Below min

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));

        assertThrows(IllegalArgumentException.class, () ->
                orderService.createOrder(userId, request));
    }

    @Test
    @DisplayName("Should throw exception for insufficient balance")
    void createOrder_InsufficientBalance_ThrowsException() {
        testAccount.setAvailableBalance(new BigDecimal("100.00")); // Not enough
        
        CreateOrderRequest request = new CreateOrderRequest();
        request.setSymbol("BTC/USD");
        request.setSide("BUY");
        request.setOrderType("MARKET");
        request.setAmount(new BigDecimal("1.0")); // Would cost 50000

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));
        when(tradingAccountService.getOrCreateAccount(userId))
                .thenReturn(testAccount);

        assertThrows(IllegalArgumentException.class, () ->
                orderService.createOrder(userId, request));
    }

    @Test
    @DisplayName("Should create limit order with price")
    void createOrder_LimitOrder_Success() {
        CreateOrderRequest request = new CreateOrderRequest();
        request.setSymbol("BTC/USD");
        request.setSide("BUY");
        request.setOrderType("LIMIT");
        request.setAmount(new BigDecimal("0.1"));
        request.setPrice(new BigDecimal("48000.00"));

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));
        when(tradingAccountService.getOrCreateAccount(userId))
                .thenReturn(testAccount);
        when(tradingOrderRepository.save(any(TradingOrder.class)))
                .thenAnswer(inv -> {
                    TradingOrder order = inv.getArgument(0);
                    order.setId(UUID.randomUUID());
                    return order;
                });

        OrderResponse response = orderService.createOrder(userId, request);

        assertNotNull(response);
        assertEquals("LIMIT", response.getOrderType());
    }

    @Test
    @DisplayName("Should throw exception for limit order without price")
    void createOrder_LimitWithoutPrice_ThrowsException() {
        CreateOrderRequest request = new CreateOrderRequest();
        request.setSymbol("BTC/USD");
        request.setSide("BUY");
        request.setOrderType("LIMIT");
        request.setAmount(new BigDecimal("0.1"));
        // No price set

        when(tradingPairRepository.findBySymbol("BTC/USD"))
                .thenReturn(Optional.of(btcPair));

        assertThrows(IllegalArgumentException.class, () ->
                orderService.createOrder(userId, request));
    }

    @Test
    @DisplayName("Should cancel pending order")
    void cancelOrder_PendingOrder_Success() {
        UUID orderId = UUID.randomUUID();
        TradingOrder order = TradingOrder.builder()
                .id(orderId)
                .userId(userId)
                .tradingPair(btcPair)
                .side(TradingOrder.OrderSide.BUY)
                .orderType(TradingOrder.OrderType.MARKET)
                .status(TradingOrder.OrderStatus.PENDING)
                .amount(new BigDecimal("0.1"))
                .price(new BigDecimal("50000.00"))
                .totalCost(new BigDecimal("5000.00"))
                .filledAmount(BigDecimal.ZERO)
                .build();

        when(tradingOrderRepository.findByIdAndUserId(orderId, userId))
                .thenReturn(Optional.of(order));
        when(tradingOrderRepository.save(any(TradingOrder.class)))
                .thenAnswer(inv -> inv.getArgument(0));

        OrderResponse response = orderService.cancelOrder(userId, orderId);

        assertNotNull(response);
        assertEquals("CANCELLED", response.getStatus());
    }

    @Test
    @DisplayName("Should throw exception when cancelling non-existent order")
    void cancelOrder_NotFound_ThrowsException() {
        UUID orderId = UUID.randomUUID();
        when(tradingOrderRepository.findByIdAndUserId(orderId, userId))
                .thenReturn(Optional.empty());

        assertThrows(IllegalArgumentException.class, () ->
                orderService.cancelOrder(userId, orderId));
    }

    @Test
    @DisplayName("Should get user orders with pagination")
    void getUserOrders_ReturnsPaginatedOrders() {
        TradingOrder order = TradingOrder.builder()
                .id(UUID.randomUUID())
                .userId(userId)
                .tradingPair(btcPair)
                .side(TradingOrder.OrderSide.BUY)
                .orderType(TradingOrder.OrderType.MARKET)
                .status(TradingOrder.OrderStatus.FILLED)
                .amount(new BigDecimal("0.1"))
                .price(new BigDecimal("50000.00"))
                .filledAmount(new BigDecimal("0.1"))
                .totalCost(new BigDecimal("5000.00"))
                .build();

        Pageable pageable = PageRequest.of(0, 10);
        Page<TradingOrder> orderPage = new PageImpl<>(Arrays.asList(order));

        when(tradingOrderRepository.findByUserIdOrderByCreatedAtDesc(userId, pageable))
                .thenReturn(orderPage);

        Page<OrderResponse> result = orderService.getUserOrders(userId, pageable);

        assertNotNull(result);
        assertEquals(1, result.getTotalElements());
    }

    @Test
    @DisplayName("Should get specific order by ID")
    void getOrder_ValidId_ReturnsOrder() {
        UUID orderId = UUID.randomUUID();
        TradingOrder order = TradingOrder.builder()
                .id(orderId)
                .userId(userId)
                .tradingPair(btcPair)
                .side(TradingOrder.OrderSide.BUY)
                .orderType(TradingOrder.OrderType.MARKET)
                .status(TradingOrder.OrderStatus.FILLED)
                .amount(new BigDecimal("0.1"))
                .price(new BigDecimal("50000.00"))
                .filledAmount(new BigDecimal("0.1"))
                .totalCost(new BigDecimal("5000.00"))
                .build();

        when(tradingOrderRepository.findByIdAndUserId(orderId, userId))
                .thenReturn(Optional.of(order));

        Optional<OrderResponse> result = orderService.getOrder(userId, orderId);

        assertTrue(result.isPresent());
        assertEquals(orderId, result.get().getId());
    }
}

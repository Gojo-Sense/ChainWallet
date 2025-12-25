package com.aetherwallet.trading.service;

import com.aetherwallet.trading.dto.CreateOrderRequest;
import com.aetherwallet.trading.dto.OrderResponse;
import com.aetherwallet.trading.entity.TradingAccount;
import com.aetherwallet.trading.entity.TradingOrder;
import com.aetherwallet.trading.entity.TradingPair;
import com.aetherwallet.trading.repository.TradingOrderRepository;
import com.aetherwallet.trading.repository.TradingPairRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderService {
    private final TradingOrderRepository tradingOrderRepository;
    private final TradingPairRepository tradingPairRepository;
    private final TradingAccountService tradingAccountService;
    private final PriceService priceService;
    
    @Transactional
    public OrderResponse createOrder(String userId, CreateOrderRequest request) {
        // Validate trading pair
        Optional<TradingPair> pairOpt = tradingPairRepository.findBySymbol(request.getSymbol());
        if (pairOpt.isEmpty()) {
            throw new IllegalArgumentException("Trading pair not found: " + request.getSymbol());
        }
        
        TradingPair pair = pairOpt.get();
        if (!pair.getIsActive()) {
            throw new IllegalArgumentException("Trading pair is not active: " + request.getSymbol());
        }
        
        // Validate amount
        if (request.getAmount().compareTo(pair.getMinOrderAmount()) < 0) {
            throw new IllegalArgumentException("Amount is below minimum: " + pair.getMinOrderAmount());
        }
        if (request.getAmount().compareTo(pair.getMaxOrderAmount()) > 0) {
            throw new IllegalArgumentException("Amount exceeds maximum: " + pair.getMaxOrderAmount());
        }
        
        // Determine price
        BigDecimal orderPrice = determineOrderPrice(request, pair);
        
        // Calculate total cost
        BigDecimal totalCost = request.getAmount().multiply(orderPrice);
        
        // Validate balance for BUY orders
        if ("BUY".equalsIgnoreCase(request.getSide())) {
            TradingAccount account = tradingAccountService.getOrCreateAccount(userId);
            if (account.getAvailableBalance().compareTo(totalCost) < 0) {
                throw new IllegalArgumentException("Insufficient balance");
            }
            // Lock the balance
            tradingAccountService.lockBalance(userId, totalCost);
        }
        
        // Create order
        TradingOrder order = TradingOrder.builder()
                .userId(userId)
                .tradingPair(pair)
                .orderType(TradingOrder.OrderType.valueOf(request.getOrderType().toUpperCase()))
                .side(TradingOrder.OrderSide.valueOf(request.getSide().toUpperCase()))
                .status(TradingOrder.OrderStatus.PENDING)
                .amount(request.getAmount())
                .price(orderPrice)
                .filledAmount(BigDecimal.ZERO)
                .totalCost(totalCost)
                .stopPrice(request.getStopPrice())
                .expiresAt(request.getExpiresInMinutes() != null ? 
                    LocalDateTime.now().plusMinutes(request.getExpiresInMinutes()) : null)
                .build();
        
        order = tradingOrderRepository.save(order);
        
        // Execute market orders immediately
        if (order.getOrderType() == TradingOrder.OrderType.MARKET) {
            executeMarketOrder(order);
        }
        
        return convertToResponse(order);
    }
    
    private BigDecimal determineOrderPrice(CreateOrderRequest request, TradingPair pair) {
        if ("MARKET".equalsIgnoreCase(request.getOrderType())) {
            return pair.getCurrentPrice();
        } else if ("LIMIT".equalsIgnoreCase(request.getOrderType())) {
            if (request.getPrice() == null) {
                throw new IllegalArgumentException("Price is required for LIMIT orders");
            }
            return request.getPrice();
        } else if ("STOP_LOSS".equalsIgnoreCase(request.getOrderType())) {
            if (request.getStopPrice() == null) {
                throw new IllegalArgumentException("Stop price is required for STOP_LOSS orders");
            }
            return request.getStopPrice();
        }
        throw new IllegalArgumentException("Invalid order type: " + request.getOrderType());
    }
    
    @Transactional
    public void executeMarketOrder(TradingOrder order) {
        // For market orders, execute immediately at current price
        BigDecimal currentPrice = priceService.getPrice(order.getTradingPair().getSymbol());
        if (currentPrice.compareTo(BigDecimal.ZERO) == 0) {
            log.warn("Cannot execute market order {}: price is zero", order.getId());
            return;
        }
        
        order.setPrice(currentPrice);
        order.setFilledAmount(order.getAmount());
        order.setAveragePrice(currentPrice);
        order.setStatus(TradingOrder.OrderStatus.FILLED);
        order.setExecutedAt(LocalDateTime.now());
        
        tradingOrderRepository.save(order);
        
        // Update account balance
        if (order.getSide() == TradingOrder.OrderSide.BUY) {
            // Release locked balance and deduct
            tradingAccountService.releaseLockedBalance(order.getUserId(), order.getTotalCost());
            tradingAccountService.withdraw(order.getUserId(), order.getTotalCost());
        } else {
            // For SELL orders, add to balance (simplified - in real system, check portfolio)
            tradingAccountService.deposit(order.getUserId(), order.getTotalCost());
        }
    }
    
    @Transactional
    public OrderResponse cancelOrder(String userId, UUID orderId) {
        Optional<TradingOrder> orderOpt = tradingOrderRepository.findByIdAndUserId(orderId, userId);
        if (orderOpt.isEmpty()) {
            throw new IllegalArgumentException("Order not found");
        }
        
        TradingOrder order = orderOpt.get();
        if (order.getStatus() != TradingOrder.OrderStatus.PENDING && 
            order.getStatus() != TradingOrder.OrderStatus.PARTIALLY_FILLED) {
            throw new IllegalArgumentException("Cannot cancel order with status: " + order.getStatus());
        }
        
        order.setStatus(TradingOrder.OrderStatus.CANCELLED);
        order.setCancelledAt(LocalDateTime.now());
        order.setCancelReason("Cancelled by user");
        
        // Release locked balance for BUY orders
        if (order.getSide() == TradingOrder.OrderSide.BUY && order.getStatus() == TradingOrder.OrderStatus.PENDING) {
            BigDecimal lockedAmount = order.getTotalCost().subtract(
                order.getFilledAmount().multiply(order.getPrice())
            );
            tradingAccountService.unlockBalance(order.getUserId(), lockedAmount);
        }
        
        order = tradingOrderRepository.save(order);
        return convertToResponse(order);
    }
    
    public Page<OrderResponse> getUserOrders(String userId, Pageable pageable) {
        return tradingOrderRepository.findByUserIdOrderByCreatedAtDesc(userId, pageable)
                .map(this::convertToResponse);
    }
    
    public Optional<OrderResponse> getOrder(String userId, UUID orderId) {
        return tradingOrderRepository.findByIdAndUserId(orderId, userId)
                .map(this::convertToResponse);
    }
    
    private OrderResponse convertToResponse(TradingOrder order) {
        return OrderResponse.builder()
                .id(order.getId())
                .symbol(order.getTradingPair().getSymbol())
                .orderType(order.getOrderType().name())
                .side(order.getSide().name())
                .status(order.getStatus().name())
                .amount(order.getAmount())
                .price(order.getPrice())
                .filledAmount(order.getFilledAmount())
                .averagePrice(order.getAveragePrice())
                .totalCost(order.getTotalCost())
                .stopPrice(order.getStopPrice())
                .expiresAt(order.getExpiresAt())
                .executedAt(order.getExecutedAt())
                .cancelledAt(order.getCancelledAt())
                .cancelReason(order.getCancelReason())
                .createdAt(order.getCreatedAt())
                .updatedAt(order.getUpdatedAt())
                .build();
    }
}


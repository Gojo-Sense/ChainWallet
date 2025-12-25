package com.aetherwallet.trading.repository;

import com.aetherwallet.trading.entity.TradingOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface TradingOrderRepository extends JpaRepository<TradingOrder, UUID> {
    Page<TradingOrder> findByUserIdOrderByCreatedAtDesc(String userId, Pageable pageable);
    
    List<TradingOrder> findByUserIdAndStatus(String userId, TradingOrder.OrderStatus status);
    
    @Query("SELECT o FROM TradingOrder o WHERE o.userId = :userId AND o.status IN :statuses ORDER BY o.createdAt DESC")
    List<TradingOrder> findByUserIdAndStatusIn(@Param("userId") String userId, 
                                               @Param("statuses") List<TradingOrder.OrderStatus> statuses);
    
    @Query("SELECT o FROM TradingOrder o WHERE o.tradingPair.id = :pairId AND o.status = :status ORDER BY o.price ASC")
    List<TradingOrder> findActiveBuyOrdersByPair(@Param("pairId") UUID pairId, 
                                                  @Param("status") TradingOrder.OrderStatus status);
    
    @Query("SELECT o FROM TradingOrder o WHERE o.tradingPair.id = :pairId AND o.status = :status ORDER BY o.price DESC")
    List<TradingOrder> findActiveSellOrdersByPair(@Param("pairId") UUID pairId, 
                                                  @Param("status") TradingOrder.OrderStatus status);
    
    @Query("SELECT o FROM TradingOrder o WHERE o.status IN ('PENDING', 'PARTIALLY_FILLED') AND o.expiresAt < :now")
    List<TradingOrder> findExpiredOrders(@Param("now") LocalDateTime now);
    
    Optional<TradingOrder> findByIdAndUserId(UUID id, String userId);
}








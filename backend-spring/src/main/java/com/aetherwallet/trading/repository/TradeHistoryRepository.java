package com.aetherwallet.trading.repository;

import com.aetherwallet.trading.entity.TradeHistory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.UUID;

@Repository
public interface TradeHistoryRepository extends JpaRepository<TradeHistory, UUID> {
    Page<TradeHistory> findByUserIdOrderByCreatedAtDesc(String userId, Pageable pageable);
    
    @Query("SELECT th FROM TradeHistory th WHERE th.userId = :userId AND th.tradingPair.id = :pairId ORDER BY th.createdAt DESC")
    Page<TradeHistory> findByUserIdAndTradingPair(@Param("userId") String userId, 
                                                   @Param("pairId") UUID pairId, 
                                                   Pageable pageable);
    
    @Query("SELECT th FROM TradeHistory th WHERE th.userId = :userId AND th.createdAt >= :since ORDER BY th.createdAt DESC")
    Page<TradeHistory> findByUserIdSince(@Param("userId") String userId, 
                                         @Param("since") LocalDateTime since, 
                                         Pageable pageable);
}








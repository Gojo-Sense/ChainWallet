package com.aetherwallet.trading.repository;

import com.aetherwallet.trading.entity.Trade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Repository
public interface TradeRepository extends JpaRepository<Trade, UUID> {
    Page<Trade> findByUserIdOrderByCreatedAtDesc(String userId, Pageable pageable);
    
    @Query("SELECT t FROM Trade t WHERE t.userId = :userId AND t.tradingPair.id = :pairId ORDER BY t.createdAt DESC")
    Page<Trade> findByUserIdAndTradingPair(@Param("userId") String userId, 
                                           @Param("pairId") UUID pairId, 
                                           Pageable pageable);
    
    @Query("SELECT t FROM Trade t WHERE t.createdAt >= :since ORDER BY t.createdAt DESC")
    List<Trade> findRecentTrades(@Param("since") LocalDateTime since);
    
    @Query("SELECT COUNT(t) FROM Trade t WHERE t.userId = :userId")
    long countByUserId(@Param("userId") String userId);
}








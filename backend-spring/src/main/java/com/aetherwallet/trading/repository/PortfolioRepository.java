package com.aetherwallet.trading.repository;

import com.aetherwallet.trading.entity.Portfolio;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface PortfolioRepository extends JpaRepository<Portfolio, UUID> {
    List<Portfolio> findByUserId(String userId);
    
    Optional<Portfolio> findByUserIdAndTradingPairId(String userId, UUID tradingPairId);
    
    @Query("SELECT p FROM Portfolio p WHERE p.userId = :userId AND p.amount > 0")
    List<Portfolio> findNonZeroHoldingsByUserId(@Param("userId") String userId);
    
    @Query("SELECT SUM(p.currentValue) FROM Portfolio p WHERE p.userId = :userId")
    java.math.BigDecimal getTotalPortfolioValue(@Param("userId") String userId);
    
    boolean existsByUserIdAndTradingPairId(String userId, UUID tradingPairId);
}








package com.aetherwallet.trading.repository;

import com.aetherwallet.trading.entity.TradingPair;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface TradingPairRepository extends JpaRepository<TradingPair, UUID> {
    Optional<TradingPair> findBySymbol(String symbol);
    List<TradingPair> findByIsActiveTrue();
    boolean existsBySymbol(String symbol);
}








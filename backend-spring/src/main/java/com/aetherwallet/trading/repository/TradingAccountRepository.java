package com.aetherwallet.trading.repository;

import com.aetherwallet.trading.entity.TradingAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface TradingAccountRepository extends JpaRepository<TradingAccount, UUID> {
    Optional<TradingAccount> findByUserId(String userId);
    boolean existsByUserId(String userId);
}








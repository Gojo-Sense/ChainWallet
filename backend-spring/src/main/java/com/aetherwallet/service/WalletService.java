package com.aetherwallet.service;

import com.aetherwallet.dto.WalletBalanceUpdateDTO;
import com.aetherwallet.dto.WalletDTO;
import com.aetherwallet.entity.User;
import com.aetherwallet.entity.Wallet;
import com.aetherwallet.exception.ResourceNotFoundException;
import com.aetherwallet.repository.UserRepository;
import com.aetherwallet.repository.WalletRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * Wallet Service - Business logic for wallet operations
 * Supports both Demo and Real wallets for cross-platform trading
 */
@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class WalletService {

    private final WalletRepository walletRepository;
    private final UserRepository userRepository;
    private final PriceService priceService;

    /**
     * Get user's active wallet based on mode
     */
    @Transactional(readOnly = true)
    public WalletDTO getActiveWallet(UUID userId, boolean demoMode) {
        Wallet wallet = findWalletByUserAndMode(userId, demoMode);
        return WalletDTO.fromEntity(wallet);
    }

    /**
     * Get all wallets for user
     */
    @Transactional(readOnly = true)
    public List<WalletDTO> getAllWallets(UUID userId) {
        List<Wallet> wallets = walletRepository.findByUserId(userId);
        return wallets.stream()
            .map(WalletDTO::fromEntity)
            .collect(Collectors.toList());
    }

    /**
     * Get demo wallet
     */
    @Transactional(readOnly = true)
    public WalletDTO getDemoWallet(UUID userId) {
        Wallet wallet = walletRepository.findByUserIdAndIsDemo(userId, true)
            .orElseThrow(() -> new ResourceNotFoundException("Demo wallet not found"));
        return WalletDTO.fromEntity(wallet);
    }

    /**
     * Get real wallet
     */
    @Transactional(readOnly = true)
    public WalletDTO getRealWallet(UUID userId) {
        Wallet wallet = walletRepository.findByUserIdAndIsDemo(userId, false)
            .orElseThrow(() -> new ResourceNotFoundException("Real wallet not found"));
        return WalletDTO.fromEntity(wallet);
    }

    /**
     * Toggle wallet mode and return the new active wallet
     */
    public WalletDTO toggleWalletMode(UUID userId, boolean demoMode) {
        Wallet wallet = findWalletByUserAndMode(userId, demoMode);
        log.info("User {} switched to {} mode", userId, demoMode ? "Demo" : "Real");
        return WalletDTO.fromEntity(wallet);
    }

    /**
     * Reset demo wallet to initial balance
     */
    public WalletDTO resetDemoWallet(UUID userId) {
        Wallet wallet = walletRepository.findByUserIdAndIsDemo(userId, true)
            .orElseThrow(() -> new ResourceNotFoundException("Demo wallet not found"));
        
        wallet.resetDemoWallet();
        wallet = walletRepository.save(wallet);
        
        log.info("Demo wallet reset for user {}", userId);
        return WalletDTO.fromEntity(wallet);
    }

    /**
     * Update wallet balance
     */
    public WalletDTO updateBalance(UUID userId, WalletBalanceUpdateDTO updateDTO) {
        Wallet wallet = findWalletByUserAndMode(userId, updateDTO.isDemo());
        
        String operation = updateDTO.getOperation() != null ? updateDTO.getOperation() : "SET";
        
        switch (operation.toUpperCase()) {
            case "ADD" -> wallet.addBalance(updateDTO.getCurrency(), updateDTO.getAmount());
            case "SUBTRACT" -> wallet.subtractBalance(updateDTO.getCurrency(), updateDTO.getAmount());
            default -> wallet.updateBalance(updateDTO.getCurrency(), updateDTO.getAmount());
        }
        
        wallet = walletRepository.save(wallet);
        log.info("Balance updated for user {} - {} {} {}", 
            userId, operation, updateDTO.getAmount(), updateDTO.getCurrency());
        
        return WalletDTO.fromEntity(wallet);
    }

    /**
     * Get portfolio with current market prices
     */
    @Transactional(readOnly = true)
    public WalletDTO getPortfolioWithPrices(UUID userId, boolean demoMode) {
        Wallet wallet = findWalletByUserAndMode(userId, demoMode);
        WalletDTO dto = WalletDTO.fromEntity(wallet);
        
        // Get current prices
        BigDecimal btcPrice = priceService.getPrice("BTC");
        BigDecimal ethPrice = priceService.getPrice("ETH");
        BigDecimal bnbPrice = priceService.getPrice("BNB");
        BigDecimal solPrice = priceService.getPrice("SOL");
        
        return dto.withPrices(btcPrice, ethPrice, bnbPrice, solPrice);
    }

    /**
     * Create wallets for new user (both Demo and Real)
     */
    public void createWalletsForUser(User user) {
        // Create demo wallet with initial balance
        Wallet demoWallet = Wallet.createDemoWallet(user);
        walletRepository.save(demoWallet);
        
        // Create real wallet (empty)
        Wallet realWallet = Wallet.createRealWallet(user, null);
        walletRepository.save(realWallet);
        
        log.info("Created Demo and Real wallets for user {}", user.getId());
    }

    /**
     * Execute trade and update wallet balances
     */
    public WalletDTO executeTrade(UUID userId, boolean demoMode, String fromCurrency, 
                                   String toCurrency, BigDecimal amount, BigDecimal price) {
        Wallet wallet = findWalletByUserAndMode(userId, demoMode);
        
        BigDecimal totalCost = amount.multiply(price);
        
        // Deduct from source currency
        wallet.subtractBalance(fromCurrency, totalCost);
        
        // Add to target currency
        wallet.addBalance(toCurrency, amount);
        
        wallet = walletRepository.save(wallet);
        
        log.info("Trade executed for user {} - {} {} -> {} {}", 
            userId, totalCost, fromCurrency, amount, toCurrency);
        
        return WalletDTO.fromEntity(wallet);
    }

    // ============================================
    // Private Helper Methods
    // ============================================

    private Wallet findWalletByUserAndMode(UUID userId, boolean demoMode) {
        return walletRepository.findByUserIdAndIsDemo(userId, demoMode)
            .orElseGet(() -> {
                // Auto-create wallet if not exists
                User user = userRepository.findById(userId)
                    .orElseThrow(() -> new ResourceNotFoundException("User not found"));
                
                Wallet newWallet = demoMode 
                    ? Wallet.createDemoWallet(user) 
                    : Wallet.createRealWallet(user, null);
                
                return walletRepository.save(newWallet);
            });
    }
}

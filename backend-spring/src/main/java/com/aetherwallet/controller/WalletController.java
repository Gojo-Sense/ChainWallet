package com.aetherwallet.controller;

import com.aetherwallet.dto.WalletDTO;
import com.aetherwallet.dto.WalletBalanceUpdateDTO;
import com.aetherwallet.dto.ApiResponse;
import com.aetherwallet.entity.User;
import com.aetherwallet.service.WalletService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Wallet Controller - Cross-platform API for Flutter and React
 * 
 * Endpoints:
 * - GET  /api/v1/user/wallet          - Get user's active wallet (Demo or Real based on mode)
 * - GET  /api/v1/user/wallets         - Get all user wallets
 * - POST /api/v1/user/wallet/toggle   - Toggle between Demo and Real mode
 * - POST /api/v1/user/wallet/reset    - Reset demo wallet balance
 * - PUT  /api/v1/user/wallet/balance  - Update wallet balance (internal use)
 */
@RestController
@RequestMapping("/api/v1/user")
@RequiredArgsConstructor
@Tag(name = "Wallet", description = "Wallet management endpoints - Compatible with Flutter & React")
@SecurityRequirement(name = "bearerAuth")
public class WalletController {

    private final WalletService walletService;

    /**
     * Get user's active wallet based on current mode (Demo/Real)
     * This is the main endpoint consumed by both Flutter and React apps
     */
    @GetMapping("/wallet")
    @Operation(summary = "Get active wallet", description = "Returns the user's active wallet (Demo or Real based on current mode)")
    public ResponseEntity<ApiResponse<WalletDTO>> getActiveWallet(
            @AuthenticationPrincipal User user,
            @RequestParam(defaultValue = "false") boolean demoMode) {
        
        WalletDTO wallet = walletService.getActiveWallet(user.getId(), demoMode);
        return ResponseEntity.ok(ApiResponse.success(wallet, "Wallet retrieved successfully"));
    }

    /**
     * Get all wallets for the user (both Demo and Real)
     */
    @GetMapping("/wallets")
    @Operation(summary = "Get all wallets", description = "Returns all wallets (Demo and Real) for the user")
    public ResponseEntity<ApiResponse<List<WalletDTO>>> getAllWallets(
            @AuthenticationPrincipal User user) {
        
        List<WalletDTO> wallets = walletService.getAllWallets(user.getId());
        return ResponseEntity.ok(ApiResponse.success(wallets, "Wallets retrieved successfully"));
    }

    /**
     * Get demo wallet specifically
     */
    @GetMapping("/wallet/demo")
    @Operation(summary = "Get demo wallet", description = "Returns the user's demo wallet")
    public ResponseEntity<ApiResponse<WalletDTO>> getDemoWallet(
            @AuthenticationPrincipal User user) {
        
        WalletDTO wallet = walletService.getDemoWallet(user.getId());
        return ResponseEntity.ok(ApiResponse.success(wallet, "Demo wallet retrieved successfully"));
    }

    /**
     * Get real wallet specifically
     */
    @GetMapping("/wallet/real")
    @Operation(summary = "Get real wallet", description = "Returns the user's real wallet")
    public ResponseEntity<ApiResponse<WalletDTO>> getRealWallet(
            @AuthenticationPrincipal User user) {
        
        WalletDTO wallet = walletService.getRealWallet(user.getId());
        return ResponseEntity.ok(ApiResponse.success(wallet, "Real wallet retrieved successfully"));
    }

    /**
     * Toggle between Demo and Real mode
     */
    @PostMapping("/wallet/toggle")
    @Operation(summary = "Toggle wallet mode", description = "Switch between Demo and Real trading mode")
    public ResponseEntity<ApiResponse<WalletDTO>> toggleWalletMode(
            @AuthenticationPrincipal User user,
            @RequestParam boolean demoMode) {
        
        WalletDTO wallet = walletService.toggleWalletMode(user.getId(), demoMode);
        String mode = demoMode ? "Demo" : "Real";
        return ResponseEntity.ok(ApiResponse.success(wallet, "Switched to " + mode + " mode"));
    }

    /**
     * Reset demo wallet to initial balance
     */
    @PostMapping("/wallet/reset")
    @Operation(summary = "Reset demo wallet", description = "Reset demo wallet balance to initial $10,000 USDT")
    public ResponseEntity<ApiResponse<WalletDTO>> resetDemoWallet(
            @AuthenticationPrincipal User user) {
        
        WalletDTO wallet = walletService.resetDemoWallet(user.getId());
        return ResponseEntity.ok(ApiResponse.success(wallet, "Demo wallet reset successfully"));
    }

    /**
     * Update wallet balance (used after trade execution)
     */
    @PutMapping("/wallet/balance")
    @Operation(summary = "Update balance", description = "Update wallet balance for a specific currency")
    public ResponseEntity<ApiResponse<WalletDTO>> updateBalance(
            @AuthenticationPrincipal User user,
            @Valid @RequestBody WalletBalanceUpdateDTO updateDTO) {
        
        WalletDTO wallet = walletService.updateBalance(user.getId(), updateDTO);
        return ResponseEntity.ok(ApiResponse.success(wallet, "Balance updated successfully"));
    }

    /**
     * Get wallet portfolio summary with current prices
     */
    @GetMapping("/wallet/portfolio")
    @Operation(summary = "Get portfolio", description = "Get wallet portfolio with current market values")
    public ResponseEntity<ApiResponse<WalletDTO>> getPortfolio(
            @AuthenticationPrincipal User user,
            @RequestParam(defaultValue = "false") boolean demoMode) {
        
        WalletDTO portfolio = walletService.getPortfolioWithPrices(user.getId(), demoMode);
        return ResponseEntity.ok(ApiResponse.success(portfolio, "Portfolio retrieved successfully"));
    }
}

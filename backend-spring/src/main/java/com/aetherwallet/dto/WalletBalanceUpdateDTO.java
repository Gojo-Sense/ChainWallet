package com.aetherwallet.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.*;

import java.math.BigDecimal;

/**
 * DTO for updating wallet balance
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WalletBalanceUpdateDTO {

    @NotBlank(message = "Currency is required")
    private String currency;

    @NotNull(message = "Amount is required")
    @Positive(message = "Amount must be positive")
    private BigDecimal amount;

    private boolean isDemo;
    
    private String operation; // ADD, SUBTRACT, SET
}

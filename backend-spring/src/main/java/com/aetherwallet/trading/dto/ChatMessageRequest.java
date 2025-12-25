package com.aetherwallet.trading.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class ChatMessageRequest {
    @NotBlank
    private String message;
    private String userId;
    private String sessionId;
}
package com.aetherwallet.trading.dto;

import lombok.Data;

@Data
public class ChatMessageResponse {
    private String response;
    private String sessionId;
    private long timestamp;
    
    public ChatMessageResponse(String response, String sessionId) {
        this.response = response;
        this.sessionId = sessionId;
        this.timestamp = System.currentTimeMillis();
    }
}
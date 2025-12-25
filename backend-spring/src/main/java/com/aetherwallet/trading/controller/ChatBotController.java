package com.aetherwallet.trading.controller;

import com.aetherwallet.trading.config.UserContext;
import com.aetherwallet.trading.dto.ChatMessageRequest;
import com.aetherwallet.trading.dto.ChatMessageResponse;
import com.aetherwallet.trading.service.ChatBotService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/trading/chatbot")
@RequiredArgsConstructor
@CrossOrigin(origins = "*") // Allow requests from Angular frontend
public class ChatBotController {
    
    private final ChatBotService chatBotService;
    
    @PostMapping("/message")
    public ResponseEntity<ChatMessageResponse> sendMessage(@Valid @RequestBody ChatMessageRequest request) {
        // Get current user ID from context
        String userId = UserContext.getCurrentUserId();
        if (userId == null) {
            userId = "anonymous"; // Fallback for anonymous users
        }
        
        // Process the message and generate response
        ChatMessageResponse response = chatBotService.processMessage(
            request.getMessage(), 
            userId, 
            request.getSessionId()
        );
        
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> healthCheck() {
        return ResponseEntity.ok("ChatBot service is running");
    }
}
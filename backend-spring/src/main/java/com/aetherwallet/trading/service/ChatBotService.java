package com.aetherwallet.trading.service;

import com.aetherwallet.trading.dto.ChatMessageResponse;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class ChatBotService {
    
    private final Map<String, ConversationContext> conversationContexts = new HashMap<>();
    
    public ChatMessageResponse processMessage(String message, String userId, String sessionId) {
        // If no session ID provided, create a new one
        if (sessionId == null || sessionId.isEmpty()) {
            sessionId = UUID.randomUUID().toString();
        }
        
        // Get or create conversation context
        ConversationContext context = conversationContexts.computeIfAbsent(sessionId, 
            k -> new ConversationContext(userId));
        
        // Process the message and generate response
        String response = generateResponse(message, context);
        
        return new ChatMessageResponse(response, sessionId);
    }
    
    private String generateResponse(String message, ConversationContext context) {
        String lowerMessage = message.toLowerCase().trim();
        
        // Handle greetings
        if (lowerMessage.matches(".*(hello|hi|hey|greetings).*")) {
            return "Hello! I'm your trading assistant. How can I help you with your trading today? " +
                   "You can ask me about market analysis, trading strategies, or specific cryptocurrency information.";
        }
        
        // Handle market analysis requests
        if (lowerMessage.matches(".*(market|analysis|trend|price).*")) {
            return "I can help you analyze market trends. For specific cryptocurrency prices, " +
                   "you can check our trading pairs in the dashboard. Would you like me to explain " +
                   "some technical analysis strategies or fundamental analysis approaches?";
        }
        
        // Handle trading strategy requests
        if (lowerMessage.matches(".*(strategy|strategies|trade|trading).*")) {
            return "Here are some popular trading strategies:\n" +
                   "1. Day Trading - Buying and selling within the same day\n" +
                   "2. Swing Trading - Holding positions for several days to weeks\n" +
                   "3. Position Trading - Long-term holding based on fundamental analysis\n" +
                   "4. Scalping - Making small profits on frequent trades\n\n" +
                   "Risk management is crucial regardless of strategy. Always set stop-loss orders!";
        }
        
        // Handle portfolio advice
        if (lowerMessage.matches(".*(portfolio|diversify|allocation).*")) {
            return "A well-balanced portfolio typically includes:\n" +
                   "- 40-60% in established cryptocurrencies (Bitcoin, Ethereum)\n" +
                   "- 20-30% in promising altcoins\n" +
                   "- 10-20% in stablecoins for liquidity\n\n" +
                   "Remember to regularly rebalance based on market conditions and your risk tolerance.";
        }
        
        // Handle risk management
        if (lowerMessage.matches(".*(risk|risk management|stop loss|position sizing).*")) {
            return "Key risk management principles:\n" +
                   "1. Never risk more than 1-2% of your portfolio on a single trade\n" +
                   "2. Always use stop-loss orders\n" +
                   "3. Diversify across different assets and sectors\n" +
                   "4. Keep emotions out of trading decisions\n" +
                   "5. Have a clear entry and exit strategy before entering any trade";
        }
        
        // Handle specific cryptocurrency questions
        if (lowerMessage.contains("bitcoin") || lowerMessage.contains("btc")) {
            return "Bitcoin (BTC) is the first and largest cryptocurrency by market cap. " +
                   "It's often considered 'digital gold' and is less volatile than most altcoins. " +
                   "Consider dollar-cost averaging for long-term investment.";
        }
        
        if (lowerMessage.contains("ethereum") || lowerMessage.contains("eth")) {
            return "Ethereum (ETH) is the leading smart contract platform. " +
                   "Beyond being a cryptocurrency, it powers decentralized applications (dApps) " +
                   "and NFTs. Its transition to proof-of-stake has reduced energy consumption significantly.";
        }
        
        // Handle order placement help
        if (lowerMessage.matches(".*(order|buy|sell|place order).*")) {
            return "To place an order:\n" +
                   "1. Select a trading pair from the dashboard\n" +
                   "2. Choose order type (Market, Limit, or Stop-Loss)\n" +
                   "3. Enter amount and price (for limit orders)\n" +
                   "4. Review and confirm your order\n\n" +
                   "Market orders execute immediately at current price.\n" +
                   "Limit orders execute when price reaches your specified level.\n" +
                   "Stop-loss orders help protect against significant losses.";
        }
        
        // Handle account/portfolio inquiries
        if (lowerMessage.matches(".*(account|balance|portfolio|holdings).*")) {
            return "You can view your account balance and portfolio holdings in the dashboard. " +
                   "Your portfolio shows your current holdings, their value, and unrealized gains/losses. " +
                   "Would you like tips on portfolio management?";
        }
        
        // Handle help requests
        if (lowerMessage.matches(".*(help|commands|what can you do).*")) {
            return "I can help you with:\n" +
                   "- Market analysis and trends\n" +
                   "- Trading strategies and techniques\n" +
                   "- Risk management principles\n" +
                   "- Portfolio diversification advice\n" +
                   "- Cryptocurrency information\n" +
                   "- Order placement guidance\n" +
                   "- Account/portfolio inquiries\n\n" +
                   "Try asking: 'What's the market trend?', 'Explain day trading strategy', " +
                   "'How to manage risk?', or 'Tell me about Bitcoin'";
        }
        
        // Default response
        return "I'm here to help with your trading questions! You can ask me about:\n" +
               "- Market analysis and trends\n" +
               "- Trading strategies\n" +
               "- Risk management\n" +
               "- Portfolio diversification\n" +
               "- Specific cryptocurrencies\n" +
               "- How to place orders\n\n" +
               "Type 'help' to see all available commands.";
    }
    
    // Inner class to maintain conversation context
    private static class ConversationContext {
        private final String userId;
        private final long startTime;
        private int messageCount;
        
        public ConversationContext(String userId) {
            this.userId = userId;
            this.startTime = System.currentTimeMillis();
            this.messageCount = 0;
        }
        
        public void incrementMessageCount() {
            this.messageCount++;
        }
        
        public int getMessageCount() {
            return messageCount;
        }
        
        public String getUserId() {
            return userId;
        }
        
        public long getStartTime() {
            return startTime;
        }
    }
}
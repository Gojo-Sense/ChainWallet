const express = require('express');
const cors = require('cors');
const app = express();
const port = 8080;

// Middleware
app.use(cors());
app.use(express.json());

// Demo trading data
let demoTrades = [];
let demoPerformance = {
  totalTrades: 0,
  profitableTrades: 0,
  lossMakingTrades: 0,
  totalProfitLoss: 0,
  totalProfitLossPercentage: 0,
  winRate: 0,
  avgProfitPerTrade: 0,
  avgLossPerTrade: 0,
  passedDemo: false,
  certificationMessage: "Keep practicing! You need at least 10 trades with a 50%+ win rate and positive overall returns."
};

// Health check endpoint
app.get('/api/trading/simple-demo/health', (req, res) => {
  res.status(200).send('Simple Demo Trading service is running');
});

// Execute demo trade endpoint
app.post('/api/trading/simple-demo/trade', (req, res) => {
  const { symbol, side, amount, price, orderType } = req.body;
  
  // Simulate a demo trade response
  const trade = {
    id: Math.random().toString(36).substring(2, 15),
    symbol: symbol || 'BTC/USD',
    side: side || 'BUY',
    orderType: orderType || 'MARKET',
    amount: amount || 0.1,
    price: price || 50000,
    totalPrice: (amount || 0.1) * (price || 50000),
    status: 'EXECUTED',
    executedAt: new Date().toISOString(),
    profitLoss: (Math.random() * 200) - 50, // Random profit/loss between -50 and 150
    profitLossPercentage: ((Math.random() * 10) - 2).toFixed(2) // Random percentage between -2% and 8%
  };
  
  demoTrades.unshift(trade);
  
  // Update demo performance
  updateDemoPerformance();
  
  res.status(200).json(trade);
});

// Get demo performance endpoint
app.get('/api/trading/simple-demo/performance', (req, res) => {
  res.status(200).json(demoPerformance);
});

// Function to update demo performance metrics
function updateDemoPerformance() {
  demoPerformance.totalTrades = demoTrades.length;
  
  // Calculate profitable and loss-making trades
  demoPerformance.profitableTrades = demoTrades.filter(trade => trade.profitLoss > 0).length;
  demoPerformance.lossMakingTrades = demoTrades.filter(trade => trade.profitLoss < 0).length;
  
  // Calculate total profit/loss
  demoPerformance.totalProfitLoss = demoTrades.reduce((sum, trade) => sum + trade.profitLoss, 0);
  
  // Calculate average profit per trade
  if (demoPerformance.profitableTrades > 0) {
    const totalProfit = demoTrades
      .filter(trade => trade.profitLoss > 0)
      .reduce((sum, trade) => sum + trade.profitLoss, 0);
    demoPerformance.avgProfitPerTrade = totalProfit / demoPerformance.profitableTrades;
  } else {
    demoPerformance.avgProfitPerTrade = 0;
  }
  
  // Calculate average loss per trade
  if (demoPerformance.lossMakingTrades > 0) {
    const totalLoss = demoTrades
      .filter(trade => trade.profitLoss < 0)
      .reduce((sum, trade) => sum + Math.abs(trade.profitLoss), 0);
    demoPerformance.avgLossPerTrade = totalLoss / demoPerformance.lossMakingTrades;
  } else {
    demoPerformance.avgLossPerTrade = 0;
  }
  
  // Calculate win rate
  if (demoPerformance.totalTrades > 0) {
    demoPerformance.winRate = (demoPerformance.profitableTrades / demoPerformance.totalTrades) * 100;
  } else {
    demoPerformance.winRate = 0;
  }
  
  // Calculate total profit/loss percentage (based on a starting balance of $10,000)
  demoPerformance.totalProfitLossPercentage = (demoPerformance.totalProfitLoss / 10000) * 100;
  
  // Check if user has passed demo requirements
  demoPerformance.passedDemo = 
    demoPerformance.totalTrades >= 10 && 
    demoPerformance.winRate >= 50 && 
    demoPerformance.totalProfitLoss > 0;
    
  demoPerformance.certificationMessage = demoPerformance.passedDemo
    ? "Congratulations! You have successfully completed the demo trading challenge."
    : "Keep practicing! You need at least 10 trades with a 50%+ win rate and positive overall returns.";
}

// Start server
app.listen(port, () => {
  console.log(`Demo Trading Server listening at http://localhost:${port}`);
});
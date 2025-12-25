const express = require('express');
const cors = require('cors');
const jwt = require('jsonwebtoken');
const app = express();
const port = 3000;

// Secret for JWT signing (in a real app, this should be in environment variables)
const JWT_SECRET = 'aether-wallet-secret-key';

// Middleware
app.use(cors());
app.use(express.json());

// Mock data
let users = [
  { id: '1', name: 'John Doe', email: 'john@example.com', balance: 1000.00 }
];

let transactions = [
  { id: '1', userId: '1', type: 'deposit', amount: 500.00, timestamp: new Date().toISOString() },
  { id: '2', userId: '1', type: 'withdrawal', amount: 100.00, timestamp: new Date().toISOString() }
];

// Health check endpoint
app.get('/', (req, res) => {
  res.status(200).json({ message: 'Node.js Backend is running', version: '1.0.0' });
});

// Utility function to create JWT tokens
function generateTokens(user) {
  const accessToken = jwt.sign(
    { userId: user.id, email: user.email },
    JWT_SECRET,
    { expiresIn: '15m' }
  );
  
  const refreshToken = jwt.sign(
    { userId: user.id, email: user.email, type: 'refresh' },
    JWT_SECRET,
    { expiresIn: '7d' }
  );
  
  return { accessToken, refreshToken };
}

// Auth endpoints - Updated to match Angular AuthService expected format
app.post('/api/auth/login', (req, res) => {
  const { email, password } = req.body;
  // Mock login - in a real app, you would validate credentials
  const user = users.find(u => u.email === email);
  if (user) {
    const { accessToken, refreshToken } = generateTokens(user);
    res.status(200).json({
      success: true,
      data: {
        user: { id: user.id, email: user.email },
        accessToken: accessToken,
        refreshToken: refreshToken
      },
      message: 'Login successful'
    });
  } else {
    res.status(401).json({ 
      success: false,
      message: 'Invalid credentials' 
    });
  }
});

app.post('/api/auth/register', (req, res) => {
  const { email, password } = req.body;
  // Mock registration
  const newUser = {
    id: String(users.length + 1),
    name: 'New User',
    email,
    balance: 0.00
  };
  users.push(newUser);
  
  const { accessToken, refreshToken } = generateTokens(newUser);
  
  res.status(201).json({
    success: true,
    data: {
      user: { id: newUser.id, email: newUser.email },
      accessToken: accessToken,
      refreshToken: refreshToken
    },
    message: 'Registration successful'
  });
});

app.post('/api/auth/refresh', (req, res) => {
  const { refreshToken } = req.body;
  if (refreshToken) {
    try {
      const decoded = jwt.verify(refreshToken, JWT_SECRET);
      if (decoded.type === 'refresh') {
        const user = users.find(u => u.id === decoded.userId);
        if (user) {
          const { accessToken, refreshToken: newRefreshToken } = generateTokens(user);
          res.status(200).json({
            success: true,
            data: {
              user: { id: user.id, email: user.email },
              accessToken: accessToken,
              refreshToken: newRefreshToken
            },
            message: 'Token refreshed'
          });
        } else {
          res.status(401).json({ 
            success: false,
            message: 'User not found' 
          });
        }
      } else {
        res.status(401).json({ 
          success: false,
          message: 'Invalid refresh token' 
        });
      }
    } catch (err) {
      res.status(401).json({ 
        success: false,
        message: 'Invalid refresh token' 
      });
    }
  } else {
    res.status(400).json({ 
      success: false,
      message: 'Refresh token required' 
    });
  }
});

app.post('/api/auth/logout', (req, res) => {
  res.status(200).json({
    success: true,
    message: 'Logout successful'
  });
});

// Wallet endpoints
app.get('/api/wallet/balance', (req, res) => {
  // Mock balance retrieval
  const user = users[0]; // Just return the first user's balance for demo
  res.status(200).json({
    success: true,
    data: {
      balance: user.balance,
      currency: 'USD'
    },
    message: 'Balance retrieved successfully'
  });
});

app.post('/api/wallet/deposit', (req, res) => {
  const { amount } = req.body;
  const user = users[0]; // Just update the first user for demo
  user.balance += parseFloat(amount);
  
  const transaction = {
    id: String(transactions.length + 1),
    userId: user.id,
    type: 'deposit',
    amount: parseFloat(amount),
    timestamp: new Date().toISOString()
  };
  transactions.push(transaction);
  
  res.status(200).json({
    success: true,
    data: {
      message: 'Deposit successful',
      newBalance: user.balance,
      transaction
    },
    message: 'Deposit completed'
  });
});

app.post('/api/wallet/withdraw', (req, res) => {
  const { amount } = req.body;
  const user = users[0]; // Just update the first user for demo
  const withdrawalAmount = parseFloat(amount);
  
  if (user.balance >= withdrawalAmount) {
    user.balance -= withdrawalAmount;
    
    const transaction = {
      id: String(transactions.length + 1),
      userId: user.id,
      type: 'withdrawal',
      amount: withdrawalAmount,
      timestamp: new Date().toISOString()
    };
    transactions.push(transaction);
    
    res.status(200).json({
      success: true,
      data: {
        message: 'Withdrawal successful',
        newBalance: user.balance,
        transaction
      },
      message: 'Withdrawal completed'
    });
  } else {
    res.status(400).json({ 
      success: false,
      message: 'Insufficient balance' 
    });
  }
});

// Transaction history
app.get('/api/wallet/transactions', (req, res) => {
  // Return last 10 transactions for demo
  const recentTransactions = transactions.slice(-10).reverse();
  res.status(200).json({
    success: true,
    data: recentTransactions,
    message: 'Transactions retrieved successfully'
  });
});

// Start server
app.listen(port, () => {
  console.log(`Mock Node.js Backend Server listening at http://localhost:${port}`);
});
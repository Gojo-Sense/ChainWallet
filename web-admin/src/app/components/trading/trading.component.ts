import { Component, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NavSidebarComponent } from '../shared/nav-sidebar.component';
import { PriceApiService, PriceData, OrderBookEntry, Trade } from '../../services/price-api.service';
import { ChartComponent } from './chart/chart.component';
import { Subscription } from 'rxjs';

type UserType = 'beginner' | 'professional' | null;
type OrderType = 'market' | 'limit' | 'stop-loss';
type TradeSide = 'buy' | 'sell';

interface TradingPair {
  symbol: string;
  name: string;
  price: number;
  change24h: number;
}

@Component({
  selector: 'app-trading',
  standalone: true,
  imports: [CommonModule, FormsModule, NavSidebarComponent, ChartComponent],
  templateUrl: './trading.component.html',
  styleUrl: './trading.component.css'
})
export class TradingComponent implements OnInit, OnDestroy {
  userType: UserType = null;
  showUserTypeModal = false;
  showTutorial = false;
  currentTutorialStep = 0;
  
  tradingBalance = 0;
  availableBalance = 0;
  selectedPair: TradingPair | null = null;
  orderType: OrderType = 'market';
  tradeSide: TradeSide = 'buy';
  orderAmount = 0;
  orderPrice = 0;
  
  tradingPairs: TradingPair[] = [
    { symbol: 'BTC', name: 'Bitcoin', price: 0, change24h: 0 },
    { symbol: 'ETH', name: 'Ethereum', price: 0, change24h: 0 },
    { symbol: 'BNB', name: 'Binance Coin', price: 0, change24h: 0 },
    { symbol: 'SOL', name: 'Solana', price: 0, change24h: 0 }
  ];

  orderBook: { bids: OrderBookEntry[], asks: OrderBookEntry[] } = { bids: [], asks: [] };
  liveTrades: Trade[] = [];
  portfolioValue = 0;

  private priceSubscription?: Subscription;
  private orderBookSubscription?: Subscription;
  private tradesSubscription?: Subscription;
  
  depositAmount = 0;
  depositMethod = 'bank';
  showDepositForm = false;
  
  pendingOrders: any[] = [];
  tradeHistory: any[] = [];
  
  tutorialSteps = [
    {
      title: 'Welcome to Trading',
      description: 'This is your trading account. Here you can buy and sell cryptocurrencies.',
      target: 'trading-overview'
    },
    {
      title: 'Deposit Funds',
      description: 'First, you need to deposit money into your trading account. Click the "Deposit" button to add funds.',
      target: 'deposit-section'
    },
    {
      title: 'Select Trading Pair',
      description: 'Choose which cryptocurrency you want to trade. Click on a pair like BTC/USD to select it.',
      target: 'trading-pairs'
    },
    {
      title: 'Buy or Sell',
      description: 'Choose whether you want to buy (purchase) or sell (sell) the cryptocurrency.',
      target: 'trade-side'
    },
    {
      title: 'Order Type',
      description: 'Market order executes immediately at current price. Limit order waits for your target price.',
      target: 'order-type'
    },
    {
      title: 'Place Order',
      description: 'Enter the amount you want to trade and click "Place Order" to execute your trade.',
      target: 'place-order'
    }
  ];

  constructor(private priceApi: PriceApiService) {}

  ngOnInit(): void {
    // Check if user type is already set
    const savedUserType = localStorage.getItem('tradingUserType') as UserType;
    if (savedUserType) {
      this.userType = savedUserType;
    } else {
      this.showUserTypeModal = true;
    }
    
    // Load real trading data
    this.loadTradingData();
    this.loadRealTimePrices();
  }

  ngOnDestroy(): void {
    this.priceApi.disconnectBinanceWebSocket();
    if (this.priceSubscription) {
      this.priceSubscription.unsubscribe();
    }
    if (this.orderBookSubscription) {
      this.orderBookSubscription.unsubscribe();
    }
    if (this.tradesSubscription) {
      this.tradesSubscription.unsubscribe();
    }
  }

  private loadRealTimePrices(): void {
    // Load initial prices
    const symbols = this.tradingPairs.map(p => p.symbol);
    this.priceApi.getMultiplePrices(symbols).subscribe({
      next: (prices) => {
        this.tradingPairs.forEach(pair => {
          const price = prices.get(pair.symbol);
          if (price) {
            pair.price = price;
          }
        });
        if (!this.selectedPair && this.tradingPairs.length > 0) {
          this.selectedPair = this.tradingPairs[0];
          this.selectTradingPair(this.selectedPair);
        }
      }
    });

    // Subscribe to real-time price updates
    this.priceSubscription = this.priceApi.priceUpdates$.subscribe({
      next: (priceData: PriceData) => {
        const pair = this.tradingPairs.find(p => p.symbol === priceData.symbol);
        if (pair) {
          pair.price = priceData.price;
          pair.change24h = priceData.change24h;
          if (this.selectedPair?.symbol === pair.symbol) {
            this.orderPrice = priceData.price;
          }
        }
      }
    });

    // Subscribe to order book updates
    this.orderBookSubscription = this.priceApi.orderBookUpdates$.subscribe({
      next: (orderBook) => {
        this.orderBook = orderBook;
      }
    });

    // Subscribe to live trades
    this.tradesSubscription = this.priceApi.tradesUpdates$.subscribe({
      next: (trades) => {
        this.liveTrades = [...trades, ...this.liveTrades].slice(0, 20);
      }
    });
  }

  selectUserType(type: 'beginner' | 'professional'): void {
    this.userType = type;
    localStorage.setItem('tradingUserType', type);
    this.showUserTypeModal = false;
    
    if (type === 'beginner') {
      this.showTutorial = true;
      this.currentTutorialStep = 0;
    }
  }

  nextTutorialStep(): void {
    if (this.currentTutorialStep < this.tutorialSteps.length - 1) {
      this.currentTutorialStep++;
    } else {
      this.completeTutorial();
    }
  }

  previousTutorialStep(): void {
    if (this.currentTutorialStep > 0) {
      this.currentTutorialStep--;
    }
  }

  skipTutorial(): void {
    this.showTutorial = false;
    this.currentTutorialStep = 0;
  }

  completeTutorial(): void {
    this.showTutorial = false;
    this.currentTutorialStep = 0;
    localStorage.setItem('tutorialCompleted', 'true');
  }

  openDepositForm(): void {
    this.showDepositForm = true;
  }

  closeDepositForm(): void {
    this.showDepositForm = false;
    this.depositAmount = 0;
  }

  submitDeposit(): void {
    if (this.depositAmount > 0) {
      this.tradingBalance += this.depositAmount;
      this.availableBalance += this.depositAmount;
      this.closeDepositForm();
      alert(`Successfully deposited $${this.depositAmount.toFixed(2)}`);
    }
  }

  selectTradingPair(pair: TradingPair): void {
    this.selectedPair = pair;
    this.orderPrice = pair.price;
    // Connect to WebSocket for this pair
    this.priceApi.connectBinanceWebSocket(pair.symbol);
  }

  placeOrder(): void {
    if (!this.selectedPair || this.orderAmount <= 0) {
      alert('Please select a trading pair and enter an amount');
      return;
    }

    const totalCost = this.orderType === 'market' 
      ? this.orderAmount * this.selectedPair.price 
      : this.orderAmount * this.orderPrice;

    if (this.tradeSide === 'buy' && totalCost > this.availableBalance) {
      alert('Insufficient balance');
      return;
    }

    const order = {
      id: Date.now().toString(),
      pair: this.selectedPair.symbol,
      side: this.tradeSide,
      type: this.orderType,
      amount: this.orderAmount,
      price: this.orderType === 'market' ? this.selectedPair.price : this.orderPrice,
      status: 'pending',
      timestamp: new Date()
    };

    this.pendingOrders.push(order);
    
    if (this.tradeSide === 'buy') {
      this.availableBalance -= totalCost;
    } else {
      this.availableBalance += totalCost;
    }

    alert(`Order placed successfully!`);
    this.orderAmount = 0;
  }

  private loadTradingData(): void {
    // Mock data loading
    this.tradingBalance = 10000;
    this.availableBalance = 10000;
    this.calculatePortfolioValue();
  }

  private calculatePortfolioValue(): void {
    // Calculate portfolio value based on holdings and current prices
    // This is a simplified version - in production, track actual holdings
    this.portfolioValue = this.tradingBalance;
  }

  formatTime(timestamp: number | string | Date): string {
    const date = typeof timestamp === 'number' || typeof timestamp === 'string' 
      ? new Date(timestamp) 
      : timestamp;
    return date.toLocaleTimeString();
  }
}


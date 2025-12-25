import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of, BehaviorSubject } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { API_CONFIG } from '../config/api.config';

export interface DemoTradeRequest {
  symbol: string;
  side: 'BUY' | 'SELL';
  amount: number;
  price?: number;
  orderType: 'MARKET' | 'LIMIT' | 'STOP_LOSS';
}

export interface DemoTradeResponse {
  id: string;
  symbol: string;
  side: string;
  orderType: string;
  amount: number;
  price: number;
  totalPrice: number;
  status: string;
  executedAt: string;
  profitLoss: number;
  profitLossPercentage: number;
}

export interface DemoPerformanceResponse {
  totalTrades: number;
  profitableTrades: number;
  lossMakingTrades: number;
  totalProfitLoss: number;
  totalProfitLossPercentage: number;
  winRate: number;
  avgProfitPerTrade: number;
  avgLossPerTrade: number;
  passedDemo: boolean;
  certificationMessage: string;
}

@Injectable({
  providedIn: 'root'
})
export class DemoTradingService {
  private baseUrl = API_CONFIG.tradingBaseUrl;
  
  // Local storage for demo trades when backend is unavailable
  private demoTrades: DemoTradeResponse[] = [];
  private demoBalance = 10000;

  constructor(private http: HttpClient) {
    // Load from localStorage if available
    const savedTrades = localStorage.getItem('demoTrades');
    const savedBalance = localStorage.getItem('demoBalance');
    if (savedTrades) {
      this.demoTrades = JSON.parse(savedTrades);
    }
    if (savedBalance) {
      this.demoBalance = parseFloat(savedBalance);
    }
  }

  executeDemoTrade(request: DemoTradeRequest): Observable<DemoTradeResponse> {
    return this.http.post<DemoTradeResponse>(`${this.baseUrl}/simple-demo/trade`, request).pipe(
      catchError(() => {
        // Fallback to local demo trading
        return of(this.executeLocalDemoTrade(request));
      })
    );
  }

  private executeLocalDemoTrade(request: DemoTradeRequest): DemoTradeResponse {
    const price = request.price || 0;
    const totalPrice = request.amount * price;
    
    // Simulate profit/loss (random for demo)
    const profitLossPercent = (Math.random() - 0.4) * 10; // Slightly biased towards profit
    const profitLoss = totalPrice * (profitLossPercent / 100);
    
    const trade: DemoTradeResponse = {
      id: 'demo-' + Date.now(),
      symbol: request.symbol,
      side: request.side,
      orderType: request.orderType,
      amount: request.amount,
      price: price,
      totalPrice: totalPrice,
      status: 'EXECUTED',
      executedAt: new Date().toISOString(),
      profitLoss: profitLoss,
      profitLossPercentage: profitLossPercent
    };
    
    this.demoTrades.unshift(trade);
    this.demoBalance += profitLoss;
    
    // Save to localStorage
    localStorage.setItem('demoTrades', JSON.stringify(this.demoTrades.slice(0, 100)));
    localStorage.setItem('demoBalance', this.demoBalance.toString());
    
    return trade;
  }

  getDemoPerformance(): Observable<DemoPerformanceResponse> {
    return this.http.get<DemoPerformanceResponse>(`${this.baseUrl}/simple-demo/performance`).pipe(
      catchError(() => {
        // Fallback to local calculation
        return of(this.calculateLocalPerformance());
      })
    );
  }

  private calculateLocalPerformance(): DemoPerformanceResponse {
    const totalTrades = this.demoTrades.length;
    const profitableTrades = this.demoTrades.filter(t => t.profitLoss > 0).length;
    const lossMakingTrades = this.demoTrades.filter(t => t.profitLoss < 0).length;
    const totalProfitLoss = this.demoTrades.reduce((sum, t) => sum + t.profitLoss, 0);
    const winRate = totalTrades > 0 ? (profitableTrades / totalTrades) * 100 : 0;
    
    const profits = this.demoTrades.filter(t => t.profitLoss > 0).map(t => t.profitLoss);
    const losses = this.demoTrades.filter(t => t.profitLoss < 0).map(t => t.profitLoss);
    
    const avgProfitPerTrade = profits.length > 0 ? profits.reduce((a, b) => a + b, 0) / profits.length : 0;
    const avgLossPerTrade = losses.length > 0 ? losses.reduce((a, b) => a + b, 0) / losses.length : 0;
    
    // Pass demo if: at least 10 trades, win rate > 50%, and positive P/L
    const passedDemo = totalTrades >= 10 && winRate > 50 && totalProfitLoss > 0;
    
    return {
      totalTrades,
      profitableTrades,
      lossMakingTrades,
      totalProfitLoss,
      totalProfitLossPercentage: (totalProfitLoss / 10000) * 100,
      winRate,
      avgProfitPerTrade,
      avgLossPerTrade,
      passedDemo,
      certificationMessage: passedDemo 
        ? 'Congratulations! You have passed the demo trading challenge!' 
        : `Complete ${Math.max(0, 10 - totalTrades)} more trades with >50% win rate to unlock real trading.`
    };
  }

  healthCheck(): Observable<string> {
    return this.http.get(`${this.baseUrl}/simple-demo/health`, { responseType: 'text' }).pipe(
      catchError(() => of('Demo trading service running locally'))
    );
  }
  
  resetDemo(): void {
    this.demoTrades = [];
    this.demoBalance = 10000;
    localStorage.removeItem('demoTrades');
    localStorage.removeItem('demoBalance');
  }
}
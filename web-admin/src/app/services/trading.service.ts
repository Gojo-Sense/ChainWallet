import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { API_CONFIG } from '../config/api.config';

export interface CreateOrderRequest {
  symbol: string;
  orderType: 'MARKET' | 'LIMIT' | 'STOP_LOSS';
  side: 'BUY' | 'SELL';
  amount: number;
  price?: number;
  stopPrice?: number;
  expiresInMinutes?: number;
}

export interface OrderResponse {
  id: string;
  symbol: string;
  orderType: string;
  side: string;
  status: string;
  amount: number;
  price: number;
  filledAmount: number;
  averagePrice?: number;
  totalCost: number;
  stopPrice?: number;
  expiresAt?: string;
  executedAt?: string;
  cancelledAt?: string;
  cancelReason?: string;
  createdAt: string;
  updatedAt: string;
}

export interface PortfolioResponse {
  totalValue: number;
  totalProfitLoss: number;
  totalProfitLossPercentage: number;
  holdings: PortfolioItem[];
}

export interface PortfolioItem {
  symbol: string;
  name: string;
  amount: number;
  averageBuyPrice?: number;
  currentPrice: number;
  currentValue: number;
  profitLoss: number;
  profitLossPercentage: number;
}

export interface BalanceResponse {
  balance: number;
  availableBalance: number;
  lockedBalance: number;
}

export interface TradingPairResponse {
  id: string;
  symbol: string;
  baseCurrency: string;
  quoteCurrency: string;
  name: string;
  currentPrice: number;
  change24h: number;
  volume24h: number;
  isActive: boolean;
  pricePrecision: number;
  amountPrecision: number;
  minOrderAmount: number;
  maxOrderAmount: number;
}

export interface TradeResponse {
  id: string;
  orderId: string;
  symbol: string;
  side: string;
  amount: number;
  price: number;
  total: number;
  fee: number;
  feeCurrency?: string;
  createdAt: string;
}

@Injectable({
  providedIn: 'root'
})
export class TradingService {
  private baseUrl = API_CONFIG.tradingBaseUrl;

  constructor(private http: HttpClient) {}

  // Orders
  createOrder(request: CreateOrderRequest): Observable<OrderResponse> {
    return this.http.post<OrderResponse>(`${this.baseUrl}${API_CONFIG.trading.orders}`, request)
      .pipe(
        catchError(error => {
          console.error('Error creating order:', error);
          throw error;
        })
      );
  }

  getOrders(page: number = 0, size: number = 20): Observable<any> {
    const params = new HttpParams()
      .set('page', page.toString())
      .set('size', size.toString());
    return this.http.get<any>(`${this.baseUrl}${API_CONFIG.trading.orders}`, { params })
      .pipe(
        catchError(error => {
          console.error('Error fetching orders:', error);
          return of({ content: [], totalElements: 0 });
        })
      );
  }

  getOrder(id: string): Observable<OrderResponse> {
    return this.http.get<OrderResponse>(`${this.baseUrl}${API_CONFIG.trading.orders}/${id}`)
      .pipe(
        catchError(error => {
          console.error('Error fetching order:', error);
          throw error;
        })
      );
  }

  cancelOrder(id: string): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}${API_CONFIG.trading.orders}/${id}`)
      .pipe(
        catchError(error => {
          console.error('Error cancelling order:', error);
          throw error;
        })
      );
  }

  // Portfolio
  getPortfolio(): Observable<PortfolioResponse> {
    return this.http.get<PortfolioResponse>(`${this.baseUrl}${API_CONFIG.trading.portfolio}`)
      .pipe(
        catchError(error => {
          console.error('Error fetching portfolio:', error);
          return of({
            totalValue: 0,
            totalProfitLoss: 0,
            totalProfitLossPercentage: 0,
            holdings: []
          });
        })
      );
  }

  getBalance(): Observable<BalanceResponse> {
    return this.http.get<BalanceResponse>(`${this.baseUrl}${API_CONFIG.trading.balance}`)
      .pipe(
        catchError(error => {
          console.error('Error fetching balance:', error);
          return of({
            balance: 0,
            availableBalance: 0,
            lockedBalance: 0
          });
        })
      );
  }

  deposit(amount: number, paymentMethod: string): Observable<BalanceResponse> {
    return this.http.post<BalanceResponse>(`${this.baseUrl}${API_CONFIG.trading.deposit}`, {
      amount,
      paymentMethod
    })
      .pipe(
        catchError(error => {
          console.error('Error depositing:', error);
          throw error;
        })
      );
  }

  withdraw(amount: number, destination: string): Observable<BalanceResponse> {
    return this.http.post<BalanceResponse>(`${this.baseUrl}${API_CONFIG.trading.withdraw}`, {
      amount,
      destination
    })
      .pipe(
        catchError(error => {
          console.error('Error withdrawing:', error);
          throw error;
        })
      );
  }

  // Trading Pairs
  getTradingPairs(): Observable<TradingPairResponse[]> {
    return this.http.get<TradingPairResponse[]>(`${this.baseUrl}${API_CONFIG.trading.pairs}`)
      .pipe(
        catchError(error => {
          console.error('Error fetching trading pairs:', error);
          return of([]);
        })
      );
  }

  getTradingPair(symbol: string): Observable<TradingPairResponse> {
    return this.http.get<TradingPairResponse>(`${this.baseUrl}${API_CONFIG.trading.pairs}/${symbol}`)
      .pipe(
        catchError(error => {
          console.error('Error fetching trading pair:', error);
          throw error;
        })
      );
  }

  getPrice(symbol: string): Observable<number> {
    return this.http.get<number>(`${this.baseUrl}${API_CONFIG.trading.pairs}/${symbol}/price`)
      .pipe(
        catchError(error => {
          console.error('Error fetching price:', error);
          return of(0);
        })
      );
  }

  // Trade History
  getTradeHistory(page: number = 0, size: number = 20): Observable<any> {
    const params = new HttpParams()
      .set('page', page.toString())
      .set('size', size.toString());
    return this.http.get<any>(`${this.baseUrl}${API_CONFIG.trading.history}`, { params })
      .pipe(
        catchError(error => {
          console.error('Error fetching trade history:', error);
          return of({ content: [], totalElements: 0 });
        })
      );
  }

  getTrade(id: string): Observable<TradeResponse> {
    return this.http.get<TradeResponse>(`${this.baseUrl}${API_CONFIG.trading.history}/${id}`)
      .pipe(
        catchError(error => {
          console.error('Error fetching trade:', error);
          throw error;
        })
      );
  }
}








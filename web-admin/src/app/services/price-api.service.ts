import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, Subject, BehaviorSubject } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { of } from 'rxjs';

export interface PriceData {
  symbol: string;
  price: number;
  change24h: number;
  volume24h: number;
  marketCap?: number;
  timestamp: number;
}

export interface ChartDataPoint {
  time: number;
  open: number;
  high: number;
  low: number;
  close: number;
  volume: number;
}

export interface OrderBookEntry {
  price: number;
  quantity: number;
}

export interface Trade {
  id: string;
  price: number;
  quantity: number;
  time: number;
  side: 'buy' | 'sell';
}

@Injectable({
  providedIn: 'root'
})
export class PriceApiService {
  private binanceWs: WebSocket | null = null;
  private priceSubject = new Subject<PriceData>();
  private orderBookSubject = new Subject<{ bids: OrderBookEntry[], asks: OrderBookEntry[] }>();
  private tradesSubject = new Subject<Trade[]>();
  
  public priceUpdates$ = this.priceSubject.asObservable();
  public orderBookUpdates$ = this.orderBookSubject.asObservable();
  public tradesUpdates$ = this.tradesSubject.asObservable();

  private coinGeckoBaseUrl = 'https://api.coingecko.com/api/v3';
  private binanceWsUrl = 'wss://stream.binance.com:9443/ws';

  constructor(private http: HttpClient) {}

  // CoinGecko API - Free, no API key needed
  getPrice(symbol: string): Observable<number> {
    const coinId = this.getCoinGeckoId(symbol);
    if (!coinId) {
      return of(0);
    }

    return this.http.get<any>(`${this.coinGeckoBaseUrl}/simple/price`, {
      params: {
        ids: coinId,
        vs_currencies: 'usd'
      }
    }).pipe(
      map(data => data[coinId]?.usd || 0),
      catchError(() => of(0))
    );
  }

  getMultiplePrices(symbols: string[]): Observable<Map<string, number>> {
    const coinIds = symbols.map(s => this.getCoinGeckoId(s)).filter(Boolean).join(',');
    if (!coinIds) {
      return of(new Map());
    }

    return this.http.get<any>(`${this.coinGeckoBaseUrl}/simple/price`, {
      params: {
        ids: coinIds,
        vs_currencies: 'usd',
        include_24hr_change: 'true',
        include_24hr_vol: 'true'
      }
    }).pipe(
      map(data => {
        const prices = new Map<string, number>();
        Object.keys(data).forEach(coinId => {
          const symbol = this.getSymbolFromCoinGeckoId(coinId);
          if (symbol) {
            prices.set(symbol, data[coinId].usd);
          }
        });
        return prices;
      }),
      catchError(() => of(new Map()))
    );
  }

  getMarketChart(symbol: string, days: number = 7): Observable<ChartDataPoint[]> {
    const coinId = this.getCoinGeckoId(symbol);
    if (!coinId) {
      return of([]);
    }

    return this.http.get<any>(`${this.coinGeckoBaseUrl}/coins/${coinId}/market_chart`, {
      params: {
        vs_currency: 'usd',
        days: days.toString(),
        interval: days <= 1 ? 'hourly' : 'daily'
      }
    }).pipe(
      map(data => {
        if (!data.prices || !data.total_volumes) {
          return [];
        }
        return data.prices.map((price: [number, number], index: number) => ({
          time: price[0],
          open: price[1],
          high: price[1] * 1.02, // Approximate high
          low: price[1] * 0.98,  // Approximate low
          close: price[1],
          volume: data.total_volumes[index]?.[1] || 0
        }));
      }),
      catchError(() => of([]))
    );
  }

  // Binance WebSocket for real-time updates
  connectBinanceWebSocket(symbol: string): void {
    this.disconnectBinanceWebSocket();

    const binanceSymbol = this.getBinanceSymbol(symbol);
    if (!binanceSymbol) {
      return;
    }

    const streams = [
      `${binanceSymbol.toLowerCase()}@ticker`,  // Price updates
      `${binanceSymbol.toLowerCase()}@depth20@100ms`,  // Order book
      `${binanceSymbol.toLowerCase()}@trade`  // Recent trades
    ];

    const streamUrl = `${this.binanceWsUrl}/${streams.join('/')}`;
    this.binanceWs = new WebSocket(streamUrl);

    this.binanceWs.onmessage = (event) => {
      const data = JSON.parse(event.data);
      this.handleBinanceMessage(data, symbol);
    };

    this.binanceWs.onerror = (error) => {
      console.error('Binance WebSocket error:', error);
    };

    this.binanceWs.onclose = () => {
      console.log('Binance WebSocket closed');
      // Auto-reconnect after 5 seconds
      setTimeout(() => this.connectBinanceWebSocket(symbol), 5000);
    };
  }

  private handleBinanceMessage(data: any, symbol: string): void {
    if (data.stream) {
      const streamType = data.stream.split('@')[1];
      const streamData = data.data;

      switch (streamType) {
        case 'ticker':
          this.priceSubject.next({
            symbol: symbol,
            price: parseFloat(streamData.c),
            change24h: parseFloat(streamData.P),
            volume24h: parseFloat(streamData.v),
            timestamp: streamData.E
          });
          break;

        case 'depth20':
          const bids = streamData.bids.map(([price, qty]: [string, string]) => ({
            price: parseFloat(price),
            quantity: parseFloat(qty)
          }));
          const asks = streamData.a.map(([price, qty]: [string, string]) => ({
            price: parseFloat(price),
            quantity: parseFloat(qty)
          }));
          this.orderBookSubject.next({ bids, asks });
          break;

        case 'trade':
          this.tradesSubject.next([{
            id: streamData.t.toString(),
            price: parseFloat(streamData.p),
            quantity: parseFloat(streamData.q),
            time: streamData.T,
            side: streamData.m ? 'sell' : 'buy'
          }]);
          break;
      }
    }
  }

  disconnectBinanceWebSocket(): void {
    if (this.binanceWs) {
      this.binanceWs.close();
      this.binanceWs = null;
    }
  }

  // Helper methods
  private getCoinGeckoId(symbol: string): string {
    const mapping: { [key: string]: string } = {
      'BTC': 'bitcoin',
      'ETH': 'ethereum',
      'BNB': 'binancecoin',
      'SOL': 'solana',
      'ADA': 'cardano',
      'DOT': 'polkadot',
      'MATIC': 'matic-network',
      'AVAX': 'avalanche-2',
      'LINK': 'chainlink',
      'UNI': 'uniswap'
    };
    return mapping[symbol.toUpperCase()] || symbol.toLowerCase();
  }

  private getSymbolFromCoinGeckoId(coinId: string): string | null {
    const mapping: { [key: string]: string } = {
      'bitcoin': 'BTC',
      'ethereum': 'ETH',
      'binancecoin': 'BNB',
      'solana': 'SOL',
      'cardano': 'ADA',
      'polkadot': 'DOT',
      'matic-network': 'MATIC',
      'avalanche-2': 'AVAX',
      'chainlink': 'LINK',
      'uniswap': 'UNI'
    };
    return mapping[coinId] || null;
  }

  private getBinanceSymbol(symbol: string): string | null {
    // Convert symbol to Binance format (e.g., BTC -> BTCUSDT)
    const mapping: { [key: string]: string } = {
      'BTC': 'btcusdt',
      'ETH': 'ethusdt',
      'BNB': 'bnbusdt',
      'SOL': 'solusdt',
      'ADA': 'adausdt',
      'DOT': 'dotusdt',
      'MATIC': 'maticusdt',
      'AVAX': 'avaxusdt',
      'LINK': 'linkusdt',
      'UNI': 'uniusdt'
    };
    return mapping[symbol.toUpperCase()] || null;
  }
}


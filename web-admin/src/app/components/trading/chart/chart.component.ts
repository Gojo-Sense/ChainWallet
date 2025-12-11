import { Component, OnInit, OnDestroy, ViewChild, ElementRef, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChartService } from '../../../services/chart.service';
import { PriceApiService, ChartDataPoint } from '../../../services/price-api.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-chart',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './chart.component.html',
  styleUrl: './chart.component.css'
})
export class ChartComponent implements OnInit, OnDestroy {
  @ViewChild('chartCanvas', { static: false }) chartCanvas!: ElementRef<HTMLCanvasElement>;
  @Input() symbol: string = 'BTC';
  @Input() chartType: 'line' | 'candlestick' = 'line';
  @Input() timeframe: '1m' | '5m' | '15m' | '1h' | '4h' | '1d' | '1w' = '1d';

  timeframes: ('1m' | '5m' | '15m' | '1h' | '4h' | '1d' | '1w')[] = ['1m', '5m', '15m', '1h', '4h', '1d', '1w'];

  private chart: any;
  private priceSubscription?: Subscription;
  private chartData: ChartDataPoint[] = [];
  private updateInterval?: any;

  constructor(
    private chartService: ChartService,
    private priceApi: PriceApiService
  ) {}

  ngOnInit(): void {
    this.loadChartData();
    this.startRealTimeUpdates();
  }

  ngOnDestroy(): void {
    this.stopRealTimeUpdates();
    if (this.chart) {
      this.chartService.destroyChart('trading-chart');
    }
  }

  private loadChartData(): void {
    const days = this.getDaysForTimeframe(this.timeframe);
    this.priceApi.getMarketChart(this.symbol, days).subscribe({
      next: (data) => {
        this.chartData = data;
        this.renderChart();
      },
      error: (error) => {
        console.error('Error loading chart data:', error);
      }
    });
  }

  private renderChart(): void {
    if (!this.chartCanvas) {
      return;
    }

    const config = this.chartType === 'line'
      ? this.chartService.getLineChartConfig(this.chartData, '#7cff00')
      : this.chartService.getCandlestickChartConfig(this.chartData);

    this.chart = this.chartService.createChart(
      this.chartCanvas,
      config,
      'trading-chart'
    );
  }

  private startRealTimeUpdates(): void {
    // Connect to Binance WebSocket for real-time price updates
    this.priceApi.connectBinanceWebSocket(this.symbol);

    // Subscribe to price updates
    this.priceSubscription = this.priceApi.priceUpdates$.subscribe({
      next: (priceData) => {
        if (priceData.symbol === this.symbol) {
          this.updateChartWithNewPrice(priceData.price);
        }
      }
    });

    // Periodic chart data refresh (every 5 minutes)
    this.updateInterval = setInterval(() => {
      this.loadChartData();
    }, 5 * 60 * 1000);
  }

  private stopRealTimeUpdates(): void {
    if (this.priceSubscription) {
      this.priceSubscription.unsubscribe();
    }
    if (this.updateInterval) {
      clearInterval(this.updateInterval);
    }
    this.priceApi.disconnectBinanceWebSocket();
  }

  private updateChartWithNewPrice(price: number): void {
    if (!this.chart || !this.chartData.length) {
      return;
    }

    // Add new data point
    const newPoint: ChartDataPoint = {
      time: Date.now(),
      open: price,
      high: price,
      low: price,
      close: price,
      volume: 0
    };

    // Keep only last 100 points for performance
    this.chartData.push(newPoint);
    if (this.chartData.length > 100) {
      this.chartData.shift();
    }

    // Update chart
    const chartData = this.chartType === 'line'
      ? this.chartData.map(d => d.close)
      : this.chartData;

    this.chartService.updateChart('trading-chart', chartData);
  }

  private getDaysForTimeframe(timeframe: string): number {
    const mapping: { [key: string]: number } = {
      '1m': 1,
      '5m': 1,
      '15m': 1,
      '1h': 1,
      '4h': 7,
      '1d': 30,
      '1w': 365
    };
    return mapping[timeframe] || 7;
  }

  changeChartType(type: 'line' | 'candlestick'): void {
    this.chartType = type;
    this.loadChartData();
  }

  changeTimeframe(timeframe: '1m' | '5m' | '15m' | '1h' | '4h' | '1d' | '1w'): void {
    this.timeframe = timeframe;
    this.loadChartData();
  }
}


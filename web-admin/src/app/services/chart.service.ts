import { Injectable, ElementRef } from '@angular/core';
import { Chart, ChartConfiguration, ChartType } from 'chart.js';

export interface ChartOptions {
  type: 'line' | 'candlestick';
  timeframe: '1m' | '5m' | '15m' | '1h' | '4h' | '1d' | '1w';
}

@Injectable({
  providedIn: 'root'
})
export class ChartService {
  private charts: Map<string, Chart> = new Map();

  createChart(
    canvasRef: ElementRef<HTMLCanvasElement>,
    config: ChartConfiguration,
    chartId: string
  ): Chart {
    // Destroy existing chart if it exists
    this.destroyChart(chartId);

    const ctx = canvasRef.nativeElement.getContext('2d');
    if (!ctx) {
      throw new Error('Could not get canvas context');
    }

    const chart = new Chart(ctx, config);
    this.charts.set(chartId, chart);
    return chart;
  }

  updateChart(chartId: string, data: any[]): void {
    const chart = this.charts.get(chartId);
    if (!chart) {
      return;
    }

    chart.data.datasets[0].data = data;
    chart.update('none'); // 'none' mode for smooth updates
  }

  destroyChart(chartId: string): void {
    const chart = this.charts.get(chartId);
    if (chart) {
      chart.destroy();
      this.charts.delete(chartId);
    }
  }

  getLineChartConfig(
    data: any[],
    color: string = '#7cff00'
  ): ChartConfiguration {
    return {
      type: 'line',
      data: {
        labels: data.map(d => new Date(d.time).toLocaleTimeString()),
        datasets: [{
          label: 'Price',
          data: data.map(d => d.close),
          borderColor: color,
          backgroundColor: color + '20',
          borderWidth: 2,
          fill: true,
          tension: 0.4,
          pointRadius: 0,
          pointHoverRadius: 4
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false
          },
          tooltip: {
            mode: 'index',
            intersect: false,
            backgroundColor: 'rgba(26, 26, 26, 0.9)',
            titleColor: '#ffffff',
            bodyColor: '#ffffff',
            borderColor: color,
            borderWidth: 1,
            padding: 12,
            displayColors: false
          }
        },
        scales: {
          x: {
            display: true,
            grid: {
              color: 'rgba(124, 255, 0, 0.1)'
            },
            border: {
              display: false
            },
            ticks: {
              color: 'rgba(255, 255, 255, 0.6)',
              maxTicksLimit: 8
            }
          },
          y: {
            display: true,
            grid: {
              color: 'rgba(124, 255, 0, 0.1)'
            },
            border: {
              display: false
            },
            ticks: {
              color: 'rgba(255, 255, 255, 0.6)',
              callback: function(value: any) {
                return '$' + value.toFixed(2);
              }
            }
          }
        },
        interaction: {
          mode: 'nearest',
          axis: 'x',
          intersect: false
        }
      }
    };
  }

  getCandlestickChartConfig(data: any[]): ChartConfiguration {
    // Chart.js doesn't have native candlestick support
    // We'll use a line chart with OHLC bars visualization
    // For true candlestick, consider using a library like lightweight-charts
    return {
      type: 'line',
      data: {
        labels: data.map(d => new Date(d.time).toLocaleTimeString()),
        datasets: [
          {
            label: 'High',
            data: data.map(d => d.high),
            borderColor: '#7cff00',
            backgroundColor: 'transparent',
            borderWidth: 1,
            pointRadius: 0
          },
          {
            label: 'Low',
            data: data.map(d => d.low),
            borderColor: '#ff4757',
            backgroundColor: 'transparent',
            borderWidth: 1,
            pointRadius: 0
          },
          {
            label: 'Close',
            data: data.map(d => d.close),
            borderColor: '#7cff00',
            backgroundColor: '#7cff0020',
            borderWidth: 2,
            fill: true,
            tension: 0.4,
            pointRadius: 0
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: true,
            labels: {
              color: '#ffffff'
            }
          },
          tooltip: {
            mode: 'index',
            intersect: false,
            backgroundColor: 'rgba(26, 26, 26, 0.9)',
            titleColor: '#ffffff',
            bodyColor: '#ffffff',
            borderColor: '#7cff00',
            borderWidth: 1,
            padding: 12
          }
        },
        scales: {
          x: {
            display: true,
            grid: {
              color: 'rgba(124, 255, 0, 0.1)'
            },
            border: {
              display: false
            },
            ticks: {
              color: 'rgba(255, 255, 255, 0.6)',
              maxTicksLimit: 8
            }
          },
          y: {
            display: true,
            grid: {
              color: 'rgba(124, 255, 0, 0.1)'
            },
            border: {
              display: false
            },
            ticks: {
              color: 'rgba(255, 255, 255, 0.6)',
              callback: function(value: any) {
                return '$' + value.toFixed(2);
              }
            }
          }
        }
      }
    };
  }

  destroyAllCharts(): void {
    this.charts.forEach((chart, id) => {
      chart.destroy();
      this.charts.delete(id);
    });
  }
}


import { useEffect, useRef } from 'react'

interface TradingViewChartProps {
  symbol?: string
  theme?: 'dark' | 'light'
}

export default function TradingViewChart({ 
  symbol = 'BINANCE:BTCUSDT', 
  theme = 'dark' 
}: TradingViewChartProps) {
  const containerRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    if (!containerRef.current) return

    // Clear previous widget
    containerRef.current.innerHTML = ''

    // Create widget container
    const widgetContainer = document.createElement('div')
    widgetContainer.className = 'tradingview-widget-container'
    widgetContainer.style.height = '100%'
    widgetContainer.style.width = '100%'

    const widgetDiv = document.createElement('div')
    widgetDiv.className = 'tradingview-widget-container__widget'
    widgetDiv.style.height = 'calc(100% - 32px)'
    widgetDiv.style.width = '100%'

    widgetContainer.appendChild(widgetDiv)
    containerRef.current.appendChild(widgetContainer)

    // Inject TradingView script
    const script = document.createElement('script')
    script.src = 'https://s3.tradingview.com/external-embedding/embed-widget-advanced-chart.js'
    script.type = 'text/javascript'
    script.async = true
    script.innerHTML = JSON.stringify({
      autosize: true,
      symbol: symbol,
      interval: '15',
      timezone: 'Etc/UTC',
      theme: theme,
      style: '1',
      locale: 'en',
      enable_publishing: false,
      backgroundColor: theme === 'dark' ? '#0b0e11' : '#ffffff',
      gridColor: theme === 'dark' ? 'rgba(43, 49, 57, 0.5)' : 'rgba(0, 0, 0, 0.1)',
      hide_top_toolbar: false,
      hide_legend: false,
      save_image: false,
      calendar: false,
      hide_volume: false,
      support_host: 'https://www.tradingview.com',
      studies: [
        'MASimple@tv-basicstudies',
        'RSI@tv-basicstudies',
        'MACD@tv-basicstudies'
      ],
      show_popup_button: true,
      popup_width: '1000',
      popup_height: '650',
    })

    widgetContainer.appendChild(script)

    return () => {
      if (containerRef.current) {
        containerRef.current.innerHTML = ''
      }
    }
  }, [symbol, theme])

  return (
    <div 
      ref={containerRef} 
      className="w-full h-full min-h-[400px] bg-bg-secondary rounded-lg overflow-hidden"
    />
  )
}

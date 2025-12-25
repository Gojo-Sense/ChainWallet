import { useState, useEffect } from 'react'
import TradingViewChart from '../components/TradingViewChart'
import { useTradingStore, Trade } from '../store/tradingStore'
import { TrendingUp, TrendingDown, X, CheckCircle, AlertCircle, Wallet, BarChart3, Clock } from 'lucide-react'

const SYMBOLS = [
  { symbol: 'BTC/USDT', tvSymbol: 'BINANCE:BTCUSDT', price: 43450, change: 2.35 },
  { symbol: 'ETH/USDT', tvSymbol: 'BINANCE:ETHUSDT', price: 2285, change: 1.82 },
  { symbol: 'SOL/USDT', tvSymbol: 'BINANCE:SOLUSDT', price: 98.5, change: -0.45 },
  { symbol: 'BNB/USDT', tvSymbol: 'BINANCE:BNBUSDT', price: 312, change: 0.92 },
]

interface OrderResult {
  success: boolean
  message: string
  trade?: Trade
  pnl?: number
}

export default function Trading() {
  const { demoBalance, isDemo, trades, executeTrade, closeTrade, canTradeLive } = useTradingStore()
  
  const [orderType, setOrderType] = useState<'market' | 'limit'>('market')
  const [side, setSide] = useState<'buy' | 'sell'>('buy')
  const [amount, setAmount] = useState('')
  const [price, setPrice] = useState('')
  const [selectedSymbol, setSelectedSymbol] = useState(SYMBOLS[0])
  const [orderResult, setOrderResult] = useState<OrderResult | null>(null)
  const [currentPrice, setCurrentPrice] = useState(SYMBOLS[0].price)
  
  // Simulate price movement
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentPrice(prev => prev * (1 + (Math.random() - 0.5) * 0.001))
    }, 2000)
    return () => clearInterval(interval)
  }, [selectedSymbol])

  const openTrades = trades.filter(t => t.status === 'open')
  const balance = isDemo ? demoBalance : 0

  const handleExecuteTrade = () => {
    const orderAmount = parseFloat(amount)
    
    if (!orderAmount || orderAmount <= 0) {
      setOrderResult({ success: false, message: 'Please enter a valid amount' })
      return
    }
    
    if (orderAmount > balance) {
      setOrderResult({ success: false, message: 'Insufficient balance' })
      return
    }

    if (!isDemo && !canTradeLive) {
      setOrderResult({ success: false, message: 'Complete demo requirements to unlock live trading!' })
      return
    }

    const entryPrice = orderType === 'limit' ? parseFloat(price) || currentPrice : currentPrice
    
    executeTrade({
      symbol: selectedSymbol.symbol,
      side,
      amount: orderAmount,
      entryPrice,
    })

    setOrderResult({
      success: true,
      message: `${side.toUpperCase()} order executed at $${entryPrice.toFixed(2)}`,
    })

    setAmount('')
    setPrice('')
    
    setTimeout(() => setOrderResult(null), 3000)
  }

  const handleCloseTrade = (trade: Trade) => {
    const exitPrice = currentPrice * (1 + (Math.random() - 0.45) * 0.02)
    closeTrade(trade.id, exitPrice)
    
    const pnl = trade.side === 'buy'
      ? (exitPrice - trade.entryPrice) / trade.entryPrice * trade.amount
      : (trade.entryPrice - exitPrice) / trade.entryPrice * trade.amount

    setOrderResult({
      success: pnl >= 0,
      message: `Position closed! P&L: ${pnl >= 0 ? '+' : ''}$${pnl.toFixed(2)}`,
      pnl
    })

    setTimeout(() => setOrderResult(null), 4000)
  }

  const quickAmounts = [25, 50, 100, 250]

  return (
    <div className="trading-container grid grid-cols-12 gap-4 h-[calc(100vh-120px)]">
      {/* Order Result Toast */}
      {orderResult && (
        <div className={`fixed top-20 right-4 z-50 p-4 rounded-xl border shadow-lg flex items-center gap-3 animate-slide-in ${
          orderResult.success 
            ? 'bg-accent-green/20 border-accent-green/30 text-accent-green' 
            : 'bg-accent-red/20 border-accent-red/30 text-accent-red'
        }`}>
          {orderResult.success ? <CheckCircle size={20} /> : <AlertCircle size={20} />}
          <span className="font-medium">{orderResult.message}</span>
          <button onClick={() => setOrderResult(null)} className="ml-2 opacity-70 hover:opacity-100">
            <X size={16} />
          </button>
        </div>
      )}

      {/* Chart Section */}
      <div className="col-span-8 space-y-4">
        {/* Symbol Selector */}
        <div className="flex gap-2 overflow-x-auto pb-2">
          {SYMBOLS.map((sym) => (
            <button
              key={sym.symbol}
              onClick={() => {
                setSelectedSymbol(sym)
                setCurrentPrice(sym.price)
              }}
              className={`flex items-center gap-3 px-4 py-3 rounded-xl border whitespace-nowrap transition-all ${
                selectedSymbol.symbol === sym.symbol
                  ? 'bg-accent-yellow/10 border-accent-yellow text-text-primary'
                  : 'bg-bg-secondary border-border text-text-secondary hover:border-accent-yellow/50'
              }`}
            >
              <span className="font-semibold">{sym.symbol}</span>
              <span className="text-text-primary">${sym.price.toLocaleString()}</span>
              <span className={sym.change >= 0 ? 'text-accent-green' : 'text-accent-red'}>
                {sym.change >= 0 ? '+' : ''}{sym.change}%
              </span>
            </button>
          ))}
        </div>

        {/* Chart */}
        <div className="bg-bg-secondary rounded-xl border border-border overflow-hidden h-[400px]">
          <TradingViewChart symbol={selectedSymbol.tvSymbol} theme="dark" />
        </div>

        {/* Open Positions */}
        <div className="bg-bg-secondary rounded-xl p-4 border border-border">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-text-primary font-semibold flex items-center gap-2">
              <BarChart3 size={18} /> Open Positions
            </h3>
            <span className="text-text-secondary text-sm">{openTrades.length} active</span>
          </div>
          
          {openTrades.length === 0 ? (
            <div className="text-center py-6 text-text-secondary">
              <Clock size={32} className="mx-auto mb-2 opacity-50" />
              <p>No open positions</p>
            </div>
          ) : (
            <div className="space-y-2">
              {openTrades.map((trade) => {
                const unrealizedPnl = trade.side === 'buy'
                  ? (currentPrice - trade.entryPrice) / trade.entryPrice * trade.amount
                  : (trade.entryPrice - currentPrice) / trade.entryPrice * trade.amount
                const pnlPercent = (unrealizedPnl / trade.amount) * 100

                return (
                  <div key={trade.id} className="flex items-center justify-between p-3 bg-bg-tertiary rounded-lg">
                    <div className="flex items-center gap-3">
                      <div className={`w-10 h-10 rounded-lg flex items-center justify-center ${
                        trade.side === 'buy' ? 'bg-accent-green/20' : 'bg-accent-red/20'
                      }`}>
                        {trade.side === 'buy' ? (
                          <TrendingUp size={18} className="text-accent-green" />
                        ) : (
                          <TrendingDown size={18} className="text-accent-red" />
                        )}
                      </div>
                      <div>
                        <div className="font-medium text-text-primary">{trade.symbol}</div>
                        <div className="text-text-secondary text-xs">
                          Entry: ${trade.entryPrice.toFixed(2)} • Size: ${trade.amount.toFixed(2)}
                        </div>
                      </div>
                    </div>
                    <div className="flex items-center gap-4">
                      <div className="text-right">
                        <div className={`font-semibold ${unrealizedPnl >= 0 ? 'text-accent-green' : 'text-accent-red'}`}>
                          {unrealizedPnl >= 0 ? '+' : ''}${unrealizedPnl.toFixed(2)}
                        </div>
                        <div className={`text-xs ${unrealizedPnl >= 0 ? 'text-accent-green' : 'text-accent-red'}`}>
                          {pnlPercent >= 0 ? '+' : ''}{pnlPercent.toFixed(2)}%
                        </div>
                      </div>
                      <button
                        onClick={() => handleCloseTrade(trade)}
                        className="px-4 py-2 bg-accent-red/20 text-accent-red rounded-lg hover:bg-accent-red/30 transition-colors font-medium"
                      >
                        Close
                      </button>
                    </div>
                  </div>
                )
              })}
            </div>
          )}
        </div>
      </div>

      {/* Order Panel */}
      <div className="col-span-4 space-y-4">
        {/* Balance Card */}
        <div className="bg-bg-secondary rounded-xl p-4 border border-border">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <Wallet size={18} className="text-accent-yellow" />
              <span className="text-text-secondary text-sm">Available Balance</span>
            </div>
            {isDemo && (
              <span className="text-accent-yellow text-xs font-semibold px-2 py-1 bg-accent-yellow/20 rounded">DEMO</span>
            )}
          </div>
          <div className="text-2xl font-bold text-text-primary mt-2">${balance.toFixed(2)}</div>
        </div>

        {/* Live Trading Lock */}
        {!isDemo && !canTradeLive && (
          <div className="bg-accent-red/10 border border-accent-red/30 rounded-xl p-4">
            <div className="flex items-center gap-2 text-accent-red mb-2">
              <AlertCircle size={18} />
              <span className="font-semibold">Live Trading Locked</span>
            </div>
            <p className="text-text-secondary text-sm">
              Complete demo requirements to unlock live trading. Go to Dashboard to see progress.
            </p>
          </div>
        )}

        {/* Order Form */}
        <div className="bg-bg-secondary rounded-xl p-4 border border-border">
          <div className="flex gap-2 mb-4">
            <button 
              onClick={() => setOrderType('market')} 
              className={`flex-1 py-2 rounded-lg text-sm font-medium transition-colors ${
                orderType === 'market' ? 'bg-accent-yellow text-bg-primary' : 'bg-bg-tertiary text-text-secondary'
              }`}
            >
              Market
            </button>
            <button 
              onClick={() => setOrderType('limit')} 
              className={`flex-1 py-2 rounded-lg text-sm font-medium transition-colors ${
                orderType === 'limit' ? 'bg-accent-yellow text-bg-primary' : 'bg-bg-tertiary text-text-secondary'
              }`}
            >
              Limit
            </button>
          </div>

          <div className="flex gap-2 mb-4">
            <button 
              onClick={() => setSide('buy')} 
              className={`flex-1 py-3 rounded-lg font-semibold transition-colors ${
                side === 'buy' ? 'bg-accent-green text-white' : 'bg-bg-tertiary text-text-secondary'
              }`}
            >
              Buy / Long
            </button>
            <button 
              onClick={() => setSide('sell')} 
              className={`flex-1 py-3 rounded-lg font-semibold transition-colors ${
                side === 'sell' ? 'bg-accent-red text-white' : 'bg-bg-tertiary text-text-secondary'
              }`}
            >
              Sell / Short
            </button>
          </div>

          {/* Current Price */}
          <div className="bg-bg-tertiary rounded-lg p-3 mb-4">
            <div className="text-text-secondary text-xs mb-1">Current Price</div>
            <div className="text-xl font-bold text-text-primary">${currentPrice.toFixed(2)}</div>
          </div>

          {orderType === 'limit' && (
            <div className="mb-4">
              <label className="block text-text-secondary text-sm mb-2">Limit Price (USDT)</label>
              <input 
                type="number" 
                value={price} 
                onChange={(e) => setPrice(e.target.value)} 
                className="w-full bg-bg-tertiary border border-border rounded-lg px-4 py-3 text-text-primary focus:border-accent-yellow outline-none" 
                placeholder={currentPrice.toFixed(2)} 
              />
            </div>
          )}

          <div className="mb-4">
            <label className="block text-text-secondary text-sm mb-2">Amount (USDT)</label>
            <input 
              type="number" 
              value={amount} 
              onChange={(e) => setAmount(e.target.value)} 
              className="w-full bg-bg-tertiary border border-border rounded-lg px-4 py-3 text-text-primary focus:border-accent-yellow outline-none" 
              placeholder="0.00" 
            />
            <div className="flex gap-2 mt-2">
              {quickAmounts.map((amt) => (
                <button
                  key={amt}
                  onClick={() => setAmount(amt.toString())}
                  className="flex-1 py-1.5 bg-bg-tertiary rounded text-text-secondary text-xs hover:bg-border transition-colors"
                >
                  ${amt}
                </button>
              ))}
            </div>
          </div>

          {/* Order Summary */}
          {amount && parseFloat(amount) > 0 && (
            <div className="bg-bg-tertiary rounded-lg p-3 mb-4 space-y-2 text-sm">
              <div className="flex justify-between">
                <span className="text-text-secondary">Order Value</span>
                <span className="text-text-primary">${parseFloat(amount).toFixed(2)}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-text-secondary">Est. {selectedSymbol.symbol.split('/')[0]}</span>
                <span className="text-text-primary">{(parseFloat(amount) / currentPrice).toFixed(6)}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-text-secondary">Fee (0.1%)</span>
                <span className="text-text-primary">${(parseFloat(amount) * 0.001).toFixed(2)}</span>
              </div>
            </div>
          )}

          <button 
            onClick={handleExecuteTrade}
            disabled={!amount || parseFloat(amount) <= 0 || parseFloat(amount) > balance}
            className={`w-full py-4 rounded-lg font-semibold text-white transition-all ${
              side === 'buy' 
                ? 'bg-accent-green hover:bg-accent-green/90 disabled:bg-accent-green/50' 
                : 'bg-accent-red hover:bg-accent-red/90 disabled:bg-accent-red/50'
            } disabled:cursor-not-allowed`}
          >
            {side === 'buy' ? `Buy ${selectedSymbol.symbol.split('/')[0]}` : `Sell ${selectedSymbol.symbol.split('/')[0]}`}
          </button>
        </div>

        {/* Order Book */}
        <div className="bg-bg-secondary rounded-xl p-4 border border-border">
          <h3 className="text-text-primary font-semibold mb-4">Order Book</h3>
          <div className="space-y-1 text-sm">
            {[...Array(5)].map((_, i) => (
              <div key={`ask-${i}`} className="flex justify-between text-accent-red">
                <span>${(currentPrice + (5 - i) * currentPrice * 0.001).toFixed(2)}</span>
                <span>{(Math.random() * 2).toFixed(4)}</span>
                <div className="w-16 bg-accent-red/20 h-4 rounded" style={{ width: `${20 + Math.random() * 60}%` }} />
              </div>
            ))}
            <div className="text-center py-2 text-accent-green font-bold text-lg">
              ${currentPrice.toFixed(2)}
            </div>
            {[...Array(5)].map((_, i) => (
              <div key={`bid-${i}`} className="flex justify-between text-accent-green">
                <span>${(currentPrice - (i + 1) * currentPrice * 0.001).toFixed(2)}</span>
                <span>{(Math.random() * 2).toFixed(4)}</span>
                <div className="w-16 bg-accent-green/20 h-4 rounded" style={{ width: `${20 + Math.random() * 60}%` }} />
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}

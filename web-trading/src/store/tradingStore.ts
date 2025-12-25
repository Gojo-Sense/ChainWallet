import { create } from 'zustand'
import { persist } from 'zustand/middleware'

export interface Trade {
  id: string
  symbol: string
  side: 'buy' | 'sell'
  amount: number
  entryPrice: number
  exitPrice?: number
  pnl?: number
  pnlPercent?: number
  status: 'open' | 'closed' | 'pending'
  timestamp: number
  closedAt?: number
}

export interface DailyStats {
  date: string
  pnl: number
  trades: number
  wins: number
  losses: number
}

export interface TradingRequirement {
  id: string
  title: string
  description: string
  target: number
  current: number
  completed: boolean
  icon: string
}

interface TradingState {
  demoBalance: number
  realBalance: number
  isDemo: boolean
  trades: Trade[]
  dailyStats: DailyStats[]
  requirements: TradingRequirement[]
  totalPnl: number
  totalTrades: number
  winRate: number
  canTradeLive: boolean
  
  // Actions
  setDemoMode: (isDemo: boolean) => void
  executeTrade: (trade: Omit<Trade, 'id' | 'timestamp' | 'status'>) => void
  closeTrade: (tradeId: string, exitPrice: number) => void
  resetDemo: () => void
  updateRequirements: () => void
  addDemoBalance: (amount: number) => void
}

const INITIAL_DEMO_BALANCE = 10000
const INITIAL_REQUIREMENTS: TradingRequirement[] = [
  {
    id: 'trades',
    title: 'Complete 10 Demo Trades',
    description: 'Execute at least 10 trades in demo mode',
    target: 10,
    current: 0,
    completed: false,
    icon: '📊'
  },
  {
    id: 'profit',
    title: 'Achieve 5% Profit',
    description: 'Grow your demo account by 5%',
    target: 5,
    current: 0,
    completed: false,
    icon: '💰'
  },
  {
    id: 'winrate',
    title: '50% Win Rate',
    description: 'Maintain at least 50% winning trades',
    target: 50,
    current: 0,
    completed: false,
    icon: '🎯'
  },
  {
    id: 'days',
    title: 'Trade for 3 Days',
    description: 'Be active for at least 3 different days',
    target: 3,
    current: 0,
    completed: false,
    icon: '📅'
  },
  {
    id: 'consecutive',
    title: '3 Consecutive Wins',
    description: 'Win 3 trades in a row',
    target: 3,
    current: 0,
    completed: false,
    icon: '🔥'
  }
]

// Generate sample trades for demo
const generateSampleTrades = (): Trade[] => {
  const symbols = ['BTC/USDT', 'ETH/USDT', 'SOL/USDT', 'BNB/USDT']
  const trades: Trade[] = []
  const now = Date.now()
  
  for (let i = 0; i < 8; i++) {
    const side = Math.random() > 0.5 ? 'buy' : 'sell'
    const entryPrice = 43000 + Math.random() * 2000
    const exitPrice = entryPrice * (1 + (Math.random() - 0.45) * 0.05)
    const amount = 100 + Math.random() * 400
    const pnl = side === 'buy' 
      ? (exitPrice - entryPrice) / entryPrice * amount
      : (entryPrice - exitPrice) / entryPrice * amount
    
    trades.push({
      id: `trade-${i}`,
      symbol: symbols[Math.floor(Math.random() * symbols.length)],
      side,
      amount,
      entryPrice,
      exitPrice,
      pnl,
      pnlPercent: (pnl / amount) * 100,
      status: 'closed',
      timestamp: now - (i + 1) * 3600000 * Math.random() * 24,
      closedAt: now - i * 3600000
    })
  }
  
  return trades.sort((a, b) => b.timestamp - a.timestamp)
}

// Generate sample daily stats
const generateSampleDailyStats = (): DailyStats[] => {
  const stats: DailyStats[] = []
  const today = new Date()
  
  for (let i = 0; i < 30; i++) {
    const date = new Date(today)
    date.setDate(date.getDate() - i)
    const dateStr = date.toISOString().split('T')[0]
    
    if (Math.random() > 0.4) {
      const trades = Math.floor(Math.random() * 8) + 1
      const wins = Math.floor(Math.random() * trades)
      const pnl = (Math.random() - 0.45) * 500
      
      stats.push({
        date: dateStr,
        pnl,
        trades,
        wins,
        losses: trades - wins
      })
    }
  }
  
  return stats
}

export const useTradingStore = create<TradingState>()(
  persist(
    (set, get) => ({
      demoBalance: INITIAL_DEMO_BALANCE,
      realBalance: 0,
      isDemo: true,
      trades: generateSampleTrades(),
      dailyStats: generateSampleDailyStats(),
      requirements: INITIAL_REQUIREMENTS,
      totalPnl: 0,
      totalTrades: 8,
      winRate: 62.5,
      canTradeLive: false,

      setDemoMode: (isDemo) => set({ isDemo }),

      executeTrade: (tradeData) => {
        const trade: Trade = {
          ...tradeData,
          id: `trade-${Date.now()}`,
          timestamp: Date.now(),
          status: 'open'
        }
        
        set((state) => {
          const newBalance = state.isDemo 
            ? state.demoBalance - tradeData.amount
            : state.realBalance - tradeData.amount
          
          return {
            trades: [trade, ...state.trades],
            demoBalance: state.isDemo ? newBalance : state.demoBalance,
            realBalance: state.isDemo ? state.realBalance : newBalance,
            totalTrades: state.totalTrades + 1
          }
        })
        
        get().updateRequirements()
      },

      closeTrade: (tradeId, exitPrice) => {
        set((state) => {
          const updatedTrades = state.trades.map((trade) => {
            if (trade.id === tradeId && trade.status === 'open') {
              const pnl = trade.side === 'buy'
                ? (exitPrice - trade.entryPrice) / trade.entryPrice * trade.amount
                : (trade.entryPrice - exitPrice) / trade.entryPrice * trade.amount
              
              return {
                ...trade,
                exitPrice,
                pnl,
                pnlPercent: (pnl / trade.amount) * 100,
                status: 'closed' as const,
                closedAt: Date.now()
              }
            }
            return trade
          })
          
          const closedTrade = updatedTrades.find(t => t.id === tradeId)
          const pnl = closedTrade?.pnl || 0
          
          // Update daily stats
          const today = new Date().toISOString().split('T')[0]
          const existingDayIndex = state.dailyStats.findIndex(d => d.date === today)
          let newDailyStats = [...state.dailyStats]
          
          if (existingDayIndex >= 0) {
            newDailyStats[existingDayIndex] = {
              ...newDailyStats[existingDayIndex],
              pnl: newDailyStats[existingDayIndex].pnl + pnl,
              trades: newDailyStats[existingDayIndex].trades + 1,
              wins: newDailyStats[existingDayIndex].wins + (pnl > 0 ? 1 : 0),
              losses: newDailyStats[existingDayIndex].losses + (pnl <= 0 ? 1 : 0)
            }
          } else {
            newDailyStats.unshift({
              date: today,
              pnl,
              trades: 1,
              wins: pnl > 0 ? 1 : 0,
              losses: pnl <= 0 ? 1 : 0
            })
          }
          
          // Calculate win rate
          const closedTrades = updatedTrades.filter(t => t.status === 'closed')
          const wins = closedTrades.filter(t => (t.pnl || 0) > 0).length
          const winRate = closedTrades.length > 0 ? (wins / closedTrades.length) * 100 : 0
          
          return {
            trades: updatedTrades,
            dailyStats: newDailyStats,
            demoBalance: state.isDemo ? state.demoBalance + pnl : state.demoBalance,
            realBalance: state.isDemo ? state.realBalance : state.realBalance + pnl,
            totalPnl: state.totalPnl + pnl,
            winRate
          }
        })
        
        get().updateRequirements()
      },

      resetDemo: () => set({
        demoBalance: INITIAL_DEMO_BALANCE,
        trades: [],
        dailyStats: [],
        requirements: INITIAL_REQUIREMENTS,
        totalPnl: 0,
        totalTrades: 0,
        winRate: 0,
        canTradeLive: false
      }),

      updateRequirements: () => {
        set((state) => {
          const closedTrades = state.trades.filter(t => t.status === 'closed')
          const wins = closedTrades.filter(t => (t.pnl || 0) > 0).length
          const winRate = closedTrades.length > 0 ? (wins / closedTrades.length) * 100 : 0
          const profitPercent = ((state.demoBalance - INITIAL_DEMO_BALANCE) / INITIAL_DEMO_BALANCE) * 100
          const uniqueDays = new Set(state.dailyStats.map(d => d.date)).size
          
          // Calculate consecutive wins
          let maxConsecutive = 0
          let currentConsecutive = 0
          const sortedTrades = [...closedTrades].sort((a, b) => a.timestamp - b.timestamp)
          for (const trade of sortedTrades) {
            if ((trade.pnl || 0) > 0) {
              currentConsecutive++
              maxConsecutive = Math.max(maxConsecutive, currentConsecutive)
            } else {
              currentConsecutive = 0
            }
          }
          
          const updatedRequirements = state.requirements.map(req => {
            switch (req.id) {
              case 'trades':
                return { ...req, current: closedTrades.length, completed: closedTrades.length >= req.target }
              case 'profit':
                return { ...req, current: Math.max(0, profitPercent), completed: profitPercent >= req.target }
              case 'winrate':
                return { ...req, current: winRate, completed: winRate >= req.target && closedTrades.length >= 5 }
              case 'days':
                return { ...req, current: uniqueDays, completed: uniqueDays >= req.target }
              case 'consecutive':
                return { ...req, current: maxConsecutive, completed: maxConsecutive >= req.target }
              default:
                return req
            }
          })
          
          const canTradeLive = updatedRequirements.every(req => req.completed)
          
          return { requirements: updatedRequirements, canTradeLive, winRate }
        })
      },

      addDemoBalance: (amount) => set((state) => ({
        demoBalance: state.demoBalance + amount
      }))
    }),
    {
      name: 'trading-storage'
    }
  )
)

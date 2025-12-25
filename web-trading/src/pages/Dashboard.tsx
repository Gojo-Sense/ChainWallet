import { useEffect, useState } from 'react'
import { useTradingStore } from '../store/tradingStore'
import { TrendingUp, TrendingDown, Wallet, Activity, Calendar, Target, Trophy, Clock, ChevronLeft, ChevronRight, Plus, Lock, Unlock, Award } from 'lucide-react'

export default function Dashboard() {
  const { 
    demoBalance, isDemo, setDemoMode, trades, dailyStats, requirements, 
    totalPnl, totalTrades, winRate, canTradeLive, addDemoBalance, updateRequirements 
  } = useTradingStore()
  
  const [currentMonth, setCurrentMonth] = useState(new Date())
  const [showAddBalance, setShowAddBalance] = useState(false)
  const [addAmount, setAddAmount] = useState('')

  useEffect(() => {
    updateRequirements()
  }, [])

  const completedRequirements = requirements.filter(r => r.completed).length

  // Calendar helpers
  const getDaysInMonth = (date: Date) => {
    const year = date.getFullYear()
    const month = date.getMonth()
    const firstDay = new Date(year, month, 1)
    const lastDay = new Date(year, month + 1, 0)
    const days = []
    
    // Add empty cells for days before first day of month
    for (let i = 0; i < firstDay.getDay(); i++) {
      days.push(null)
    }
    
    // Add days of month
    for (let i = 1; i <= lastDay.getDate(); i++) {
      const dateStr = `${year}-${String(month + 1).padStart(2, '0')}-${String(i).padStart(2, '0')}`
      const dayStats = dailyStats.find(d => d.date === dateStr)
      days.push({ day: i, stats: dayStats })
    }
    
    return days
  }

  const handleAddBalance = () => {
    const amount = parseFloat(addAmount)
    if (amount > 0) {
      addDemoBalance(amount)
      setAddAmount('')
      setShowAddBalance(false)
    }
  }

  const recentTrades = trades.slice(0, 5)
  const monthDays = getDaysInMonth(currentMonth)

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold text-text-primary">Dashboard</h2>
          <p className="text-text-secondary text-sm mt-1">Track your trading performance</p>
        </div>
        <div className="flex items-center gap-4">
          <button
            onClick={() => setShowAddBalance(true)}
            className="flex items-center gap-2 px-4 py-2 bg-accent-blue/20 text-accent-blue rounded-lg hover:bg-accent-blue/30 transition-colors"
          >
            <Plus size={16} /> Add Balance
          </button>
          <div className="flex items-center gap-2">
            <span className="text-text-secondary text-sm">Demo Mode</span>
            <button
              onClick={() => setDemoMode(!isDemo)}
              className={`w-12 h-6 rounded-full transition-colors ${isDemo ? 'bg-accent-green' : 'bg-border'}`}
            >
              <div className={`w-5 h-5 bg-white rounded-full transition-transform ${isDemo ? 'translate-x-6' : 'translate-x-0.5'}`} />
            </button>
            {isDemo && <span className="text-accent-yellow text-xs font-semibold px-2 py-1 bg-accent-yellow/20 rounded">DEMO</span>}
          </div>
        </div>
      </div>

      {/* Add Balance Modal */}
      {showAddBalance && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-bg-secondary rounded-xl p-6 w-96 border border-border">
            <h3 className="text-lg font-semibold text-text-primary mb-4">Add Demo Balance</h3>
            <input
              type="number"
              value={addAmount}
              onChange={(e) => setAddAmount(e.target.value)}
              placeholder="Enter amount (USDT)"
              className="w-full bg-bg-tertiary border border-border rounded-lg px-4 py-3 text-text-primary mb-4"
            />
            <div className="flex gap-2 mb-4">
              {[1000, 5000, 10000].map(amt => (
                <button
                  key={amt}
                  onClick={() => setAddAmount(amt.toString())}
                  className="flex-1 py-2 bg-bg-tertiary rounded-lg text-text-secondary hover:bg-border transition-colors"
                >
                  +${amt.toLocaleString()}
                </button>
              ))}
            </div>
            <div className="flex gap-2">
              <button onClick={() => setShowAddBalance(false)} className="flex-1 py-3 bg-bg-tertiary rounded-lg text-text-secondary">Cancel</button>
              <button onClick={handleAddBalance} className="flex-1 py-3 bg-accent-green rounded-lg text-white font-semibold">Add Funds</button>
            </div>
          </div>
        </div>
      )}

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-bg-secondary rounded-xl p-6 border border-border">
          <div className="flex items-center justify-between mb-4">
            <span className="text-text-secondary text-sm">Demo Balance</span>
            <Wallet className="text-accent-yellow" size={20} />
          </div>
          <div className="text-2xl font-bold text-text-primary">${demoBalance.toFixed(2)}</div>
          <div className={`flex items-center gap-1 mt-2 text-sm ${totalPnl >= 0 ? 'text-accent-green' : 'text-accent-red'}`}>
            {totalPnl >= 0 ? <TrendingUp size={14} /> : <TrendingDown size={14} />}
            {totalPnl >= 0 ? '+' : ''}{((totalPnl / 10000) * 100).toFixed(2)}%
          </div>
        </div>

        <div className="bg-bg-secondary rounded-xl p-6 border border-border">
          <div className="flex items-center justify-between mb-4">
            <span className="text-text-secondary text-sm">Total P&L</span>
            <Activity className={totalPnl >= 0 ? 'text-accent-green' : 'text-accent-red'} size={20} />
          </div>
          <div className={`text-2xl font-bold ${totalPnl >= 0 ? 'text-accent-green' : 'text-accent-red'}`}>
            {totalPnl >= 0 ? '+' : ''}${totalPnl.toFixed(2)}
          </div>
        </div>

        <div className="bg-bg-secondary rounded-xl p-6 border border-border">
          <div className="flex items-center justify-between mb-4">
            <span className="text-text-secondary text-sm">Win Rate</span>
            <Target className="text-accent-blue" size={20} />
          </div>
          <div className="text-2xl font-bold text-text-primary">{winRate.toFixed(1)}%</div>
          <div className="w-full bg-bg-tertiary rounded-full h-2 mt-2">
            <div className="bg-accent-green h-2 rounded-full" style={{ width: `${winRate}%` }} />
          </div>
        </div>

        <div className="bg-bg-secondary rounded-xl p-6 border border-border">
          <div className="flex items-center justify-between mb-4">
            <span className="text-text-secondary text-sm">Total Trades</span>
            <Trophy className="text-accent-yellow" size={20} />
          </div>
          <div className="text-2xl font-bold text-text-primary">{totalTrades}</div>
        </div>
      </div>

      {/* Live Trading Requirements */}
      <div className="bg-bg-secondary rounded-xl p-6 border border-border">
        <div className="flex items-center justify-between mb-6">
          <div className="flex items-center gap-3">
            {canTradeLive ? <Unlock className="text-accent-green" size={24} /> : <Lock className="text-accent-yellow" size={24} />}
            <div>
              <h3 className="text-lg font-semibold text-text-primary">Live Trading Requirements</h3>
              <p className="text-text-secondary text-sm">
                {canTradeLive 
                  ? '🎉 Congratulations! You can now trade live!' 
                  : `Complete ${5 - completedRequirements} more requirements to unlock live trading`}
              </p>
            </div>
          </div>
          <div className="text-right">
            <div className="text-2xl font-bold text-accent-yellow">{completedRequirements}/5</div>
            <div className="text-text-secondary text-sm">Completed</div>
          </div>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
          {requirements.map((req) => (
            <div
              key={req.id}
              className={`p-4 rounded-xl border transition-all ${
                req.completed 
                  ? 'bg-accent-green/10 border-accent-green/30' 
                  : 'bg-bg-tertiary border-border'
              }`}
            >
              <div className="text-2xl mb-2">{req.icon}</div>
              <h4 className="font-semibold text-text-primary text-sm mb-1">{req.title}</h4>
              <p className="text-text-secondary text-xs mb-3">{req.description}</p>
              <div className="flex items-center justify-between">
                <span className="text-xs text-text-secondary">
                  {req.current.toFixed(req.id === 'profit' || req.id === 'winrate' ? 1 : 0)}/{req.target}{req.id === 'profit' || req.id === 'winrate' ? '%' : ''}
                </span>
                {req.completed && <span className="text-accent-green text-xs">✓</span>}
              </div>
              <div className="w-full bg-bg-primary rounded-full h-1.5 mt-2">
                <div 
                  className={`h-1.5 rounded-full transition-all ${req.completed ? 'bg-accent-green' : 'bg-accent-yellow'}`}
                  style={{ width: `${Math.min((req.current / req.target) * 100, 100)}%` }}
                />
              </div>
            </div>
          ))}
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Trading Calendar */}
        <div className="bg-bg-secondary rounded-xl p-6 border border-border">
          <div className="flex items-center justify-between mb-6">
            <div className="flex items-center gap-2">
              <Calendar className="text-accent-blue" size={20} />
              <h3 className="text-lg font-semibold text-text-primary">Trading Calendar</h3>
            </div>
            <div className="flex items-center gap-2">
              <button
                onClick={() => setCurrentMonth(new Date(currentMonth.setMonth(currentMonth.getMonth() - 1)))}
                className="p-2 hover:bg-bg-tertiary rounded-lg transition-colors"
              >
                <ChevronLeft size={16} className="text-text-secondary" />
              </button>
              <span className="text-text-primary font-medium min-w-[120px] text-center">
                {currentMonth.toLocaleDateString('en-US', { month: 'long', year: 'numeric' })}
              </span>
              <button
                onClick={() => setCurrentMonth(new Date(currentMonth.setMonth(currentMonth.getMonth() + 1)))}
                className="p-2 hover:bg-bg-tertiary rounded-lg transition-colors"
              >
                <ChevronRight size={16} className="text-text-secondary" />
              </button>
            </div>
          </div>
          
          <div className="grid grid-cols-7 gap-1 mb-2">
            {['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map(day => (
              <div key={day} className="text-center text-text-secondary text-xs py-2">{day}</div>
            ))}
          </div>
          
          <div className="grid grid-cols-7 gap-1">
            {monthDays.map((day, i) => (
              <div
                key={i}
                className={`aspect-square p-1 rounded-lg text-center relative ${
                  day ? 'hover:bg-bg-tertiary cursor-pointer' : ''
                } ${day?.stats ? (day.stats.pnl >= 0 ? 'bg-accent-green/10' : 'bg-accent-red/10') : ''}`}
              >
                {day && (
                  <>
                    <span className="text-text-primary text-sm">{day.day}</span>
                    {day.stats && (
                      <div className={`text-[10px] font-medium ${day.stats.pnl >= 0 ? 'text-accent-green' : 'text-accent-red'}`}>
                        {day.stats.pnl >= 0 ? '+' : ''}{day.stats.pnl.toFixed(0)}
                      </div>
                    )}
                  </>
                )}
              </div>
            ))}
          </div>
          
          <div className="flex items-center gap-4 mt-4 pt-4 border-t border-border">
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded bg-accent-green/30" />
              <span className="text-text-secondary text-xs">Profit Day</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded bg-accent-red/30" />
              <span className="text-text-secondary text-xs">Loss Day</span>
            </div>
          </div>
        </div>

        {/* Recent Trades */}
        <div className="bg-bg-secondary rounded-xl p-6 border border-border">
          <div className="flex items-center justify-between mb-6">
            <div className="flex items-center gap-2">
              <Clock className="text-accent-yellow" size={20} />
              <h3 className="text-lg font-semibold text-text-primary">Recent Trades</h3>
            </div>
            <span className="text-text-secondary text-sm">{trades.length} total</span>
          </div>
          
          <div className="space-y-3">
            {recentTrades.length === 0 ? (
              <div className="text-center py-8 text-text-secondary">
                <Activity size={40} className="mx-auto mb-2 opacity-50" />
                <p>No trades yet. Start trading!</p>
              </div>
            ) : (
              recentTrades.map((trade) => (
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
                        {trade.side.toUpperCase()} • ${trade.amount.toFixed(2)}
                      </div>
                    </div>
                  </div>
                  <div className="text-right">
                    {trade.status === 'closed' ? (
                      <>
                        <div className={`font-semibold ${(trade.pnl || 0) >= 0 ? 'text-accent-green' : 'text-accent-red'}`}>
                          {(trade.pnl || 0) >= 0 ? '+' : ''}${(trade.pnl || 0).toFixed(2)}
                        </div>
                        <div className="text-text-secondary text-xs">
                          {(trade.pnlPercent || 0) >= 0 ? '+' : ''}{(trade.pnlPercent || 0).toFixed(2)}%
                        </div>
                      </>
                    ) : (
                      <span className="text-accent-yellow text-sm">Open</span>
                    )}
                  </div>
                </div>
              ))
            )}
          </div>
        </div>
      </div>

      {/* Achievements */}
      <div className="bg-bg-secondary rounded-xl p-6 border border-border">
        <div className="flex items-center gap-2 mb-6">
          <Award className="text-accent-yellow" size={20} />
          <h3 className="text-lg font-semibold text-text-primary">Achievements</h3>
        </div>
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
          {[
            { icon: '🚀', title: 'First Trade', desc: 'Execute your first trade', unlocked: totalTrades >= 1 },
            { icon: '💎', title: 'Diamond Hands', desc: 'Hold a position for 24h', unlocked: false },
            { icon: '🎯', title: 'Sharpshooter', desc: '5 wins in a row', unlocked: false },
            { icon: '🔥', title: 'On Fire', desc: '10 profitable trades', unlocked: trades.filter(t => (t.pnl || 0) > 0).length >= 10 },
            { icon: '🏆', title: 'Champion', desc: 'Reach $15,000 balance', unlocked: demoBalance >= 15000 },
            { icon: '⚡', title: 'Speed Trader', desc: '5 trades in one day', unlocked: false },
          ].map((achievement, i) => (
            <div
              key={i}
              className={`p-4 rounded-xl text-center transition-all ${
                achievement.unlocked 
                  ? 'bg-accent-yellow/10 border border-accent-yellow/30' 
                  : 'bg-bg-tertiary border border-border opacity-50'
              }`}
            >
              <div className="text-3xl mb-2">{achievement.icon}</div>
              <h4 className="font-semibold text-text-primary text-sm">{achievement.title}</h4>
              <p className="text-text-secondary text-xs mt-1">{achievement.desc}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}

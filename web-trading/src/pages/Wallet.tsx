import { useEffect, useState } from 'react'
import { walletApi } from '../services/api'
import { RefreshCw } from 'lucide-react'

interface WalletData {
  id: string
  balanceUsdt: number
  balanceBtc: number
  balanceEth: number
  balanceBnb: number
  balanceSol: number
  totalValueUsdt: number
  isDemo: boolean
}

export default function Wallet() {
  const [wallet, setWallet] = useState<WalletData | null>(null)
  const [demoMode, setDemoMode] = useState(true)
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    loadWallet()
  }, [demoMode])

  const loadWallet = async () => {
    setLoading(true)
    try {
      const res = await walletApi.getPortfolio(demoMode)
      setWallet(res.data.data)
    } catch (err) {
      console.error(err)
    } finally {
      setLoading(false)
    }
  }

  const resetDemoWallet = async () => {
    if (!demoMode) return
    setLoading(true)
    try {
      await walletApi.resetDemo()
      await loadWallet()
    } catch (err) {
      console.error(err)
    } finally {
      setLoading(false)
    }
  }

  const assets = [
    { symbol: 'USDT', name: 'Tether', balance: wallet?.balanceUsdt || 0, price: 1 },
    { symbol: 'BTC', name: 'Bitcoin', balance: wallet?.balanceBtc || 0, price: 43000 },
    { symbol: 'ETH', name: 'Ethereum', balance: wallet?.balanceEth || 0, price: 2200 },
    { symbol: 'BNB', name: 'BNB', balance: wallet?.balanceBnb || 0, price: 310 },
    { symbol: 'SOL', name: 'Solana', balance: wallet?.balanceSol || 0, price: 100 },
  ]

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h2 className="text-2xl font-bold text-text-primary">Wallet</h2>
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-2">
            <span className="text-text-secondary text-sm">Demo Mode</span>
            <button
              onClick={() => setDemoMode(!demoMode)}
              className={`w-12 h-6 rounded-full transition-colors ${demoMode ? 'bg-accent-green' : 'bg-border'}`}
            >
              <div className={`w-5 h-5 bg-white rounded-full transition-transform ${demoMode ? 'translate-x-6' : 'translate-x-0.5'}`} />
            </button>
          </div>
          {demoMode && (
            <button
              onClick={resetDemoWallet}
              disabled={loading}
              className="flex items-center gap-2 px-4 py-2 bg-accent-yellow text-bg-primary rounded-lg text-sm font-medium hover:bg-accent-yellow/90 disabled:opacity-50"
            >
              <RefreshCw size={16} className={loading ? 'animate-spin' : ''} />
              Reset Demo
            </button>
          )}
        </div>
      </div>

      <div className="bg-bg-secondary rounded-xl p-6 border border-border">
        <div className="flex items-center justify-between mb-2">
          <span className="text-text-secondary">Total Portfolio Value</span>
          <span className="px-3 py-1 rounded-full text-xs font-semibold bg-accent-yellow/20 text-accent-yellow">
            {demoMode ? 'Demo' : 'Real'}
          </span>
        </div>
        <div className="text-4xl font-bold text-text-primary">
          ${wallet?.totalValueUsdt?.toFixed(2) || '0.00'}
        </div>
      </div>

      <div className="bg-bg-secondary rounded-xl border border-border overflow-hidden">
        <div className="p-4 border-b border-border">
          <h3 className="text-lg font-semibold text-text-primary">Assets</h3>
        </div>
        <table className="w-full">
          <thead>
            <tr className="text-text-secondary text-sm border-b border-border">
              <th className="text-left p-4">Asset</th>
              <th className="text-right p-4">Balance</th>
              <th className="text-right p-4">Price</th>
              <th className="text-right p-4">Value</th>
            </tr>
          </thead>
          <tbody>
            {assets.map((asset) => (
              <tr key={asset.symbol} className="border-b border-border last:border-0 hover:bg-bg-tertiary">
                <td className="p-4">
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-accent-yellow/20 flex items-center justify-center text-accent-yellow font-bold text-sm">
                      {asset.symbol[0]}
                    </div>
                    <div>
                      <div className="text-text-primary font-medium">{asset.symbol}</div>
                      <div className="text-text-secondary text-sm">{asset.name}</div>
                    </div>
                  </div>
                </td>
                <td className="p-4 text-right text-text-primary font-mono">
                  {asset.balance.toFixed(asset.symbol === 'USDT' ? 2 : 8)}
                </td>
                <td className="p-4 text-right text-text-secondary">
                  ${asset.price.toLocaleString()}
                </td>
                <td className="p-4 text-right text-text-primary font-medium">
                  ${(asset.balance * asset.price).toFixed(2)}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}

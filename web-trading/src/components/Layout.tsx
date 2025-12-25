import { Outlet, NavLink } from 'react-router-dom'
import { useAuthStore } from '../store/authStore'
import { LayoutDashboard, LineChart, Wallet, LogOut } from 'lucide-react'

export default function Layout() {
  const { user, logout } = useAuthStore()

  return (
    <div className="min-h-screen bg-bg-primary flex">
      {/* Sidebar */}
      <aside className="w-16 bg-bg-secondary border-r border-border flex flex-col items-center py-4">
        <div className="w-10 h-10 bg-accent-yellow rounded-lg flex items-center justify-center mb-8">
          <span className="text-bg-primary font-bold text-xl">A</span>
        </div>
        
        <nav className="flex flex-col gap-4 flex-1">
          <NavLink
            to="/dashboard"
            className={({ isActive }) =>
              `w-10 h-10 rounded-lg flex items-center justify-center transition-colors ${
                isActive ? 'bg-accent-yellow text-bg-primary' : 'text-text-secondary hover:bg-bg-tertiary'
              }`
            }
          >
            <LayoutDashboard size={20} />
          </NavLink>
          <NavLink
            to="/trading"
            className={({ isActive }) =>
              `w-10 h-10 rounded-lg flex items-center justify-center transition-colors ${
                isActive ? 'bg-accent-yellow text-bg-primary' : 'text-text-secondary hover:bg-bg-tertiary'
              }`
            }
          >
            <LineChart size={20} />
          </NavLink>
          <NavLink
            to="/wallet"
            className={({ isActive }) =>
              `w-10 h-10 rounded-lg flex items-center justify-center transition-colors ${
                isActive ? 'bg-accent-yellow text-bg-primary' : 'text-text-secondary hover:bg-bg-tertiary'
              }`
            }
          >
            <Wallet size={20} />
          </NavLink>
        </nav>

        <button
          onClick={logout}
          className="w-10 h-10 rounded-lg flex items-center justify-center text-text-secondary hover:bg-bg-tertiary transition-colors"
        >
          <LogOut size={20} />
        </button>
      </aside>

      {/* Main Content */}
      <main className="flex-1 overflow-auto">
        <header className="h-14 bg-bg-secondary border-b border-border flex items-center justify-between px-6">
          <h1 className="text-text-primary font-semibold">Aether Trading</h1>
          <div className="flex items-center gap-4">
            <span className="text-text-secondary text-sm">{user?.email}</span>
          </div>
        </header>
        <div className="p-6">
          <Outlet />
        </div>
      </main>
    </div>
  )
}

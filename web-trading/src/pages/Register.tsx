import { useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { useAuthStore } from '../store/authStore'

export default function Register() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const { register, isLoading, error } = useAuthStore()
  const navigate = useNavigate()

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (password !== confirmPassword) return
    try {
      await register(email, password)
      navigate('/dashboard')
    } catch {}
  }

  return (
    <div className="min-h-screen bg-bg-primary flex items-center justify-center p-4">
      <div className="w-full max-w-md bg-bg-secondary rounded-xl p-8 border border-border">
        <div className="text-center mb-8">
          <h1 className="text-2xl font-bold text-text-primary">Create Account</h1>
          <p className="text-text-secondary mt-2">Start trading today</p>
        </div>
        <form onSubmit={handleSubmit} className="space-y-4">
          {error && <div className="bg-accent-red/10 border border-accent-red/30 rounded-lg p-3 text-accent-red text-sm">{error}</div>}
          <div>
            <label htmlFor="email" className="block text-text-secondary text-sm mb-2">Email</label>
            <input id="email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} className="w-full bg-bg-tertiary border border-border rounded-lg px-4 py-3 text-text-primary focus:outline-none focus:border-accent-yellow" required />
          </div>
          <div>
            <label htmlFor="password" className="block text-text-secondary text-sm mb-2">Password</label>
            <input id="password" type="password" value={password} onChange={(e) => setPassword(e.target.value)} className="w-full bg-bg-tertiary border border-border rounded-lg px-4 py-3 text-text-primary focus:outline-none focus:border-accent-yellow" required />
          </div>
          <div>
            <label htmlFor="confirmPassword" className="block text-text-secondary text-sm mb-2">Confirm Password</label>
            <input id="confirmPassword" type="password" value={confirmPassword} onChange={(e) => setConfirmPassword(e.target.value)} className="w-full bg-bg-tertiary border border-border rounded-lg px-4 py-3 text-text-primary focus:outline-none focus:border-accent-yellow" required />
          </div>
          <button type="submit" disabled={isLoading} className="w-full bg-accent-yellow text-bg-primary font-semibold py-3 rounded-lg hover:bg-accent-yellow/90 transition-colors disabled:opacity-50">
            {isLoading ? 'Creating...' : 'Create Account'}
          </button>
        </form>
        <p className="text-center text-text-secondary mt-6">
          Already have an account? <Link to="/login" className="text-accent-yellow hover:underline">Sign in</Link>
        </p>
      </div>
    </div>
  )
}

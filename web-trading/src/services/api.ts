import axios from 'axios'

const API_BASE_URL = '/api/v1'

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: { 'Content-Type': 'application/json' },
})

api.interceptors.request.use((config) => {
  const token = localStorage.getItem('auth-storage')
  if (token) {
    const parsed = JSON.parse(token)
    if (parsed?.state?.accessToken) {
      config.headers.Authorization = `Bearer ${parsed.state.accessToken}`
    }
  }
  return config
})

export const authApi = {
  login: (email: string, password: string) =>
    api.post('/auth/login', { email, password }),
  register: (email: string, password: string) =>
    api.post('/auth/register', { email, password }),
}

export const walletApi = {
  getWallet: (demoMode: boolean) =>
    api.get(`/user/wallet?demoMode=${demoMode}`),
  getPortfolio: (demoMode: boolean) =>
    api.get(`/user/wallet/portfolio?demoMode=${demoMode}`),
  resetDemo: () => api.post('/user/wallet/reset'),
}

export const tradingApi = {
  executeTrade: (data: {
    fromCurrency: string
    toCurrency: string
    amount: number
    price: number
    orderType: string
    isDemo: boolean
  }) => api.post('/trading/execute', data),
}

export default api

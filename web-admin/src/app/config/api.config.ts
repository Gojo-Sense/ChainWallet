export const API_CONFIG = {
  baseUrl: 'http://localhost:3000/api',
  tradingBaseUrl: 'http://localhost:3000/api',
  auth: {
    login: '/auth/login',
    register: '/auth/register',
    refresh: '/auth/refresh',
    logout: '/auth/logout',
  },
  trading: {
    pairs: '/trading/pairs',
    history: '/trading/history',
    orders: '/trading/orders',
    portfolio: '/trading/portfolio',
    balance: '/trading/balance',
    deposit: '/trading/deposit',
    withdraw: '/trading/withdraw',
  },
};



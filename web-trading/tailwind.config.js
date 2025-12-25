/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        // Binance-style dark theme
        'bg-primary': '#0b0e11',
        'bg-secondary': '#181a20',
        'bg-tertiary': '#1e2329',
        'bg-card': '#181a20',
        'text-primary': '#eaecef',
        'text-secondary': '#848e9c',
        'text-muted': '#5e6673',
        'border': '#2b3139',
        'accent-green': '#0ecb81',
        'accent-red': '#f6465d',
        'accent-yellow': '#f0b90b',
        'accent-blue': '#1e80ff',
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
    },
  },
  plugins: [],
}

# 🚀 Quick Start Guide

## Running the App

### Option 1: Web Browser (Recommended for Testing)
```bash
flutter run -d chrome --web-port=8080
```
Then open: **http://localhost:8080**

### Option 2: macOS Desktop
```bash
flutter run -d macos
```

### Option 3: Build and Serve Web
```bash
flutter build web --release
cd build/web
python3 -m http.server 8080
```
Then open: **http://localhost:8080**

## 🎯 What to Test

### 1. Dashboard
- Navigate to Home tab
- View portfolio balance
- Check spending analytics
- See recent transactions

### 2. Wallet Features
- Create a new wallet
- View seed phrase (make sure to save it!)
- Check wallet address

### 3. Scanner
- Click Scan button in bottom nav
- Test QR code scanning (webcam will be requested)
- Try scanning a crypto address QR code

### 4. Blockchain Integration
- Create wallet to see real Ethereum address
- Balance will show 0 ETH (unless you fund it)
- Transactions can be sent (use testnet first!)

### 5. Other Features
- **Swap**: Token swapping interface
- **Pulse**: NFC payment feature
- **Settings**: Biometric auth, preferences
- **Portfolio**: Analytics and charts
- **Alerts**: Price alerts
- **Chat**: Crypto assistant

## 📱 Mobile View
1. Open in Chrome
2. Press `F12` or `Cmd+Option+I` for DevTools
3. Click device toggle icon 📱
4. Select "iPhone 12 Pro" or similar
5. Refresh page

## 🔧 Troubleshooting

### App Not Starting
- Make sure Flutter is installed: `flutter doctor`
- Check dependencies: `flutter pub get`
- Clear build: `flutter clean && flutter pub get`

### Web Build Issues
- Use Chrome for best compatibility
- Check console for errors (F12)
- Try incognito mode if issues persist

### Camera Not Working
- Grant camera permission in browser
- Use HTTPS or localhost (required for webcam)
- Test on actual mobile device for best results

## 🌐 Access from Phone

If your phone is on the same WiFi:
1. Find your computer's IP: `ifconfig | grep "inet " | grep -v 127.0.0.1`
2. On phone browser: `http://YOUR_IP:8080`
3. Example: `http://192.168.100.4:8080`

## ⚡ Quick Commands

```bash
# Run on Chrome
flutter run -d chrome

# Run on macOS
flutter run -d macos

# Build web release
flutter build web --release

# Check running processes
lsof -ti:8080
```

---

**Current Status**: App should be running! 🎉




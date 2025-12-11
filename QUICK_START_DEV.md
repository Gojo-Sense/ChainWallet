# Quick Start Guide - Development Environment

This guide helps you start both the Flutter app and Angular dashboard for development.

## Prerequisites

- Flutter SDK installed and configured
- Node.js and npm installed
- Angular CLI installed globally: `npm install -g @angular/cli`

## Quick Start (Automatic)

### macOS / Linux

```bash
./start_dev.sh
```

This script will:
1. Install Angular dependencies if needed
2. Start Angular server on port 4200
3. Start Flutter app on port 8080

### Windows

```bash
start_dev.bat
```

## Manual Start

If you prefer to start servers manually:

### Terminal 1 - Angular Dashboard

```bash
cd web-admin
npm install  # Only needed first time
npm start
```

The Angular dashboard will be available at: http://localhost:4200

### Terminal 2 - Flutter App

```bash
flutter run -d chrome --web-port=8080
```

The Flutter app will be available at: http://localhost:8080

## Using the Dashboard

1. Open the Flutter app at http://localhost:8080
2. Click the "Dashboard" tab in the bottom navigation
3. Check the server status indicator:
   - 🟢 **Server Online**: Click "Open Dashboard" to open Angular dashboard
   - 🔴 **Server Offline**: Follow instructions in the error dialog
4. The Angular dashboard will open in a new browser tab

## Troubleshooting

### Angular Server Not Starting

- Check if port 4200 is already in use: `lsof -i :4200` (macOS/Linux) or `netstat -ano | findstr :4200` (Windows)
- Check Angular logs in `web-admin/angular_server.log`
- Try: `cd web-admin && npm install && npm start`

### Flutter App Not Starting

- Check if port 8080 is already in use
- Run `flutter clean && flutter pub get`
- Check Flutter doctor: `flutter doctor`

### Connection Refused Error

- Ensure Angular server is running on port 4200
- Check the server status indicator in the Dashboard tab
- Verify firewall isn't blocking localhost connections

## Stopping Servers

Press `Ctrl+C` in the terminal where the servers are running.

If using the startup script, press `Ctrl+C` to stop both servers.


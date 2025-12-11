@echo off
REM ============================================================================
REM Aether Wallet - Development Startup Script (Windows)
REM Starts both Angular Dashboard and Flutter App
REM ============================================================================

echo 🚀 Starting Aether Wallet Development Environment
echo.

REM Check if Angular project exists
if not exist "web-admin" (
    echo ❌ Error: web-admin directory not found
    exit /b 1
)

REM Check if node_modules exists
if not exist "web-admin\node_modules" (
    echo ⚠️  node_modules not found. Installing dependencies...
    cd web-admin
    call npm install
    cd ..
)

REM Start Angular server in background
echo 📊 Starting Angular Dashboard server...
start /B cmd /c "cd web-admin && npm start > angular_server.log 2>&1"

REM Wait for Angular server to start
echo ⏳ Waiting for Angular server to start (this may take a moment)...
timeout /t 5 /nobreak >nul

echo.
echo ✅ Angular server should be running on http://localhost:4200
echo.
echo 📱 Starting Flutter app...

REM Start Flutter app
flutter run -d chrome --web-port=8080

REM Cleanup on exit
echo.
echo 🛑 Press any key to stop all servers...
pause >nul


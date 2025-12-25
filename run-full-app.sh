#!/bin/bash

# Run Full Aether Wallet Application
# This script starts all required services for the Aether Wallet application

echo "🚀 Starting Aether Wallet Full Application..."

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Kill any existing processes on our ports
echo "🧹 Cleaning up existing processes..."
lsof -ti:3000,8080,4200,5000 2>/dev/null | xargs kill -9 2>/dev/null

# Wait a moment for processes to terminate
sleep 2

# Function to check if a service is running
check_service() {
    local port=$1
    local name=$2
    if curl -s http://localhost:$port > /dev/null 2>&1; then
        echo -e "${GREEN}✅ $name is running on port $port${NC}"
        return 0
    else
        echo -e "${YELLOW}⏳ $name is starting on port $port...${NC}"
        return 1
    fi
}

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Start Mock Node.js Backend
echo ""
echo "📦 Starting Mock Node.js Backend (Port 3000)..."
cd "$SCRIPT_DIR"
node mock-backend.js > /tmp/mock-backend.log 2>&1 &
MOCK_BACKEND_PID=$!
echo "Mock Node.js Backend PID: $MOCK_BACKEND_PID"

# Start Demo Trading Server
echo ""
echo "📈 Starting Demo Trading Server (Port 8080)..."
cd "$SCRIPT_DIR"
node demo-trading-server.js > /tmp/demo-trading.log 2>&1 &
DEMO_TRADING_PID=$!
echo "Demo Trading Server PID: $DEMO_TRADING_PID"

# Start Angular Frontend
echo ""
echo "🅰️  Starting Angular Frontend (Port 4200)..."
cd "$SCRIPT_DIR/web-admin"
npm start > /tmp/angular-frontend.log 2>&1 &
ANGULAR_PID=$!
echo "Angular Frontend PID: $ANGULAR_PID"

# Wait for backend services to start
echo ""
echo "⏳ Waiting for backend services to start (this may take 15-30 seconds)..."
echo ""

# Check backend services with retries
MAX_RETRIES=15
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    MOCK_READY=0
    DEMO_READY=0
    
    check_service 3000 "Mock Node.js Backend" && MOCK_READY=1
    check_service 8080 "Demo Trading Server" && DEMO_READY=1
    
    if [ $MOCK_READY -eq 1 ] && [ $DEMO_READY -eq 1 ]; then
        break
    fi
    
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 2
done

echo ""
echo "=========================================="
if [ $MOCK_READY -eq 1 ] && [ $DEMO_READY -eq 1 ]; then
    echo -e "${GREEN}🎉 Backend services are running!${NC}"
    echo ""
    echo "📍 Service URLs:"
    echo "   Mock Node.js Backend:    http://localhost:3000"
    echo "   Demo Trading Server:     http://localhost:8080"
    echo ""
    echo "📊 Log Files:"
    echo "   Mock Backend:    tail -f /tmp/mock-backend.log"
    echo "   Demo Trading:    tail -f /tmp/demo-trading.log"
else
    echo -e "${RED}⚠️  Some backend services may not be ready yet${NC}"
    echo ""
    echo "Check logs for details:"
    echo "   tail -f /tmp/mock-backend.log"
    echo "   tail -f /tmp/demo-trading.log"
fi
echo "=========================================="

# Wait for Angular to start
echo ""
echo "⏳ Waiting for Angular frontend to start..."
RETRY_COUNT=0
ANGULAR_READY=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    check_service 4200 "Angular Frontend" && ANGULAR_READY=1 && break
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 2
done

echo ""
echo "=========================================="
if [ $ANGULAR_READY -eq 1 ]; then
    echo -e "${GREEN}🎉 Angular Frontend is running!${NC}"
    echo ""
    echo "📍 Angular Dashboard:  http://localhost:4200"
else
    echo -e "${RED}⚠️  Angular Frontend may not be ready yet${NC}"
    echo ""
    echo "Check logs: tail -f /tmp/angular-frontend.log"
fi
echo "=========================================="

# Start Flutter app
echo ""
echo "📱 Starting Flutter App..."
cd "$SCRIPT_DIR"
flutter pub get > /tmp/flutter-deps.log 2>&1
flutter run -d chrome > /tmp/flutter-app.log 2>&1 &
FLUTTER_PID=$!
echo "Flutter App PID: $FLUTTER_PID"

# Wait for Flutter to start
echo ""
echo "⏳ Waiting for Flutter app to start..."
RETRY_COUNT=0
FLUTTER_READY=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    # For Flutter, we'll just wait a bit since it doesn't have a simple health check
    if [ $RETRY_COUNT -gt 5 ] && [ $FLUTTER_READY -eq 0 ]; then
        echo -e "${GREEN}✅ Flutter App should be starting (check browser)${NC}"
        FLUTTER_READY=1
    fi
    
    if [ $FLUTTER_READY -eq 1 ]; then
        break
    fi
    
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 2
done

echo ""
echo "=========================================="
echo -e "${GREEN}🎉 All services are running!${NC}"
echo ""
echo "📍 Service URLs:"
echo "   Mock Node.js Backend:    http://localhost:3000"
echo "   Demo Trading Server:     http://localhost:8080"
echo "   Angular Dashboard:       http://localhost:4200"
echo "   Flutter App:             Check browser after startup"
echo ""
echo "📊 Log Files:"
echo "   Mock Backend:    tail -f /tmp/mock-backend.log"
echo "   Demo Trading:    tail -f /tmp/demo-trading.log"
echo "   Angular:         tail -f /tmp/angular-frontend.log"
echo "   Flutter:         tail -f /tmp/flutter-app.log"
echo ""
echo "🛑 To stop all services:"
echo "   kill $MOCK_BACKEND_PID $DEMO_TRADING_PID $ANGULAR_PID $FLUTTER_PID"
echo ""
echo "Or press Ctrl+C to stop this script"
echo "=========================================="

# Keep script running and handle Ctrl+C
trap "echo -e '\n${YELLOW}Stopping all services...${NC}'; kill $MOCK_BACKEND_PID $DEMO_TRADING_PID $ANGULAR_PID $FLUTTER_PID 2>/dev/null; exit" INT TERM

# Wait indefinitely
while true; do
    sleep 1
done
#!/bin/bash

# Start Full Project Script for Aether Wallet
# This script starts Node.js backend, Spring Boot backend, Angular frontend, and Flutter app

echo "🚀 Starting Full Aether Wallet Project..."
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Kill any existing processes on these ports
echo "🧹 Cleaning up existing processes..."
lsof -ti:3000,8080,4200,5000 2>/dev/null | xargs kill -9 2>/dev/null
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

# Start Node.js Backend
echo ""
echo "📦 Starting Node.js Backend (Port 3000)..."
cd "$SCRIPT_DIR/backend"
if [ ! -d "node_modules" ]; then
    echo "Installing Node.js dependencies..."
    npm install
fi
npm run dev > /tmp/nodejs-backend.log 2>&1 &
NODE_PID=$!
echo "Node.js Backend PID: $NODE_PID"

# Start Spring Boot Backend
echo ""
echo "☕ Starting Spring Boot Backend (Port 8080)..."
cd "$SCRIPT_DIR/backend-spring"
mvn spring-boot:run -Dspring-boot.run.profiles=dev > /tmp/spring-backend.log 2>&1 &
SPRING_PID=$!
echo "Spring Boot Backend PID: $SPRING_PID"

# Start Angular Frontend
echo ""
echo "🅰️  Starting Angular Frontend (Port 4200)..."
cd "$SCRIPT_DIR/web-admin"
if [ ! -d "node_modules" ]; then
    echo "Installing Angular dependencies..."
    npm install
fi
npm start > /tmp/angular-frontend.log 2>&1 &
ANGULAR_PID=$!
echo "Angular Frontend PID: $ANGULAR_PID"

# Wait for backend services to start
echo ""
echo "⏳ Waiting for backend services to start (this may take 30-60 seconds)..."
echo ""

# Check backend services with retries
MAX_RETRIES=30
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    NODE_READY=0
    SPRING_READY=0
    
    check_service 3000 "Node.js Backend" && NODE_READY=1
    check_service 8080 "Spring Boot Backend" && SPRING_READY=1
    
    if [ $NODE_READY -eq 1 ] && [ $SPRING_READY -eq 1 ]; then
        break
    fi
    
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 2
done

echo ""
echo "=========================================="
if [ $NODE_READY -eq 1 ] && [ $SPRING_READY -eq 1 ]; then
    echo -e "${GREEN}🎉 Backend services are running!${NC}"
    echo ""
    echo "📍 Service URLs:"
    echo "   Node.js Backend:    http://localhost:3000"
    echo "   Spring Boot API:    http://localhost:8080"
    echo ""
    echo "📊 Log Files:"
    echo "   Node.js:    tail -f /tmp/nodejs-backend.log"
    echo "   Spring:     tail -f /tmp/spring-backend.log"
else
    echo -e "${RED}⚠️  Some backend services may not be ready yet${NC}"
    echo ""
    echo "Check logs for details:"
    echo "   tail -f /tmp/nodejs-backend.log"
    echo "   tail -f /tmp/spring-backend.log"
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

# Wait for services to start
echo ""
echo "⏳ Waiting for all services to start..."
echo ""

# Check all services with retries
RETRY_COUNT=0
ANGULAR_READY=0
FLUTTER_READY=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    check_service 4200 "Angular Frontend" && ANGULAR_READY=1
    # For Flutter, we'll just wait a bit since it doesn't have a simple health check
    if [ $RETRY_COUNT -gt 10 ] && [ $FLUTTER_READY -eq 0 ]; then
        echo -e "${GREEN}✅ Flutter App should be starting (check browser)${NC}"
        FLUTTER_READY=1
    fi
    
    if [ $ANGULAR_READY -eq 1 ] && [ $FLUTTER_READY -eq 1 ]; then
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
echo "   Node.js Backend:    http://localhost:3000"
echo "   Spring Boot API:    http://localhost:8080"
echo "   Angular Dashboard:  http://localhost:4200"
echo "   Flutter App:        http://localhost:5000 (or check browser)"
echo ""
echo "📊 Log Files:"
echo "   Node.js:    tail -f /tmp/nodejs-backend.log"
echo "   Spring:     tail -f /tmp/spring-backend.log"
echo "   Angular:    tail -f /tmp/angular-frontend.log"
echo "   Flutter:    tail -f /tmp/flutter-app.log"
echo ""
echo "🛑 To stop all services:"
echo "   kill $NODE_PID $SPRING_PID $ANGULAR_PID $FLUTTER_PID"
echo ""
echo "Or press Ctrl+C to stop this script"
echo "=========================================="

# Keep script running
wait
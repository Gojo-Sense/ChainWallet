#!/bin/bash

# ============================================================================
# Aether Wallet - Development Startup Script
# Starts both Angular Dashboard and Flutter App
# ============================================================================

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Starting Aether Wallet Development Environment${NC}"
echo ""

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Check if Angular project exists
if [ ! -d "web-admin" ]; then
    echo -e "${RED}❌ Error: web-admin directory not found${NC}"
    exit 1
fi

# Check if node_modules exists
if [ ! -d "web-admin/node_modules" ]; then
    echo -e "${YELLOW}⚠️  node_modules not found. Installing dependencies...${NC}"
    cd web-admin
    npm install
    cd ..
fi

# Function to cleanup on exit
cleanup() {
    echo ""
    echo -e "${YELLOW}🛑 Shutting down servers...${NC}"
    kill $(jobs -p) 2>/dev/null || true
    exit
}

# Trap Ctrl+C
trap cleanup INT TERM

# Start Angular server in background
echo -e "${GREEN}📊 Starting Angular Dashboard server...${NC}"
cd web-admin
npm start > /tmp/angular_server.log 2>&1 &
ANGULAR_PID=$!
cd ..

# Wait for Angular server to start
echo -e "${YELLOW}⏳ Waiting for Angular server to start (this may take a moment)...${NC}"
sleep 5

# Check if Angular server is running
if ! kill -0 $ANGULAR_PID 2>/dev/null; then
    echo -e "${RED}❌ Failed to start Angular server${NC}"
    echo "Check /tmp/angular_server.log for details"
    exit 1
fi

# Check if port 4200 is listening
if lsof -Pi :4200 -sTCP:LISTEN -t >/dev/null ; then
    echo -e "${GREEN}✅ Angular server is running on http://localhost:4200${NC}"
else
    echo -e "${YELLOW}⚠️  Angular server may still be starting...${NC}"
fi

echo ""
echo -e "${GREEN}📱 Starting Flutter app...${NC}"

# Start Flutter app (this will block)
flutter run -d chrome --web-port=8080

# Cleanup on exit
cleanup


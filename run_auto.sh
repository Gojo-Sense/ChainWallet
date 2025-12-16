#!/bin/bash

# ============================================================================
# Auto-run script for Aether Wallet
# Automatically runs the Flutter app with hot reload
# ============================================================================

echo "🚀 Starting Aether Wallet..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    exit 1
fi

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Check available devices
echo "📱 Checking available devices..."
DEVICES=$(flutter devices | grep -E "(chrome|macos|android|ios)" | head -1)

if [ -z "$DEVICES" ]; then
    echo "⚠️  No devices found. Starting Chrome by default..."
    DEVICE="chrome"
else
    # Prefer Chrome for web, then macOS, then first available
    if echo "$DEVICES" | grep -q "chrome"; then
        DEVICE="chrome"
    elif echo "$DEVICES" | grep -q "macos"; then
        DEVICE="macos"
    else
        DEVICE=$(echo "$DEVICES" | awk '{print $1}')
    fi
fi

echo "🎯 Running on: $DEVICE"

# Run the app
if [ "$DEVICE" = "chrome" ]; then
    flutter run -d chrome --web-port=8080
elif [ "$DEVICE" = "macos" ]; then
    flutter run -d macos
else
    flutter run -d "$DEVICE"
fi




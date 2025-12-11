#!/bin/bash

# Script to install PostgreSQL and Redis on macOS

echo "🔧 Installing PostgreSQL and Redis for Aether Wallet Backend"
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install PostgreSQL
if ! command -v psql &> /dev/null; then
    echo "📦 Installing PostgreSQL..."
    brew install postgresql@14
    brew services start postgresql@14
    
    # Create database
    echo "📊 Creating database..."
    sleep 2
    createdb aether_wallet 2>/dev/null || echo "Database might already exist"
    echo "✅ PostgreSQL installed and database created"
else
    echo "✅ PostgreSQL is already installed"
    # Ensure database exists
    createdb aether_wallet 2>/dev/null || echo "Database might already exist"
fi

# Install Redis
if ! command -v redis-server &> /dev/null; then
    echo "📦 Installing Redis..."
    brew install redis
    brew services start redis
    echo "✅ Redis installed and started"
else
    echo "✅ Redis is already installed"
    # Start Redis if not running
    brew services start redis 2>/dev/null || redis-server --daemonize yes
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Update .env file with your database credentials if needed"
echo "2. Run: npm run migrate"
echo "3. Run: npm run dev"



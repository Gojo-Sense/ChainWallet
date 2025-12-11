#!/bin/bash

# Database setup script for Aether Wallet Backend
# This script will help you create the database

echo "🔧 Setting up Aether Wallet Database"
echo ""

# Check which PostgreSQL is available
if [ -f "/Library/PostgreSQL/18/bin/psql" ]; then
    PSQL="/Library/PostgreSQL/18/bin/psql"
    echo "✅ Found PostgreSQL 18"
elif [ -f "/opt/homebrew/opt/postgresql@14/bin/psql" ]; then
    PSQL="/opt/homebrew/opt/postgresql@14/bin/psql"
    echo "✅ Found PostgreSQL 14"
else
    PSQL="psql"
    echo "⚠️  Using system psql"
fi

echo ""
echo "Please enter your PostgreSQL password when prompted"
echo "If you don't have a password set, you can press Enter"
echo ""

# Try to create database with postgres user
echo "Attempting to create database 'aether_wallet'..."
$PSQL -U postgres -c "CREATE DATABASE aether_wallet;" 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Database 'aether_wallet' created successfully!"
    echo ""
    echo "Database connection details:"
    echo "  Host: localhost"
    echo "  Port: 5432"
    echo "  Database: aether_wallet"
    echo "  User: postgres"
    exit 0
fi

# If postgres user fails, try with current user
echo ""
echo "Trying with current user ($USER)..."
$PSQL -U $USER -c "CREATE DATABASE aether_wallet;" 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Database 'aether_wallet' created successfully!"
    echo ""
    echo "Database connection details:"
    echo "  Host: localhost"
    echo "  Port: 5432"
    echo "  Database: aether_wallet"
    echo "  User: $USER"
    exit 0
fi

echo ""
echo "❌ Could not create database automatically."
echo ""
echo "Please run this command manually:"
echo "  $PSQL -U postgres -c \"CREATE DATABASE aether_wallet;\""
echo ""
echo "Or if you know your PostgreSQL password, run:"
echo "  PGPASSWORD=your_password $PSQL -U postgres -c \"CREATE DATABASE aether_wallet;\""



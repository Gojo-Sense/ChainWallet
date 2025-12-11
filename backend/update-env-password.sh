#!/bin/bash

# Script to update PostgreSQL password in .env file
# Usage: ./update-env-password.sh YOUR_PASSWORD

if [ -z "$1" ]; then
    echo "Usage: ./update-env-password.sh YOUR_POSTGRES_PASSWORD"
    echo ""
    echo "Example: ./update-env-password.sh mypassword123"
    exit 1
fi

PASSWORD="$1"
ENV_FILE=".env"

if [ ! -f "$ENV_FILE" ]; then
    echo "Error: .env file not found!"
    exit 1
fi

# Update DB_PASSWORD
sed -i '' "s/^DB_PASSWORD=.*/DB_PASSWORD=$PASSWORD/" "$ENV_FILE"

# Update DATABASE_URL
sed -i '' "s|postgresql://postgres:.*@localhost|postgresql://postgres:$PASSWORD@localhost|" "$ENV_FILE"

echo "✅ Updated .env file with your PostgreSQL password"
echo ""
echo "Updated values:"
grep -E "DB_PASSWORD|DATABASE_URL" "$ENV_FILE" | head -2



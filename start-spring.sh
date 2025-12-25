#!/bin/bash
# Start Spring Boot with database password prompt

echo "🔐 Spring Boot Trading Backend Startup"
echo ""
echo "Please enter your PostgreSQL password:"
read -s DB_PASSWORD

export DB_PASSWORD=$DB_PASSWORD
export DB_USER=postgres
export DATABASE_URL=jdbc:postgresql://localhost:5432/aether_wallet

cd "$(dirname "$0")/backend-spring"
mvn spring-boot:run

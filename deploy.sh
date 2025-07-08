#!/bin/bash

cd /home/ubuntu/pavan-demo/fastapi

echo "🌀 Pulling latest code..."
git pull origin main

echo "🐳 Rebuilding Docker..."
docker stop fastapi-live || true
docker rm fastapi-live || true
docker build -t fastapi-app .

echo "🚀 Running container..."
docker run -d -p 8000:8000 -v $(pwd):/app --name fastapi-live fastapi-app

echo "✅ Deployment complete"

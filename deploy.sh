#!/bin/bash

set -e  # stop if any command fails

echo "📥 Pulling latest code..."
git fetch origin
git reset --hard origin/main

echo "📦 Installing dependencies..."
npm ci

echo "🏗 Building project..."
npm run build

echo "🚀 Deploying to Nginx..."
sudo rm -rf /var/www/html/*
sudo cp -r dist/* /var/www/html/

echo "🔄 Restarting Nginx..."
sudo systemctl restart nginx

echo "✅ Deployment complete!"
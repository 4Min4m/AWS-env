#!/bin/bash
# Install Node.js dependencies after the application files are copied
APP_DIR="/home/ubuntu/devsecops-app"
cd "$APP_DIR"

echo "Installing Node.js dependencies..."
npm install
if [ $? -ne 0 ]; then
    echo "npm install failed with exit code $?. Please check logs."
    exit 1 # Fail the deployment if npm install fails
fi
echo "Dependencies installed."
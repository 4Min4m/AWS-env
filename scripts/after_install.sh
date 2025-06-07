#!/bin/bash
# Install Node.js dependencies after the application files are copied

APP_DIR="/home/ubuntu/devsecops-app"
cd "$APP_DIR"

echo "Changing ownership of application directory to ubuntu:ubuntu recursively..."
sudo chown -R ubuntu:ubuntu "$APP_DIR"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to change ownership of application directory to ubuntu:ubuntu. Deployment will fail."
    exit 1 # Fail the deployment if ownership change fails
fi
echo "Ownership changed successfully."

echo "Installing Node.js dependencies (npm install)..."
npm install
if [ $? -ne 0 ]; then
    echo "ERROR: npm install failed with exit code $?. Please check logs for details."
    exit 1 # Fail the deployment if npm install fails
fi
echo "Node.js dependencies installed."
#!/bin/bash
# Remove old application files and ensure correct ownership for the new deployment

DEPLOY_ROOT="/home/ubuntu" # The home directory of the ubuntu user
APP_DIR="$DEPLOY_ROOT/devsecops-app"

echo "Running BeforeInstall hook..."

# Ensure the deployment directory exists and is owned by ubuntu
sudo mkdir -p "$APP_DIR"
sudo chown -R ubuntu:ubuntu "$APP_DIR" # Ensure ubuntu user owns the directory and its contents recursively

# Remove old application files, but preserve the parent directory
if [ -d "$APP_DIR" ]; then
  echo "Removing existing application files from: $APP_DIR"
  sudo rm -rf "$APP_DIR/*" || true # Remove contents, ignore error if directory is empty
  sudo rm -rf "$APP_DIR/.[!.]*" || true # Remove hidden files, ignore error if none
fi

echo "Cleaned up old installation and ensured permissions."
#!/bin/bash

DEPLOY_ROOT="/home/ubuntu" # The home directory of the ubuntu user
APP_DIR="$DEPLOY_ROOT/devsecops-app"

echo "Running BeforeInstall hook..."

sudo mkdir -p "$APP_DIR"

sudo chown -R ubuntu:ubuntu "$APP_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to set ownership of application directory to ubuntu:ubuntu. Exiting."
    exit 1
fi

if [ -d "$APP_DIR" ]; then
  echo "Removing existing application files from: $APP_DIR"
  # Remove all files and directories inside APP_DIR, including hidden ones
  sudo rm -rf "$APP_DIR"/* || true
  sudo rm -rf "$APP_DIR"/.[!.]* || true
else
  echo "Application directory not found, nothing to clean up."
fi


echo "Cleaned up old installation and ensured initial directory permissions."
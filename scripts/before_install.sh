#!/bin/bash
# Remove old application files before installing new ones
DEPLOY_DIR="/home/ubuntu/devsecops-app" # Changed user to ubuntu
if [ -d "$DEPLOY_DIR" ]; then
  echo "Removing existing application directory: $DEPLOY_DIR"
  sudo rm -rf "$DEPLOY_DIR"
fi
sudo mkdir -p "$DEPLOY_DIR"
sudo chown ubuntu:ubuntu "$DEPLOY_DIR" # Changed user to ubuntu
echo "Cleaned up old installation."
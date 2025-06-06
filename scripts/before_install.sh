    #!/bin/bash
    # Remove old application files before installing new ones
    DEPLOY_DIR="/home/ec2-user/devsecops-app"
    if [ -d "$DEPLOY_DIR" ]; then
      echo "Removing existing application directory: $DEPLOY_DIR"
      sudo rm -rf "$DEPLOY_DIR"
    fi
    sudo mkdir -p "$DEPLOY_DIR"
    sudo chown ec2-user:ec2-user "$DEPLOY_DIR"
    echo "Cleaned up old installation."
    #!/bin/bash
    # Stop the Node.js application if it's running
    if [ -f /home/ubuntu/devsecops-app/app.js ]; then
      # Find and kill the Node.js process listening on port 3000
      PM2_APP_NAME="devsecops-hello-world-app"
      PM2_IS_INSTALLED=$(pm2 -v)

      if [ $? -eq 0 ]; then
        echo "PM2 is installed. Stopping app via PM2..."
        pm2 stop $PM2_APP_NAME || true
        pm2 delete $PM2_APP_NAME || true
      else
        echo "PM2 not installed or not in PATH. Attempting to kill Node.js process..."
        PROCESS_ID=$(lsof -t -i:3000)
        if [ ! -z "$PROCESS_ID" ]; then
          echo "Killing Node.js process on port 3000 (PID: $PROCESS_ID)..."
          kill -9 $PROCESS_ID
        else
          echo "No Node.js process found on port 3000."
        fi
      fi
    else
      echo "Application not found or not running, nothing to stop."
    fi
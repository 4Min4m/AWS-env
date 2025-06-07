    #!/bin/bash
    # Start the Node.js application using PM2 for process management
    APP_DIR="/home/ubuntu/devsecops-app"
    cd "$APP_DIR"
    export NODE_ENV=$DEPLOYMENT_GROUP_NAME # Set NODE_ENV based on deployment group name (Staging/Production)
    echo "Starting Node.js application with NODE_ENV=${NODE_ENV}..."

    PM2_APP_NAME="devsecops-hello-world-app"

    # Start the application using PM2
    pm2 start app.js --name "$PM2_APP_NAME"
    pm2 save # Save current process list for persistence across reboots
    echo "Node.js application started."
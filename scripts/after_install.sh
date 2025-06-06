    #!/bin/bash
    # Install Node.js dependencies after the application files are copied
    APP_DIR="/home/ec2-user/devsecops-app"
    cd "$APP_DIR"
    echo "Installing Node.js dependencies..."
    npm install
    echo "Dependencies installed."
    # Install PM2 globally if not present - for robust process management
    # (Optional but recommended for production-like Node.js apps)
    if ! command -v pm2 &> /dev/null
    then
        echo "PM2 not found, installing globally..."
        npm install pm2@latest -g
    fi
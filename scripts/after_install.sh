#!/bin/bash
# Install Node.js dependencies after the application files are copied
APP_DIR="/home/ec2-user/devsecops-app"
cd "$APP_DIR"

# Ensure Node.js and npm are in the PATH for this script's execution
# Common Node.js install paths on Amazon Linux 2 are /usr/bin or /usr/local/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/usr/local/bin:/usr/bin:/home/ec2-user/.nvm/versions/node/v18.0.0/bin # Add common Node.js binary paths

# Verify npm is available. If not, try installing it again (might be redundant but safe)
if ! command -v npm &> /dev/null
then
    echo "npm not found in PATH, attempting to re-install nodejs..."
    curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
    sudo yum install -y nodejs
    echo "Node.js (and npm) re-installation attempted."
    # Re-export PATH after re-install
    export PATH=$PATH:/usr/local/bin:/usr/bin:/home/ec2-user/.nvm/versions/node/v18.0.0/bin
fi

echo "Installing Node.js dependencies..."
npm install
if [ $? -ne 0 ]; then
    echo "npm install failed with exit code $?. Please check logs."
    exit 1 # Fail the deployment if npm install fails
fi
echo "Dependencies installed."

# Install PM2 globally if not present - for robust process management
if ! command -v pm2 &> /dev/null
then
    echo "PM2 not found, installing globally..."
    npm install pm2@latest -g
    if [ $? -ne 0 ]; then
        echo "PM2 global install failed with exit code $?. Please check logs."
        exit 1 # Fail the deployment if pm2 install fails
    fi
fi
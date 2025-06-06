    #!/bin/bash
    # Validate that the application is running by making a local request
    echo "Validating service health..."
    sleep 10 # Give the app a moment to start
    RESPONSE=$(curl -s http://localhost:3000)
    if echo "$RESPONSE" | grep -q "Hello from DevSecOps Node.js App!"; then
      echo "Service validation successful. Application is running."
      exit 0
    else
      echo "Service validation failed. Application not responding as expected."
      echo "Response: $RESPONSE"
      exit 1
    fi
    const express = require('express');
    const app = express();
    const port = 3000;

    app.get('/', (req, res) => {
      res.send(`
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>DevSecOps Node.js App</title>
            <style>
                body {
                    font-family: 'Inter', sans-serif;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: 100vh;
                    margin: 0;
                    background-color: #f0f2f5;
                    color: #333;
                    text-align: center;
                }
                .container {
                    background-color: #ffffff;
                    padding: 40px;
                    border-radius: 12px;
                    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                    max-width: 600px;
                    width: 90%;
                    border: 1px solid #e0e0e0;
                }
                h1 {
                    color: #0056b3;
                    margin-bottom: 15px;
                    font-size: 2.5em;
                }
                p {
                    font-size: 1.1em;
                    line-height: 1.6;
                    color: #555;
                }
                .footer {
                    margin-top: 30px;
                    font-size: 0.9em;
                    color: #888;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Hello from DevSecOps Node.js App!</h1>
                <p>This application was deployed via a secure CI/CD pipeline on AWS.</p>
                <p>The current environment is <strong>${process.env.NODE_ENV || 'development'}</strong>.</p>
                <div class="footer">
                    <p>&copy; 2025 DevSecOps Demo</p>
                </div>
            </div>
        </body>
        </html>
      `);
    });

    app.listen(port, () => {
      console.log(`Node.js app listening at http://localhost:${port}`);
    });
    
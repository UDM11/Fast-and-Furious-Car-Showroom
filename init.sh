#!/bin/bash

# Create necessary directories
mkdir -p backend/src/{controllers,models,routes,middleware,utils,config,database}
mkdir -p backend/logs
mkdir -p frontend/src/{components,pages,store,utils,assets,hooks}
mkdir -p frontend/public/images

# Initialize backend
cd backend
npm init -y
npm install

# Create .env file from example
cp .env.example .env

# Initialize database
npm run db:migrate
npm run db:seed

cd ../frontend
npm install

# Create .env file
echo "REACT_APP_API_URL=http://localhost:5000/api" > .env

# Return to root directory
cd ..

echo "Project initialization completed!"
echo "To start the application:"
echo "1. Start the backend: cd backend && npm run dev"
echo "2. Start the frontend: cd frontend && npm start"
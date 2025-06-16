#!/bin/bash

echo "🔧 Starting MultiAgent Healthcare setup..."

# Step 1: Copy .env template if missing
if [ ! -f .env ]; then
  cp env.template .env
  echo "✅ .env created from env.template"
else
  echo "ℹ️ .env already exists"
fi

# Step 2: Initialize Terraform in dev and prod
echo "📦 Initializing Terraform..."
cd infra/dev && terraform init && cd ../prod && terraform init && cd ../..
echo "✅ Terraform initialized in dev and prod."

# Step 3: Python Virtual Environment Setup
if [ -f requirements.txt ]; then
  if [ ! -d .venv ]; then
    echo "📦 Creating Python virtual environment..."
    python3 -m venv .venv
    echo "✅ Virtual environment created."
  fi

  echo "📦 Installing Python dependencies..."
  . .venv/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
  deactivate
  echo "✅ Python dependencies installed."
else
  echo "⚠️ No requirements.txt found. Skipping Python setup."
fi

# Step 4: Node.js setup for frontend (if folder exists)
if [ -d "frontend" ]; then
  echo "🧩 Setting up frontend..."
  cd frontend
  if [ -f package.json ]; then
    npm install
    echo "✅ Frontend dependencies installed."
  else
    echo "⚠️ No package.json found in frontend. Skipping frontend setup."
  fi
  cd ..
fi

# Step 5: Reminder for Google ADK setup
echo "📌 NOTE: Make sure your GOOGLE_APPLICATION_CREDENTIALS are set in your .env"
echo "📌 ADK agents should be installed and configured in /agents via Google ADK"

echo "🚀 Setup complete. You’re ready to start development!"

#!/bin/bash

echo "🔧 Starting multiagent-healthcare setup..."

# Step 1: Copy .env template if missing
if [ ! -f .env ]; then
  cp env.template .env
  echo "✅ .env created from env.template"
else
  echo "ℹ️ .env already exists"
fi

# Step 2: Initialize Terraform in dev and prod
cd infra/dev && terraform init && cd ../prod && terraform init && cd ../..
echo "✅ Terraform initialized in dev and prod."

# Step 3: Set up Python virtual environment
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
  echo "✅ Dependencies installed."
else
  echo "⚠️ No requirements.txt found, skipping Python setup."
fi

echo "🚀 Setup complete. Now update your .env with real secrets."

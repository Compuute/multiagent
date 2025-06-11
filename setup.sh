#!/bin/bash

echo "🔧 Starting setup..."

# Copy .env template
if [ ! -f .env ]; then
  cp env.template .env
  echo "✅ .env file created from env.template"
else
  echo "ℹ️ .env file already exists"
fi

# Initialize Terraform in both environments
cd infra/dev
terraform init
cd ../prod
terraform init
cd ../..

echo "✅ Terraform initialized in both dev and prod."

echo "💡 Setup complete! Update your .env with the correct secrets."





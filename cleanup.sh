#!/bin/bash

echo "🧹 Cleaning up test environment..."

# Remove .env if it exists
if [ -f .env ]; then
  rm .env
  echo "🗑️ Removed .env"
fi

# Remove Python virtual environment
if [ -d .venv ]; then
  rm -rf .venv
  echo "🗑️ Removed .venv"
fi

# Remove Terraform directories and lock files
rm -rf infra/dev/.terraform
rm -rf infra/prod/.terraform
rm -rf .terraform
rm -f infra/dev/.terraform.lock.hcl
rm -f infra/prod/.terraform.lock.hcl

echo "✅ Cleanup complete."

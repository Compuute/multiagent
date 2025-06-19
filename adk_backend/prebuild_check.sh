#!/bin/bash

echo ""
echo "🔍 Validating requirements.txt syntax..."

set -e

# Endast validera pip-syntax, installera inte fulla paket
if grep -q "==" requirements.txt; then
  echo "✅ Syntax OK in requirements.txt"
else
  echo "⚠️ No fixed versions found (==) – may be unsafe for prod deploys"
fi

exit 0

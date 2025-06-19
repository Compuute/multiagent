#!/bin/bash

echo ""
echo "🔍 Checking dependency compatibility in requirements.txt..."

set -e  # Stop execution if any command fails

# Upgrade pip
echo "⚙️ Upgrading pip..."
python3 -m pip install --upgrade pip

# Install dependencies and capture output
echo "📦 Installing dependencies..."
if python3 -m pip install -r requirements.txt 2>&1 | tee .pip_check.log | grep -Ei "ResolutionImpossible|conflict|incompatible"; then
  echo ""
  echo "❌ Dependency conflict detected!"
  echo "🧩 Conflict details:"
  grep -Ei "ResolutionImpossible|conflict|incompatible" .pip_check.log
  echo ""
  echo "💡 Suggestion: Loosen or review version constraints in requirements.txt"
  echo "📄 Full log saved in .pip_check.log"
  exit 1
else
  echo ""
  echo "✅ All dependencies resolved successfully!"
  rm -f .pip_check.log
  exit 0
fi

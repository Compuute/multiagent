#!/bin/bash

# === SETTINGS ===
PROJECT_ID="hacker2025-team-10-dev"
REGION="europe-west1"
REPO="healthcare-backend-repo"
IMAGE="healthcare-backend-fastapi"
SERVICE="crewai-backend-api"
INPUT_TEXT="I feel exhausted and foggy all day."

echo "🚀 Submitting build to Google Cloud Build..."
gcloud builds submit \
  --project="$PROJECT_ID" \
  --config=cloudbuild.yaml \
  --substitutions=_REGION="$REGION",_REPO="$REPO",_IMAGE="$IMAGE",_SERVICE="$SERVICE"

if [ $? -ne 0 ]; then
  echo "❌ Build failed. Exiting."
  exit 1
fi

echo "⏳ Waiting for Cloud Run service URL..."
SERVICE_URL=$(gcloud run services describe "$SERVICE" \
  --project="$PROJECT_ID" \
  --region="$REGION" \
  --platform=managed \
  --format="value(status.url)")

if [ -z "$SERVICE_URL" ]; then
  echo "❌ Failed to get Cloud Run URL. Exiting."
  exit 1
fi

echo "✅ Service deployed at: $SERVICE_URL"

echo "📡 Sending test request to /interact..."
curl -X POST "$SERVICE_URL/interact" \
  -H "Content-Type: application/json" \
  -d "{\"input\": \"$INPUT_TEXT\"}"

echo -e "\n✅ Test completed."

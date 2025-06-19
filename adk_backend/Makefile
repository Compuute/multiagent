# === Makefile for GCP Deploy ===

PROJECT_ID=hacker2025-team-10-dev
REGION=europe-west1
REPO=healthcare-backend-repo
IMAGE=healthcare-backend-fastapi
SERVICE=crewai-backend-api

deploy:
	@echo "🚀 Deploying to GCP..."
	gcloud builds submit \
	  --project=$(PROJECT_ID) \
	  --config=cloudbuild.yaml \
	  --substitutions=_REGION=$(REGION),_REPO=$(REPO),_IMAGE=$(IMAGE),_SERVICE=$(SERVICE)

test:
	@echo "📡 Testing Cloud Run endpoint..."
	@SERVICE_URL=$$(gcloud run services describe $(SERVICE) \
	  --project=$(PROJECT_ID) \
	  --region=$(REGION) \
	  --platform=managed \
	  --format="value(status.url)") && \
	curl -X POST $$SERVICE_URL/interact \
	  -H "Content-Type: application/json" \
	  -d '{"input": "I feel exhausted and foggy all day."}' || echo "❌ Failed"

all: deploy test

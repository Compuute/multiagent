# Terraform configuration for GCP

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "google" {
  project = var.project_id
  region  = "europe-west1"
}

provider "google-beta" {
  project = var.project_id
  region  = "europe-west1"
}



module "enabled_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  project_id = var.project_id
  activate_apis = [
    "aiplatform.googleapis.com",
    "cloudfunctions.googleapis.com",
    #"run.googleapis.com", # Disabled temporarily - requires billing
    "firestore.googleapis.com",
    #"secretmanager.googleapis.com",
    "logging.googleapis.com"
  ]
}

resource "google_service_account" "multiagent_sa" {
  account_id   = "multiagenthealthcare-service"
  display_name = "MultiAgentHealthcare Service Account"
}

resource "google_service_account_key" "multiagent_key" {
  service_account_id = google_service_account.multiagent_sa.name
  keepers = {
    last_rotation = timestamp()
  }
  private_key_type = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

resource "google_project_iam_member" "multiagent_ai" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.multiagent_sa.email}"
}

resource "google_project_iam_member" "multiagent_firestore" {
  project = var.project_id
  role    = "roles/datastore.user"
  member  = "serviceAccount:${google_service_account.multiagent_sa.email}"
}

resource "google_project_iam_member" "multiagent_storage" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.multiagent_sa.email}"
}

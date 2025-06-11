# Terraform variables

variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  default     = "europe-west1"
}

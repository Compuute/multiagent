# outputs.tf

output "service_account_email" {
  description = "Email address of the created service account"
  value       = google_service_account.multiagent_sa.email
}

output "service_account_key_id" {
  description = "ID of the created service account key"
  value       = google_service_account_key.multiagent_key.id
}

output "aiplatform_iam_role" {
  description = "IAM role assigned for AI Platform"
  value       = google_project_iam_member.multiagent_ai.role
}

output "firestore_iam_role" {
  description = "IAM role assigned for Firestore access"
  value       = google_project_iam_member.multiagent_firestore.role
}

output "storage_iam_role" {
  description = "IAM role assigned for Cloud Storage"
  value       = google_project_iam_member.multiagent_storage.role
}

output "project_id" {
  description = "The Google Cloud project ID"
  value       = var.project_id
}

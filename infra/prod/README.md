# Terraform `outputs.tf` Guide

## Purpose of `outputs.tf`

The `outputs.tf` file in a Terraform configuration is used to declare output values that Terraform should display after applying your infrastructure plan. These outputs can be useful for:

- Debugging
- Sharing important values between modules
- Passing data into CI/CD pipelines (e.g., service account emails, resource URLs)

---

## Example `outputs.tf`

````hcl
output "service_account_email" {
  description = "The email of the service account used in this environment"
  value       = google_service_account.multiagent_sa.email
}

# 📘 Using Terraform Outputs in DevOps Pipelines

## 🚀 Outputs Available from `outputs.tf`

| Output name              | Description                                                 |
|--------------------------|-------------------------------------------------------------|
| `service_account_email`  | Used to authenticate workloads or deploy services           |
| `service_account_key_id` | Reference for managing or rotating the service account key  |
| `project_id`             | Passed to deployment scripts/tools                          |
| `multiagent_roles`       | IAM roles granted to service account                        |

---

## 🔧 Example: Using Outputs in a CI/CD Pipeline (GitHub Actions)

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2

      - name: Terraform Init & Apply
        run: |
          terraform init
          terraform apply -auto-approve -var-file=terraform.tfvars

      - name: Read Output - Service Account Email
        id: output
        run: |
          echo "sa_email=$(terraform output -raw service_account_email)" >> $GITHUB_ENV
        shell: bash

      - name: Use Output in Deployment
        run: |
          echo "Deploying as ${{ env.sa_email }}"
````

---

## 💻 Local Development Example

```bash
# Get service account email for testing
terraform output -raw service_account_email

# Get GCP project ID for CLI tools
PROJECT_ID=$(terraform output -raw project_id)
gcloud config set project $PROJECT_ID
```

---

## 💡 Tips

- Outputs are helpful for scripting and chaining environments (dev → prod).
- Use `terraform output -json` to parse outputs programmatically.
- Never expose the full content of `private_key` values unless encrypted.

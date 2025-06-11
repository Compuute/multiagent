# Infrastructure Overview

This repository manages the infrastructure for the Multiagent Healthcare AI project using Terraform. It follows an environment-based structure, currently supporting two main environments:

---

## 🌱 Environments

### `dev/`

- Purpose: Used for development and testing.
- Resources:

  - AI Platform API
  - Firestore
  - Logging
  - Cloud Functions
  - Service Account + IAM Roles

- Deployment:

  ```bash
  cd infra/dev
  terraform init
  terraform plan -var-file=terraform.tfvars
  terraform apply -var-file=terraform.tfvars
  ```

### `prod/`

- Purpose: Production-grade setup with restricted access and real configurations.
- Resources:

  - Same as `dev/`, but for production.

- Deployment:

  ```bash
  cd infra/prod
  terraform init
  terraform plan -var-file=terraform.tfvars
  terraform apply -var-file=terraform.tfvars
  ```

---

## 📁 Structure

```
infra/
├── dev/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars (gitignored)
├── prod/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars (gitignored)
└── README.md
```

---

## 🔐 Security & Git

- `.terraform/` directories are ignored via `.gitignore`
- `terraform.tfvars` should contain sensitive project-specific settings (like `project_id`) and **must not be committed**.

---

## 🧪 Notes

- Run `terraform init` before any plan/apply
- Outputs provide:

  - Service account email
  - IAM roles
  - Project ID
  - Key ID (for automation integration)

---

## 🚀 Next Steps

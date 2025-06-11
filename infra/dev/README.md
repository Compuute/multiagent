# MultiAgentHealthcare – Terraform Dev Setup (GCP)

## Purpose

Provisioning GCP resources for the development environment of the MultiAgentHealthcare project using Terraform.

This folder contains Terraform configuration files for the development environment.

## Usage

1. Authenticate to Google Cloud:
   
   gcloud auth application-default login

2. Confirm that you´re working in the correct GCP project:
    
      gcloud config list project
   
   You should see something like:

      project = quantum-transit-462609-d0

3. ## Structure

```
infra/dev/
├── main.tf
├── outputs.tf
├── variables.tf
```

## Resources

* **Service Account**: `multiagenthealthcare-service@quantum-transit-462609-d0.iam.gserviceaccount.com`
* **Roles**:

  * `roles/aiplatform.user`
  * `roles/datastore.user`
  * `roles/storage.admin`
* **Enabled APIs**:

  * `aiplatform.googleapis.com`
  * `cloudfunctions.googleapis.com`
  * `firestore.googleapis.com`
  * `logging.googleapis.com`
  * ~~`run.googleapis.com`~~ *(disabled due to missing billing)*
  * ~~`secretmanager.googleapis.com`~~ *(disabled due to missing billing)*

## Usage

```bash
cd infra/dev
terraform init
terraform plan
terraform apply
```

### Variables

Ensure you have the following set:

```hcl
# terraform.tfvars
project_id = "quantum-transit-462609-d0"
```

## Billing Note

The following services are commented out in `main.tf` due to billing not being enabled:

```hcl
# "run.googleapis.com",
# "secretmanager.googleapis.com",
```

To activate these, enable billing for your project in GCP Console, uncomment the services in `main.tf`, then run:

```bash
terraform apply
```

## Author

Daniel Abbay – 2025-06-11
Project: `quantum-transit-462609-d0`

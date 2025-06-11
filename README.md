Agentic AI system for healthcare PROs.

# 🧠 MultiAgent Healthcare Platform

Welcome to the MultiAgent Healthcare project!  
This is a GenAI-driven system designed for intelligent Patient-Reported Outcomes (PROs) management — leveraging AI agents, GCP services, and secure service accounts.

---

## 📁 Project Structure

```

multiagentHealthcare/
├── agents/                 # LLM-powered agents and logic
├── backend/                # Server logic (e.g. API, auth, orchestration)
├── data/                   # Synthetic or processed PRO data
├── docs/                   # Documentation and pitch material
├── env.template            # Example env file for setup (copy to .env)
├── frontend/               # User-facing application (e.g. portal or dashboard)
├── infra/                  # Terraform-based infrastructure
│   ├── dev/                # Development environment
│   └── prod/               # Production environment
├── setup.sh                # Unified setup script for all platforms
└── README.md               # This file

```

---

## ⚙️ Setup (for all team members)

### 1. Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/)
- [Python 3.9+](https://www.python.org/)
- [Terraform](https://developer.hashicorp.com/terraform/install)
- [GCP CLI (gcloud)](https://cloud.google.com/sdk/docs/install)
- [Git](https://git-scm.com/)
- Bash (e.g. Git Bash for Windows)

---

### 2. Clone the repository

```bash
git clone https://github.com/Compuute/multiagent.git
cd multiagentHealthcare
```

---

### 3. Run the setup script

```bash
bash setup.sh
```

This will:

✅ Create your local `.env` file from `env.template`
✅ Initialize Terraform in both `infra/dev` and `infra/prod`
✅ Remind you to set your API keys and project ID

---

## 🔐 Environment Variables

Update your `.env` file with actual secrets:

```env
OPENAI_API_KEY=your-openai-api-key
GOOGLE_PROJECT_ID=your-gcp-project-id
```

Do **not** commit `.env` files to Git.

---

## 🚀 Deployment

Terraform is used to provision cloud resources.

### Development environment:

```bash
cd infra/dev
terraform init
terraform apply
```

### Production environment:

```bash
cd infra/prod
terraform init
terraform apply
```

---

## 🤝 Contributing

- Feature branches: `feature/<your-branch-name>`
- Use clear commit messages
- Keep Terraform state out of version control (`.terraform` is ignored)

---

## 🧪 Testing & Debugging

More info coming soon — unit tests, integration tests and simulated patient input.

---

## 📌 Roadmap

- [x] Setup Terraform and Service Accounts
- [x] Secure API access (OpenAI / GCP)
- [ ] Build agent orchestration
- [ ] Frontend UI for patient and clinician
- [ ] Real-time analytics & alerting

---

## 📣 Contact

Project lead: **@capgemini.com**
Hackathon: **Google Agentic AI Hackathon 2025**

```

```

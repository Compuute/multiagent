# 🧠 MultiAgent Healthcare Platform

This is a GenAI-driven system designed for intelligent Patient-Reported Outcomes (PROs) management — leveraging AI agents, Google Cloud Platform (GCP), and secure service accounts.

---

## 📂 Overview

We are building a multi-agent system that:

- Uses Google ADK (Agentic Development Kit) to orchestrate agents
- Supports **Human-in-the-loop (HITL)** for safety-critical decisions
- Adapts and personalizes patient questionnaires
- Monitors health trends and alerts clinicians

### 🧠 Agents Involved:

1. **Companion Agent** – Engages with the patient, builds trust
2. **Adaptive Questionnaire Agent** – Selects and tailors questions
3. **Trend Monitoring Agent** – Detects risks and informs clinicians
4. _(Optional)_ **Test Agent** for simulated flows and validation

---

## 🖼️ Architecture

![Architecture Diagram](docs/assets/system-architecture.png)

The system includes:

- **Frontend**: Dashboard for patients & clinicians (React)
- **Backend**: Python + FastAPI (or Flask) for orchestrating agents
- **GCP Infra**: Firestore, Cloud Run, Vertex AI, Secret Manager, Cloud Storage
- **AI Models**: OpenAI + Vertex AI models via secure APIs
- **MCP/Observability**: Integrated tracing for model context and agent actions
- **ADK Agents**: Deployed and managed via ADK runtime in Cloud Run
- **HITL Middleware**: Embedded in backend for approval flow and manual overrides

More in `docs/architecture.md`

---

## 📁 Project Structure

```
multiagentHealthcare/
├── agents/                 # LLM-powered agents and logic
│   ├── companion_agent/
│   ├── adaptive_agent/
│   ├── trend_monitor_agent/
│   └── test_agent/
├── backend/                # Server logic (e.g. API, auth, orchestration)
│   ├── orchestrator.py
│   ├── hitl_middleware.py
│   └── app.py
├── data/                   # Synthetic or processed PRO data
├── docs/                   # Documentation and pitch material
│   ├── assets/             # Diagrams and supporting images
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

### 2. Clone the repository

```bash
git clone https://github.com/Compuute/multiagent.git
cd multiagentHealthcare
```

### 3. Run the setup script

```bash
bash setup.sh
```

This will:
✅ Create your local `.env` file from `env.template`
✅ Initialize Terraform in both `infra/dev` and `infra/prod`
✅ Install dependencies & environment prep
✅ Remind you to set your secrets

---

## 🔐 Environment Variables

Update your `.env` file with actual secrets:

```env
OPENAI_API_KEY=your-openai-api-key
GOOGLE_PROJECT_ID=your-gcp-project-id
GOOGLE_APPLICATION_CREDENTIALS=path-to-service-account.json
```

> ⚠️ Do **not** commit `.env` or service account files to Git

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

## 🤖 Agents & Orchestration

Agents are defined under `/agents` using Google ADK.
Orchestration logic and HITL flows are implemented in `/backend`.

See: [docs/architecture.md](docs/architecture.md) for full diagrams and flowcharts.

---

## 🧪 Testing & Debugging

Coming soon:

- Unit tests per agent and backend endpoint
- Simulated patient inputs for end-to-end tests
- MCP tracing to visualize agent context and actions

---

## 📌 Roadmap (MVP Focus)

- [x] Terraform infra for dev/prod
- [x] Service accounts and API access
- [x] Agent scaffolding + ADK integration
- [x] HITL design and mock logic
- [ ] End-to-end test flows with synthetic patients
- [ ] Frontend dashboard UI
- [ ] Observability & MCP integration

---

## 📣 Contact

Lead: **@capgemini.com**
Hackathon: **Google Agentic AI Hackathon 2025**

> 👩‍💻 Contributors: 6-team members, roles divided across agents, frontend, backend, infra

---

## 📝 Additional Docs

See `docs/architecture.md`, `docs/assets/*` and GitHub Pages for visual diagrams and team onboarding instructions.

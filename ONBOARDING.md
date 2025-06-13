# 👥 Developer Onboarding Instructions

Welcome to the `multiagent` project! This guide will help you get set up and ready to contribute to our hackathon-winning Agentic AI solution.

---

## 🔗 Repository Access

**Repository URL:**

```
https://github.com/Compuute/multiagent
```

### 📌 Access Permissions

* If this is a **public repo**, simply clone it.
* If this is a **private repo**, ensure you’ve been added as a collaborator:

  1. Go to GitHub → Repository Settings → "Collaborators & Teams"
  2. Accept the invitation sent to your GitHub account

---

## 🖥️ Local Setup

### 1. Clone the Repo

```bash
git clone https://github.com/Compuute/multiagent.git
cd multiagent
```

### 2. Run the Setup Script

```bash
bash setup.sh
```

This will:

* Create a `.env` file from `env.template`
* Initialize Terraform in `infra/dev` and `infra/prod`
* Install Python dependencies in a virtual environment (if included)

### 3. Add Environment Secrets

Update the generated `.env` file with your credentials:

```
OPENAI_API_KEY=your_openai_key
GOOGLE_PROJECT_ID=your_gcp_project
GOOGLE_APPLICATION_CREDENTIALS=path/to/service-account.json
```

---

## 🛠️ Project Structure

```
multiagent/
├── agents/              # AI agents and orchestrators
├── backend/             # Backend services (API, logic)
├── frontend/            # Frontend app (if applicable)
├── infra/               # Terraform infrastructure for GCP
├── docs/                # Documentation, diagrams
├── setup.sh             # Automated onboarding script
├── env.template         # Environment variable template
├── requirements.txt     # Python dependencies
├── README.md            # Project overview and architecture
```

---

## ✅ Best Practices

* Follow `feature/<feature-name>` branch naming convention
* Create a pull request and request review before merging
* Use conventional commits (`feat:`, `fix:`, `docs:` etc.)
* Keep `.env` private (never commit secrets)

---

## 📌 Need Help?

If you encounter issues:

* Check the README for troubleshooting
* 
Happy hacking! 💻🚀

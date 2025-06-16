## 🔍 Explanation of Architecture Diagrams for MVP: Multi-Agent PRO Monitoring Platform

These diagrams serve as the visual foundation for our Agentic AI solution designed to capture and analyze Patient-Reported Outcomes (PROs) for chronically ill patients. Built on top of Google Cloud and ADK (Agentic Development Kit), the system integrates Human-in-the-Loop (HITL) support, secure data handling, and real-time monitoring.

---

### 1. 🌐 High-Level Architecture (HLD)

**Purpose:** Provides a conceptual overview of the full platform, how data flows, and which core services interact.

**Key Components:**

* **Frontend Application**: Interface where patients submit symptom updates and where HITL reviewers validate edge-case responses.
* **Agents (via ADK)**:

  * *Companion Agent*: Guides the user.
  * *Adaptive Questionnaire Agent*: Adjusts questions based on responses.
  * *Trend Monitoring Agent*: Flags anomalies and triggers alerts.
* **GCP Services**:

  * *Vertex AI Agent Builder (ADK)*: Hosts and coordinates agents.
  * *Cloud Functions*: Used for orchestration logic.
  * *Firestore DB*: Stores patient data, agent interactions, flags.
  * *Cloud Pub/Sub*: Passes flagged events to HITL review queue.
  * *Cloud Storage*: Optional storage for raw logs and snapshots.
  * *Arize AI*: Tracks agent trace and integrates Model Context Protocol (MCP).
* **Human-in-the-Loop (HITL)**: Enabled via UI dashboard and Pub/Sub.

**Flow Summary:**
Patient submits data ➝ Companion Agent responds ➝ Questionnaire adjusts ➝ Monitoring detects patterns ➝ HITL reviews if flagged ➝ Alert or feedback generated ➝ Data stored and traced.

---

### 2. 🔧 Low-Level Design (LLD)

**Purpose:** Breaks down how each service is implemented and how responsibilities are split among team members.

**Includes:**

* *Agent Definitions*: Written in YAML/JSON via ADK
* *Service Accounts*: Used for identity and auth
* *.env file*: Managed via `env.template`, used for GCP keys
* *Terraform Infrastructure*: Sets up environments (dev/prod)
* *setup.sh*: Bootstrap script for local dev setup

**Agent Logic Pathing:**

* Each agent is modular, and communication is handled via events and shared Firestore entries.
* HITL loop is triggered when an alert is published to a `review-queue` topic.

---

### 3. 🤝 HITL and Agents Coordination

In the visual diagram:

* Arrows marked "HITL" show the feedback loop triggered via Pub/Sub when agents detect anomalies.
* HITL reviewers can approve/override and feed corrections back into the system.
* These corrections become future training data.

---

### 📌 Summary:

* These diagrams should be referenced during onboarding.
* Store under `docs/assets/` and link from GitHub Pages.
* Any team member can understand their scope of work by referring to these visuals and this explanation.

Make sure `.nojekyll` exists under `/docs/` to render images correctly on GitHub Pages.

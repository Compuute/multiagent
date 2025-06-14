# Multi-Agent MVP - System Architecture

Documentation page for Maba-Nessa Agentic MVP built for the hackathon.

## 🔷 High-Level Architecture

![HLD](architecture/MVP_HLD.png)

The system includes:
- A Companion Agent (User-facing)
- Adaptive Questionnaire Agent
- Trend Monitoring Agent
- GCP services like Firestore, Cloud Functions, Vertex AI, Pub/Sub

## 🔷 Low-Level Design

![LLD](architecture/MVP_LLD.png)

Details:
- Firestore for state
- Pub/Sub for events
- GCF & Cloud Run for orchestration
- Vertex AI for LLMs
- Cloud Logging for tracing & HITL

## 🧠 Agent Workflow (editable)

See the diagram: `Agent_Workflow.drawio`

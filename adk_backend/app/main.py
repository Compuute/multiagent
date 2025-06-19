from fastapi import FastAPI, Request
from pydantic import BaseModel
from crew.crew_definition import crew
from dotenv import load_dotenv
import os

# === 🌍 Load environment variables ===
load_dotenv()  # Looks for a .env file in the root of the project

# === 🚀 Initialize FastAPI app ===
app = FastAPI(title="ADK Agent Crew API")

# === 📦 Input schema for POST requests ===
class InputRequest(BaseModel):
    input: str  # User input to be processed by the agent crew

# === ✅ Health check endpoint ===
@app.get("/")
def root():
    return {"message": "ADK Agent Crew API is running."}

# === 🤖 Main agent crew execution endpoint ===
@app.post("/interact")
async def interact(request: InputRequest):
    """
    Receives user input and triggers the multi-agent ADK crew workflow.
    Returns the aggregated result from all tasks.
    """
    try:
        result = crew.kickoff(inputs={"input": request.input})
        return {"result": result}
    except Exception as e:
        return {"error": str(e)}

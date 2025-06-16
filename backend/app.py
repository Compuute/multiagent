# backend/app.py

from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from agents.companion_agent import agent  # Importera agentlogiken

app = FastAPI()


@app.post("/companion")
async def handle_companion_interaction(request: Request):
    """
    Route that handles interaction from frontend to Companion Agent.

    Expects JSON payload with {"user_input": "<patient message>"}
    """
    data = await request.json()
    user_input = data.get("user_input", "")

    response = agent.handle_interaction(user_input)
    return JSONResponse({"response": response})

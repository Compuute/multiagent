# backend/orchestrator.py

"""
Handles the logic for orchestrating interactions with AI agents.
This file exposes API routes to communicate with frontend or Google ADK agents.
"""

from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

# Import the companion agent logic
from agents.companion_agent.agent import handle_interaction

router = APIRouter()

class MessageInput(BaseModel):
    message: str


@router.post("/companion/respond")
def companion_respond(payload: MessageInput):
    """
    Handles interaction with the Companion Agent.

    Accepts patient input, runs it through the agent, and returns a response.
    This endpoint is used by the frontend or other services to talk to the Companion Agent.

    Input: {"message": "I feel tired today"}
    Output: {"response": "Thanks for sharing. You said: 'I feel tired today' — got it!"}
    """
    try:
        reply = handle_interaction(payload.message)
        return {"response": reply}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

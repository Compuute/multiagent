from google.adk import Agent
from . import prompt

adaptive_questionnaire = Agent(
    model="gemini-2.0-flash",
    name="adaptive_agent",
    instruction=prompt.ADAPTIVE_AGENT_PROMPT,
)
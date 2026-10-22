
from datetime import datetime, timezone
from fastapi import FastAPI

app = FastAPI(
    title="CloudForge API",
    version="1.0.0",
    description="Demo application for Azure DevSecOps"
)


@app.get("/")
def root():
    return {
        "application": "CloudForge",
        "version": "1.0.0",
        "message": "Welcome to CloudForge!"
    }


@app.get("/health")
def health():
    return {
        "status": "healthy",
        "timestamp": datetime.now(
            timezone.utc
        ).isoformat()
    }


@app.get("/ready")
def readiness():
    return {"status": "ready"}

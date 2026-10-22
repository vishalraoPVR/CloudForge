
FROM python:3.12-slim

WORKDIR /app

# Prevent Python from writing bytecode
ENV PYTHONDONTWRITEBYTECODE=1

# Enable immediate log output
ENV PYTHONUNBUFFERED=1

# Install application dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir \
    -r requirements.txt

# Copy application source
COPY app/ ./app/

# Run as a non-root user
RUN useradd --create-home appuser

USER appuser

EXPOSE 8000

# Start FastAPI application
CMD ["uvicorn", "app.main:app", \
     "--host", "0.0.0.0", \
     "--port", "8000"]

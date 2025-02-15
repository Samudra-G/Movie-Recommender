# Base Python image
FROM python:3.11.9

# Set working directory inside the container
WORKDIR /backend

# Copy dependency file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy FastAPI backend
COPY . .

# Expose FastAPI port
EXPOSE 8000

# Start FastAPI in development mode
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
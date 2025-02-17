# Base Python image (slim version)
FROM python:3.11.9-slim

# Set working directory inside the container
WORKDIR /movie-recommender

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libopencv-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirement file (without torch and scikit-learn)
COPY requirements.txt /movie-recommender/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy .env and backend code
COPY . /movie-recommender/

# Expose FastAPI port
EXPOSE 8000

# Start FastAPI in development mode
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
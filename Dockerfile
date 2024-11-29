# Stage 1: Build
FROM python:3.9-slim AS builder

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application source code
COPY . .

# Stage 2: Final Image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy application files from the builder stage
COPY --from=builder /app /app

# Expose the application port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]

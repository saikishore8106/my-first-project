# Use an official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files
COPY app/ .

# Install dependencies
RUN pip install -r requirements.txt

# Default command
CMD ["python", "main.py"]

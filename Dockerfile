FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Install system packages if needed (e.g., for psycopg2 or other deps)
RUN apt-get update && apt-get install -y gcc libpq-dev

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port
EXPOSE 8000

# Run server (you can run `migrate` in entrypoint or manually via docker-compose)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

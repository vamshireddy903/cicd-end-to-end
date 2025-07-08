FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Install Django directly
RUN pip install django==3.2

# Copy your Django project code
COPY . .

# Expose the default Django port
EXPOSE 8000

# Run the server (migrations should be done at runtime or manually)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

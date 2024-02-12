FROM python:3.8-slim

# Copy the entrypoint script into the Docker container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint command
ENTRYPOINT ["/entrypoint.sh"]

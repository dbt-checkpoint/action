FROM python:3.8-slim

# Copy the entrypoint script into the Docker container
COPY entrypoint.sh /github/workspace/entrypoint.sh
RUN chmod +x /github/workspace/entrypoint.sh

# Set the entrypoint command
ENTRYPOINT ["/github/workspace/entrypoint.sh"]

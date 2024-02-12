FROM python:3.8-slim
WORKDIR /github/workspace
# Copy the entrypoint script into the Docker container

RUN apt-get update &&\
    apt-get upgrade -y && \
    apt-get install -y git && 

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh
# Set the entrypoint command
ENTRYPOINT ["./entrypoint.sh"]

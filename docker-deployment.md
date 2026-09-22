# Docker Deployment Log

## Checkpoint 3: Verify Docker Installation
- `docker --version` — Checks that Docker is installed and shows the installed version.
- `docker info` — Displays detailed information about the current Docker environment, including running containers and system resources.

## Checkpoint 4: Deploy Nginx Container
- `docker pull nginx` — Downloads the official Nginx image from Docker Hub.
- `docker run -d -p 8080:80 --name my-nginx nginx` — Runs the Nginx image as a container in the background (detached mode), mapping port 8080 on the host to port 80 inside the container.
- `curl http://localhost:8080` — Sends an HTTP request to the container to confirm the Nginx web server is running and responding.

## Checkpoint 5: Container Lifecycle
- `docker ps` — Lists all currently running containers.
- `docker stop my-nginx` — Gracefully stops the running Nginx container.
- `docker ps -a` — Shows all containers, including stopped ones, to confirm the container was stopped.
- `docker rm my-nginx` — Permanently removes the stopped container from the system.

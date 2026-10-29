# Laboratory 7: Cloud Operations Engineer

## Mission Overview

In this laboratory activity, I took the role of a Cloud Operations Engineer (Site Reliability Engineer) at CloudNova Technologies. A client was preparing a large marketing campaign and worried that the servers would run out of memory under heavy traffic. My task was to run a baseline health check on the host server, deploy the client's Nginx web server in a Docker container, generate test traffic, and use logs and real-time metrics to show the infrastructure was healthy. The lab was done in a Killercoda Ubuntu Playground.

## Objectives

- Use native Linux command-line tools to monitor host CPU, memory, and disk capacity.
- Deploy a web container and track its real-time performance using Docker metrics.
- Generate web traffic and extract application access logs for analysis.
- Translate raw performance data into a readable technical report using Markdown.
- Continue expanding a professional GitHub Cloud Computing Portfolio.

## Monitoring Commands Executed

| Command | Purpose |
|---|---|
| `free -h` | Shows total, used, and free RAM in human-readable units |
| `df -h` | Shows disk capacity and usage for each mounted file system |
| `top` | Displays live processes, CPU load, and memory usage |
| `docker run -d --name client-website -p 8080:80 nginx` | Starts an Nginx container in the background, named `client-website`, mapping host port 8080 to container port 80 |
| `curl http://localhost:8080` | Simulates a user visiting the website (HTTP 200) |
| `curl http://localhost:8080/hidden-admin-page` | Requests a nonexistent page to trigger an HTTP 404 error |
| `docker logs client-website` | Retrieves the container's application logs, including 200 and 404 requests |
| `docker stats` | Shows live CPU, memory, and network I/O for running containers |

## Skills Learned

- Establishing a host performance baseline with Linux CLI tools
- Deploying and port-mapping a containerized web server with Docker
- Simulating user traffic and intentionally generating HTTP errors with `curl`
- Reading application logs to identify HTTP status codes (200 vs. 404)
- Interpreting real-time container metrics (CPU, memory, network I/O)
- Documenting technical findings in Markdown and organizing a GitHub portfolio

## Repository Contents

- `system-baseline-report.md`: host RAM, disk, and CPU baseline
- `container-observability.md`: logs and container metrics
- `reflection.md`: mission reflection
- `screenshots/`: evidence for each checkpoint

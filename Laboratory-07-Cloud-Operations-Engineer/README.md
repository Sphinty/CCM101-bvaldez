# Laboratory 7: Cloud Operations Engineer

## Mission Overview

Congratulations! Your ability to deploy multi-tier architectures has proven your technical capabilities.
You have now been promoted to the Cloud Operations Team (often referred to in the industry as Site Reliability
Engineering, or SRE) at CloudNova Technologies.
Deploying a cloud application is only the first step; keeping it running smoothly is the real challenge.
When a server crashes or a web page takes ten seconds to load, you cannot simply guess what is wrong. You
must rely on Observability and Monitoring to see inside your infrastructure.
Using the KillerCoda Playground, you will step into the role of a Cloud Operations Engineer. You will
establish a performance baseline for your Linux server, deploy a containerized application, generate artificial web
traffic, and hunt down performance metrics and system logs to prove the application is healthy.
Remember: A developer hopes the application works; a Site Reliability Engineer uses metrics and logs to
prove it.


## Objectives

At the end of this laboratory activity, you should be able to:
- Utilize native Linux command-line tools to monitor host CPU, Memory, and Disk capacity.
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

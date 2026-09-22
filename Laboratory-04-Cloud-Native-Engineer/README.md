# Laboratory 04: Cloud-Native Engineer

## Mission Overview
This lab covers the shift from traditional Virtual Machines to containerization.
As part of the Cloud-Native Engineering Team at CloudNova Technologies, I researched
the differences between VMs and containers, deployed a live Nginx container using
Docker on the KillerCoda Playground, and documented the full container lifecycle —
from pulling the image to removing the container.

## Objectives
- Differentiate between traditional Virtual Machines (VMs) and Containers
- Access a Docker-enabled cloud environment using KillerCoda
- Execute fundamental Docker CLI commands
- Pull, run, manage, and terminate a containerized application (Nginx)
- Document container operations in Markdown
- Continue building a well-organized GitHub Cloud Computing Portfolio

## Docker Commands Executed
- `docker --version`
- `docker info`
- `docker pull nginx`
- `docker run -d -p 8080:80 --name my-nginx nginx`
- `curl http://localhost:8080`
- `docker ps`
- `docker stop my-nginx`
- `docker ps -a`
- `docker rm my-nginx`

## Skills Learned
- Verifying a Docker installation and checking system status
- Pulling images from Docker Hub
- Running containers in detached mode with port mapping
- Managing the full container lifecycle (list, stop, verify, remove)
- Writing clear technical documentation in Markdown

## Challenges Encountered
Getting comfortable with port mapping (`-p 8080:80`) took a bit of trial and error at
first, since I had to understand that the host port and container port don't need to
match. I also had to be careful to use `docker ps -a` instead of `docker ps` to confirm
a container was stopped, since stopped containers don't show up in the default `docker ps` list.

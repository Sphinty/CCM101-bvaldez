# Laboratory 04: Cloud-Native Engineer

## Mission Overview
Congratulations! After successfully guiding our clients through multi-cloud evaluations, you have been
promoted to the Cloud-Native Engineering Team at CloudNova Technologies.
Modern cloud computing is no longer just about renting Virtual Machines (VMs) from AWS or Azure. Today's
enterprise applications are built using lightweight, portable, and lightning-fast technologies called Containers.
Your new mission is to understand the shift from traditional virtualization to containerization.
Using the KillerCoda Playground, you will step into the shoes of a Cloud-Native Engineer. You will research the
differences between VMs and containers, execute your very first Docker commands, and deploy a live,
containerized web server in seconds.

## Objectives
At the end of this laboratory activity, you should be able to:
- Differentiate between traditional Virtual Machines (VMs) and Containers.
- Access a Docker-enabled cloud environment using KillerCoda.
- Execute fundamental Docker CLI (Command Line Interface) commands.
- Pull, run, manage, and terminate a containerized application (Nginx).
- Create professional technical documentation of container operations using Markdown.
- Continue developing a well-organized GitHub Cloud Computing Portfolio. 

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

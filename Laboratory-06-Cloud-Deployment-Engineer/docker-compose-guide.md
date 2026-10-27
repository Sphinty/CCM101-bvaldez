# Docker Compose Guide

This guide documents the `docker-compose.yml` file used to deploy a private Nextcloud cloud storage system backed by a MariaDB database, so another engineer can understand and reproduce it.

## The Code

```yaml
version: '3'

services:
  database:
    image: mariadb:10.6
    environment:
      - MYSQL_ROOT_PASSWORD=cloudnova_root
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user

  app:
    image: nextcloud
    ports:
      - 8080:80
    environment:
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user
      - MYSQL_HOST=database
```

## Line-by-Line Overview

| Key | Purpose |
|-----|---------|
| `version: '3'` | Declares the Compose file format version (newer Docker versions ignore it). |
| `services:` | Lists every container that makes up the application. |
| `database:` | Service name for the MariaDB container. This name also becomes its hostname. |
| `image: mariadb:10.6` | Pulls MariaDB version 10.6. |
| `app:` | Service name for the Nextcloud container. |
| `image: nextcloud` | Pulls the official Nextcloud image. |
| `ports: - 8080:80` | Maps port 8080 on the host to port 80 inside the container. |
| `environment:` | Passes configuration values (database name, user, password) into the container. |

## What does the `services:` block do?

The `services:` block is where the whole stack is defined. Each entry under it (`database` and `app`) describes one container: which image to use, which ports to publish, and which environment variables to set. When `docker-compose up` runs, Compose reads this block and creates, networks, and starts every service together. Adding another tier later (for example, a cache) only requires adding another entry under `services:`.

## How did the Nextcloud app container find the database container?

Through the `MYSQL_HOST=database` environment variable. Compose automatically places all services in the same file on a shared network and registers each service name as a DNS hostname on that network. Because the MariaDB service is named `database`, the Nextcloud container can reach it simply by using `database` as the host. No IP address is needed. The other variables (`MYSQL_DATABASE`, `MYSQL_USER`, `MYSQL_PASSWORD`) must match the values set on the database service so Nextcloud can log in.

## What is the difference between `docker run` and `docker-compose up -d`?

| | `docker run` (Mission 4) | `docker-compose up -d` |
|---|---|---|
| Scope | Starts one container per command | Starts the whole multi-container stack |
| Configuration | Long flags typed each time (`-p`, `-e`, `--name`, `--network`) | Stored in a YAML file |
| Networking | Must be created and attached manually | Created automatically between services |
| Repeatability | Easy to mistype or forget flags | Same file gives the same result every time |
| Version control | Commands live in shell history | The file can be committed to Git (Infrastructure as Code) |

The `-d` flag means "detached": the containers run in the background so the terminal stays free.

## Deployment Evidence

### Deployment and running containers

![Compose deployment](screenshots/compose-deployment.png)

### Nextcloud setup page on port 8080

![Nextcloud web setup page](screenshots/nextcloud-web.png)

### Teardown

![Compose teardown](screenshots/compose-teardown.png)

## Note on Credentials

The passwords in this file are placeholders for a proof of concept. In production, secrets should be kept outside the Compose file (for example, in a `.env` file excluded from Git, or Docker secrets).

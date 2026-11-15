# Mission 10: The Enterprise Cloud Architect

**Course:** CCM101 – Cloud Computing, College of Information Technology, University of Eastern Pangasinan
**Client:** CloudNova Technologies (Fortune 500 client contract)
**Role:** Enterprise Cloud Architect

## Executive Summary
This folder contains the production-grade private cloud environment engineered for CloudNova Technologies' Fortune 500 client contract. The architecture is multi-tier, secure, automated, and resilient, and it is deployed on a headless Ubuntu Server virtual machine.

The solution combines three layers of control:

* **Infrastructure as Code:** the full application stack is described in Docker Compose, so it can be rebuilt on a fresh server with a single command.
* **Perimeter defense:** the Uncomplicated Firewall (UFW) enforces a Default Deny ingress policy, with only SSH and the web port explicitly allowed.
* **Autonomous disaster recovery:** a custom Bash script, scheduled through Cron, backs up the database every day with no human involvement.

## Deliverables Index
| # | Deliverable | Description |
|---|-------------|-------------|
| 1 | [architecture-diagram.png](architecture-diagram.png) | Network topology showing the physical host, hypervisor, Linux VM, firewall layer, and Docker container network isolation. |
| 2 | [docker-compose.yml](docker-compose.yml) | Multi-tier orchestration file: WordPress web tier and MySQL data tier with persistent volume mounts. |
| 3 | [automation-script.sh](automation-script.sh) | Executable Bash disaster recovery (database backup) script. |
| 4 | [operational-manual.md](operational-manual.md) | Technical handover manual and runbook for the client IT team: deploy, secure, maintain, and recover. |
| 5 | [final-reflection.md](final-reflection.md) | Retrospective on the technical journey from Mission 1 through Mission 10. |

## Infrastructure Specifications
| Component | Specification |
|-----------|---------------|
| Hypervisor | Type 2 Hypervisor (Oracle VirtualBox) |
| Operating System | Ubuntu Server (headless) |
| Virtual Networking | Bridged Adapter (VM reachable from the host browser) |
| Application Runtime | Docker Engine and Docker Compose |
| Web Tier | WordPress on Apache, port 80 |
| Data Tier | MySQL 8.0, internal port 3306 (isolated, not published) |
| Storage Persistence | Named Docker volumes `wp_data` and `db_data` |
| Host Security | UFW, Default Deny; ports 22 (SSH) and 80 (HTTP) explicitly allowed |
| Automation | Cron daemon running the backup script daily at 02:00 AM |

## Requirements Compliance
| Requirement | How it is met | Evidence |
|-------------|---------------|----------|
| 1. Base infrastructure and architecture design | Ubuntu Server VM on VirtualBox with a Bridged Adapter; architecture diagram covers host, hypervisor, VM, firewall, and containers. | `architecture-diagram.png` |
| 2. Infrastructure integration (deployment) | Two linked containers (WordPress and MySQL) defined as code; database data lives on a persistent named volume and survives a VM reboot. | `docker-compose.yml` |
| 3. Security configurations (hardening) | UFW enabled with Default Deny incoming; only ports 22 and 80 are allowed; the database port is never published. | Operational manual, section 6 |
| 4. Automation scripts (disaster recovery) | Executable Bash backup script scheduled with a Cron job at 02:00 AM daily. | `automation-script.sh`, operational manual, section 7 |
| 5. Technical documentation | Operational manual, raw code, and final reflection are all committed to this folder. | `operational-manual.md`, `final-reflection.md` |

## Quick Start
Full instructions are in the [operational manual](operational-manual.md). In short:

```bash
# On the Ubuntu Server VM, from the folder holding docker-compose.yml
docker compose up -d      # deploy the stack
docker compose ps         # confirm both containers are running
hostname -I | awk '{print $1}'   # find the server IP, then browse to http://<SERVER-IP>
```

## Repository Structure
```
CCM101-bvaldez
├── README.md
├── Laboratory-01-Welcome-to-the-Cloud/
... [Previous Missions 2 through 9] ...
└── Laboratory-10-Enterprise-Cloud-Architect/
    ├── README.md
    ├── architecture-diagram.png
    ├── docker-compose.yml
    ├── automation-script.sh
    ├── operational-manual.md
    └── final-reflection.md
```

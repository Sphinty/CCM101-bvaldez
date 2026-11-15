# Enterprise Cloud Infrastructure: Client Operational Manual

**Prepared for:** CloudNova Technologies client IT team
**Scope:** How to deploy, secure, and maintain the multi-tier WordPress and MySQL private cloud stack.

## 1. System Architecture & Topology
| Layer | Component | Details |
|-------|-----------|---------|
| Physical host | Laptop or computer | Runs the Type 2 hypervisor |
| Hypervisor | Oracle VirtualBox | Hosts the Ubuntu Server VM, Bridged Adapter networking |
| Operating system | Ubuntu Server (headless) | Managed over SSH |
| Firewall | UFW | Default Deny incoming; ports 22 and 80 allowed |
| Presentation tier | `cloudnova-web` | WordPress on Apache, HTTP on port 80 |
| Database tier | `cloudnova-db` | MySQL 8.0 on the isolated Docker network `enterprise_backend`; port 3306 is **not** published externally |
| Storage persistence | Named volumes | `wp_data` (`/var/www/html`) and `db_data` (`/var/lib/mysql`) |

Traffic flow: browser → UFW (port 80) → `cloudnova-web` → `enterprise_backend` network → `cloudnova-db`. The database is reachable only by the web container. See `architecture-diagram.png` for the visual schematic.

## 2. Prerequisites
* A Type 2 hypervisor (Oracle VirtualBox) on the host machine
* Ubuntu Server ISO (latest)
* Internet access on the VM for package and image downloads
* The files `docker-compose.yml` and `automation-script.sh` from this repository

## 3. Deployment Procedure

### 3.1 Provision the virtual machine
1. Create a new VM in VirtualBox and attach the Ubuntu Server ISO.
2. Set the network adapter to **Bridged Adapter** so the VM receives an address on the same network as the host and can be reached from the host browser.
3. Install Ubuntu Server (headless) and enable **OpenSSH server** during setup.
4. Create the administrative user (`cloudadmin`) and reboot into the installed system.

### 3.2 Install Docker and Docker Compose
Install Docker Engine and the Compose plugin following the official Docker documentation for Ubuntu. Then verify and allow the admin user to run Docker:
```bash
docker --version
docker compose version
sudo usermod -aG docker cloudadmin   # log out and back in afterwards
```

### 3.3 Deploy the stack
```bash
mkdir -p ~/enterprise-stack && cd ~/enterprise-stack
# place docker-compose.yml and automation-script.sh in this folder
docker compose up -d
docker compose ps
```
Both `cloudnova-web` and `cloudnova-db` should show as running. Open the web portal (section 4) to complete the WordPress installation wizard on first launch.

## 4. Accessing the Application

To determine the active server IP address assigned via DHCP, run:
```bash
hostname -I | awk '{print $1}'
```

Access the services from the host browser using the discovered IP:
* **Web Portal (Public):** `http://<SERVER-IP>` (for example, `http://192.168.100.71`)
* **Administrative Dashboard:** `http://<SERVER-IP>/wp-admin`
* **Remote Administration (SSH):** `ssh cloudadmin@<SERVER-IP>`

## 5. Service Management
```bash
cd ~/enterprise-stack
docker compose up -d    # Start infrastructure
docker compose ps       # Check health
docker compose logs -f  # Stream logs
docker compose down     # Stop infrastructure (preserves volumes)
```
> **Warning:** never run `docker compose down -v`. The `-v` flag deletes the named volumes and permanently destroys the site files and database.

## 6. Perimeter Security (UFW)
The host enforces a **Default Deny** ingress policy and explicitly allows only what the application and administrators need.
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp comment 'Remote Administration SSH'
sudo ufw allow 80/tcp comment 'Cloud Application Web Port'
sudo ufw enable
```
Verify the rules at any time:
```bash
sudo ufw status verbose
```

**Defense in depth:**
* The database port 3306 is never published to the host, so it cannot be reached from the network even if a firewall rule were misconfigured. Only `cloudnova-web` can talk to `cloudnova-db`, through the isolated `enterprise_backend` network.
* Docker publishes container ports by editing iptables directly, which can bypass UFW rules. For this reason, only port 80 is published in `docker-compose.yml`. Do not add `ports:` entries for other services without a security review.
* Keep database credentials out of version control and never paste them into commands or documents. Rotate any credential that has been exposed.

## 7. Disaster Recovery & Backup Restoration

### 7.1 Automated backups
Backups run daily at 02:00 AM via cron. The script `automation-script.sh` must be executable (`chmod +x`) and writes compressed, timestamped database dumps (`cloudnova_db_backup_[TIMESTAMP].sql.gz`) to `/backups`.

Cron entry (view or edit with `crontab -e`):
```
0 2 * * * /home/cloudadmin/enterprise-stack/automation-script.sh > /dev/null 2>&1
```
Because output is discarded, confirm that backups are being produced by checking the folder regularly:
```bash
ls -lh /backups
```

### 7.2 Restoring a database backup
The restore command reads the root password from the database container's own environment, so no password is typed or stored in shell history:
```bash
gunzip < /backups/cloudnova_db_backup_[TIMESTAMP].sql.gz | docker exec -i cloudnova-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" wordpress_db'
```
Replace `[TIMESTAMP]` with the timestamp of the backup you want to restore, then confirm the site loads and content is intact.

## 8. Verification & Health Checks
Run these after deployment, after maintenance, and during any incident.

| Check | Command | Expected result |
|-------|---------|-----------------|
| Containers running | `docker compose ps` | `cloudnova-web` and `cloudnova-db` are up |
| Firewall active | `sudo ufw status verbose` | Status active, default deny (incoming), 22 and 80 allowed |
| Listening ports | `sudo ss -tlnp` | Port 80 and 22 listening; 3306 not exposed on the host |
| Backup present | `ls -lh /backups` | A recent `.sql.gz` file from the last 02:00 AM run |
| Cron scheduled | `crontab -l` | The 02:00 AM entry is listed |
| Persistence test | `sudo reboot`, then `docker compose ps` and reload the site | Stack returns and content is unchanged |

## 9. Troubleshooting
| Symptom | Likely cause | Action |
|---------|--------------|--------|
| Site unreachable from host browser | Wrong IP, VM not bridged, or port 80 blocked | Re-run `hostname -I`, confirm the Bridged Adapter, check `sudo ufw status` |
| "Error establishing a database connection" | Database container down or still starting | `docker compose ps`, then `docker compose logs cloudnova-db` |
| Containers not running after reboot | Docker service stopped or no restart policy | `sudo systemctl status docker`, then `docker compose up -d` |
| No new backup files | Script not executable or cron entry missing | `chmod +x automation-script.sh`, check `crontab -l`, run the script manually once |
| SSH connection refused | UFW rule missing or SSH service stopped | From the VM console: `sudo ufw allow 22/tcp` and `sudo systemctl status ssh` |

## 10. Maintenance Checklist
* **Daily (automatic):** database backup at 02:00 AM.
* **Weekly:** confirm backups exist; run `docker compose ps` and review `docker compose logs` for errors.
* **Monthly:** apply OS updates (`sudo apt update && sudo apt upgrade`), pull updated images (`docker compose pull && docker compose up -d`), and test a backup restore.
* **Quarterly:** review UFW rules and rotate credentials.

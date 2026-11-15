# Final Reflection

**CCM101 Cloud Computing | University of Eastern Pangasinan | Mission 10: Enterprise Cloud Architect**

## 1. Introduction

By finishing Missions 1 to 10 of CCM101, my view of cloud computing has shifted. At the start, I saw the cloud as somewhere to keep files and run websites. Now I understand it as several layers that work together, namely servers, networks, storage, security, and automation, all of which need someone to plan, build, and maintain them.

In this reflection, I review what I took from each part of the course, how Mission 10 pulled those lessons into one project, and which areas I still want to strengthen.

## 2. What I Learned in Missions 1 to 9

Over the first nine missions, my skills grew one layer at a time.

**Foundations (Missions 1 to 3).** I picked up the Linux commands for checking the operating system, CPU, memory, and disk space, and I created the GitHub portfolio that stores all of my work. I also drafted a blueprint for a cloud infrastructure and compared AWS, Azure, and Google Cloud Platform. This planning showed me that deciding on the right resources up front saves both time and money later.

**Containers and storage (Missions 4 and 5).** I learned that Docker bundles an application so it behaves the same on any machine, and I worked through the container lifecycle, from running a container to stopping and removing it. During the object storage lab, the MinIO image I was supposed to use had been removed. I read the error message, located an image that worked, and got it running. From this I learned to confirm that a tool is still available and to read the output carefully instead of assuming a command succeeded.

**Deployment and operations (Missions 6 and 7).** With Docker Compose, I saw how a multi-tier application can be written out as code. I deployed Nextcloud alongside a MariaDB database, and the database image I had originally chosen also had to be swapped for another. In the operations lab, I gathered proof of the server's condition from memory, disk, and CPU readings, Docker logs, and container metrics, rather than just assuming it was healthy.

**Security and automation (Missions 8 and 9).** I turned on a firewall, checked which ports were open, and learned to permit only the traffic a service requires. After that, I wrote a Bash backup script, gave it execute permission with `chmod +x`, and scheduled it using Cron. In my Mission 9 reflection, I wrote that automation will repeat mistakes just as reliably as it repeats good practice, and that idea guided my approach to the final mission.

## 3. Mission 10: Enterprise Cloud Architect

Mission 10 took away the step-by-step guides. I had to bring together everything I had learned into a single functioning system, which I called CloudNova.

**Architecture.** CloudNova is hosted on an Ubuntu Server virtual machine running in Oracle VirtualBox. The VM has two network adapters: a NAT adapter that gives it internet access, and a Host-only adapter that allows my Windows laptop to connect to the server and open the website.

**Deployment.** After installing Docker Engine and Docker Compose, I wrote a `docker-compose.yml` file that runs WordPress and MariaDB as connected containers on a shared Docker network. The database credentials sit in a protected `.env` file that stays out of GitHub. Named Docker volumes preserve the website files and the database through restarts and reboots. I rank this as the most important requirement, since a database that loses its data whenever a container restarts cannot be used in production.

**Security.** I enabled UFW with a default deny policy for incoming traffic and opened only what the system needs. SSH is limited to the Host-only network, root login is disabled, password authentication is off, and logging in requires an ED25519 key. I also found out that ports published by Docker can get around UFW, so the WordPress port needs separate firewall rules. This taught me that one tool does not always control every path that traffic can take.

**Automation.** My Bash script exports the MariaDB database, compresses it with Gzip, stamps the filename with the time, checks that the archive is valid, and removes any backup older than seven days. A Cron job triggers it daily at 2:00 AM UTC, which is 10:00 AM Philippine Time. I designed the script to fail safely: it halts when it hits an error and deletes unfinished backup files, so a corrupted file never sits there looking like a good one.

**Documentation.** I prepared an operational manual so that a different IT team could deploy, secure, and maintain the system without my help. Writing it made clear which steps I truly understood and which ones I had only copied.

## 4. Challenges and Lessons Learned

The network, SSH access, and firewall rules were the toughest parts of the project because they all depend on one another. Changing the firewall or SSH settings can leave me locked out of the server, and a network misconfiguration can stop my laptop from reaching the website altogether. As a result, I started keeping a second SSH session open while testing security changes, validating configuration files before reloading a service, and testing each layer on its own before moving on to the next.

The backup script showed me that a backup has value only if it can be restored. Producing the file is just half of the work, and the other half is checking the archive and rehearsing a restore.

Over all ten missions, the biggest lesson was to understand a command before running it, particularly when it changes security settings or affects stored data. For example, `docker compose down -v` looks almost the same as a harmless command, yet it permanently erases data.

## 5. Areas for Improvement

If I kept working on this project, I would:

- Lock the WordPress image to a specific version rather than `latest`, so that updates cannot unexpectedly change how the system behaves.
- Store backups in a second location, because a backup kept on the same server disappears if that server fails.
- Set up monitoring and alerts, so a failed backup or a stopped container gets noticed without anyone having to check manually.
- Enable HTTPS with a valid certificate to encrypt traffic to the website.

## 6. Conclusion

CCM101 carried me from basic Linux commands to designing, securing, and automating a full multi-tier application. CloudNova stands for that progress, bringing together virtualization, containers, networking, persistent storage, firewall protection, and scheduled backups in a system that someone else could read about and rebuild.

There is still plenty for me to learn, particularly about monitoring, encryption, and large-scale cloud platforms. The course gave me a practical base, and I plan to bring the habits of careful testing, clear documentation, and understanding what I run into my future IT work.

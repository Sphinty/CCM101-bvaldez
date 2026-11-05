# Laboratory 09: Cloud Automation Engineer

## Mission Overview
A client's IT staff kept forgetting to back up application data, which once led to permanent loss of customer files. My mission was to remove the human element by writing a Bash script that compresses and backs up an application directory, making it executable with `chmod`, and scheduling it with cron to run every night at 2:00 AM.

## Objectives
- Understand the fundamental syntax of a Bash shell script, including variables and basic commands
- Use a command-line text editor (nano) to write and save executable scripts
- Modify Linux file permissions using the chmod command
- Understand task scheduling and the syntax of a Linux crontab
- Document automation code and cron job configurations using Markdown
- Complete the final chapter of my GitHub Cloud Computing Portfolio

## Commands Executed
```bash
# Create the dummy data
mkdir app-data
echo "This is critical client data." > app-data/data.txt

# Create the script
nano backup.sh

# Permissions and execution
./backup.sh
chmod +x backup.sh
./backup.sh
ls -l backups/

# Scheduling
crontab -l
env EDITOR=nano crontab -e
# Added: 0 2 * * * /root/backup.sh
crontab -l
```

## Evidence

### 1. Script execution (Checkpoint 4)
![Script execution](./screenshots/script-execution.png)
*The backup script runs and the `.tar.gz` file appears in the `backups/` folder.*

### 2. Cron schedule (Checkpoint 5)
![Cron schedule](./screenshots/cron-schedule.png)
*The installed crontab shows the 2:00 AM nightly job.*

## Skills Learned
- Writing Bash scripts with variables and command substitution
- Using nano to create and save scripts
- Changing file permissions with `chmod +x`
- Compressing directories with `tar`
- Scheduling automated tasks with cron expressions
- Documenting automation in Markdown on GitHub

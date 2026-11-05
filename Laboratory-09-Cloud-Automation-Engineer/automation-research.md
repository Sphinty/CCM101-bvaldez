# Automation Research

## Bash Script
A Bash script is a text file containing a series of Linux shell commands that run in order, so a task can be repeated without typing each command by hand. The shebang line `#!/bin/bash` at the top tells the system to run the file using the Bash interpreter.

## Variables
Variables store a value, like a folder path, under a name such as `$BACKUP_DIR`, so it can be reused throughout a script. If the path changes, I only update it in one place instead of editing every line, which reduces typos and mistakes.

## Cron Job
A cron job is a task that the Linux cron scheduler runs automatically at set times, defined by a schedule in the crontab. It is essential for cloud operations because routine work like backups and cleanups happens on time without anyone remembering to do it.

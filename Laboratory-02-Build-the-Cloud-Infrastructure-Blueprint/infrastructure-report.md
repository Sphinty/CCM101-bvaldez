# Infrastructure Report

## 1. System Overview

The infrastructure shown is a Linux system running **Ubuntu 24.04.4 LTS (Noble)**. Several Linux commands were used to identify the operating system, kernel, processor, memory, storage, hostname, and IP address.

## 2. Operating System

### Command Used

```bash
lsb_release -a
```

### Findings

* **Distributor:** Ubuntu
* **Description:** Ubuntu 24.04.4 LTS
* **Release:** 24.04
* **Codename:** Noble

This command was used to identify the installed Ubuntu version and release information.

## 3. Kernel Information

### Command Used

```bash
uname -r
```

### Finding

* **Kernel Version:** 6.8.0-138-generic

The command displays the current Linux kernel version being used by the system.

## 4. CPU Information

### Command Used

```bash
lscpu | grep "Model Name"
```

### Finding

* **CPU:** Intel Xeon E312xx (Sandy Bridge, IBRS update)

The command was used to identify the processor model installed or assigned to the system.

The following command was also used:

```bash
lscpu | grep "Model name"
```

This displayed the CPU model and BIOS model information.

## 5. CPU Core Information

### Command Used

```bash
nproc
```

### Finding

* **Number of Processing Units:** 1

This indicates that the system currently has one available CPU processing unit.

## 6. Memory Information

### Command Used

```bash
free -h
```

### Findings

* **Total RAM:** 1.9 GiB
* **Used:** 416 MiB
* **Free:** 854 MiB
* **Available:** 1.5 GiB
* **Swap:** 1.0 GiB
* **Swap Used:** 0 B

The results show that the system has a significant amount of available memory and is not currently relying on swap memory.

## 7. Disk Storage Information

### Command Used

```bash
df -h /
```

### Findings

* **Filesystem:** `/dev/vda1`
* **Total Size:** 19 GB
* **Used:** 5.4 GB
* **Available:** 13 GB
* **Usage:** 30%
* **Mount Point:** `/`

The main filesystem is only 30% utilized, leaving approximately 13 GB of available storage.

A more detailed storage check was also performed using:

```bash
df -h
```

This displayed the `/run`, `/`, `/dev/shm`, `/run/lock`, `/boot`, and `/boot/efi` filesystems and their respective storage usage.

## 8. Hostname Information

### Command Used

```bash
hostname
```

### Finding

* **Hostname:** ubuntu

The hostname identifies the system on the network as `ubuntu`.

## 9. IP Address Information

### Command Used

```bash
hostname -I
```

### Finding

* **IP Address:** 172.30.1.2

This command displays the IP address assigned to the system. The address shown is a private IP address, indicating that the system is operating within a private or virtual network.

## 10. Summary of Commands

| Purpose                      | Command                      |
| ---------------------------- | ---------------------------- |
| Check Ubuntu version         | `lsb_release -a`             |
| Check kernel version         | `uname -r`                   |
| Check CPU model              | `lscpu \| grep "Model Name"` |
| Check CPU model details      | `lscpu \| grep "Model name"` |
| Check number of CPU units    | `nproc`                      |
| Check RAM and swap           | `free -h`                    |
| Check root storage           | `df -h /`                    |
| Check all filesystem storage | `df -h`                      |
| Check hostname               | `hostname`                   |
| Check IP address             | `hostname -I`                |

## 11. Conclusion

The commands executed provide a basic infrastructure assessment of the Ubuntu system. The system is running Ubuntu 24.04.4 LTS with a 6.8.0-138-generic kernel, one CPU processing unit, 1.9 GiB of RAM, and a 19 GB main storage partition. The system currently has sufficient available memory and storage for basic Linux administration, classroom exercises, and lightweight workloads.

# Security Audit Report

## Security Best Practices

### The Principle of Least Privilege (PoLP)
The Principle of Least Privilege means giving users, applications, and services only the permissions they need to do their job, and nothing more. It is important for cloud user accounts because a stolen or misused account can only cause limited damage if its permissions are small.

### Attack Surface
The attack surface of a virtual machine is every point where an attacker could try to get in, such as open ports, running services, exposed APIs, and user accounts. The more of these that are exposed, the more chances an attacker has to find a weakness.

### Default Deny Policy
A Default Deny policy blocks all incoming traffic unless a rule explicitly allows it. This is safer than blocking hackers one by one because attackers can change IP addresses and methods endlessly, while an allow list only lets in the traffic that was deliberately approved.

## Baseline Audit Findings
Before configuring the firewall, I ran `sudo ss -tulpn` and `sudo ufw status verbose`.

- Listening ports found: [22 (SSH), 8080 (Nginx container), others if any]
- UFW status before changes: [active/inactive]

![Open port audit](screenshots/open-port-audit.png)

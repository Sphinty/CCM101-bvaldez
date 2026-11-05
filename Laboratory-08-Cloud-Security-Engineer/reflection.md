# Mission Reflection

**1. How does a host-based firewall protect a server even if the physical network perimeter is breached?**
A host-based firewall runs on the server itself, so it keeps filtering traffic even if an attacker gets past the router or the edge firewall. Each machine becomes its own checkpoint, which is the idea behind defense in depth. If one layer fails, another still protects the server.

**2. Why is managing open network ports critical to reducing a server's attack surface?**
Every open port is a doorway to a running service, and each service can have vulnerabilities or weak credentials. By keeping only SSH and port 8080 open, I reduced the number of places an attacker can probe. Fewer entry points also means less to monitor and patch.

**3. Why is it dangerous to leave a database port like 3306 open to the public internet?**
An exposed MySQL port lets anyone attempt brute-force logins or exploit known flaws. A breach could expose customer records, passwords, and financial data, causing legal and reputational damage. Databases should only be reachable from the application server through a private network.

**4. How did this mission change your perspective on how easily a server can be compromised?**
Before this lab, I assumed a server was only at risk when someone targeted it on purpose. I learned that a server with no firewall is exposed from the moment it is deployed, and automated scanners constantly look for open ports. I also saw that a wrong command order can lock you out of your own server, so security takes careful planning.

**5. How does your GitHub portfolio currently look with eight completed missions?**
My portfolio has eight missions, each in its own folder with a README, written documentation, and screenshot evidence. Together they show my progress from basic cloud concepts to deployment, operations, and now security. It reads like a professional record of my skills rather than a list of assignments.

# Mission Reflection

**1. Why is automation critical when managing hundreds of cloud servers?**
Typing commands by hand on hundreds of servers is slow and easy to get wrong. Automation makes every server get the same steps the same way, and it frees administrators for more important work.

**2. What are the potential dangers of automation?**
A script repeats its mistakes at scale. A destructive typo, such as a wrong path in a delete command, running on 1,000 servers could wipe out data everywhere in minutes. Scripts should be tested on one machine first, and important data should have separate backups.

**3. How did writing a Bash script differ from creating a Docker Compose YAML file (Mission 6)?**
A Bash script is a list of steps, so I tell the system exactly how to do things in order. A Docker Compose file is declarative, so I describe the final state I want (services, ports, volumes) and Docker works out the steps. Bash gave me more control, but Compose was easier to read.

**4. How has your understanding of Cloud Computing transformed over the semester?**
[Write this yourself: look back at Labs 1 to 9 in your repo. What did you think cloud computing was in Lab 1, and what do you understand now about infrastructure, containers, storage, monitoring, security, and automation?]

**5. Which role did you enjoy the most and why?**
[Write this yourself: pick one role, such as Infrastructure Engineer, Cloud-Native Engineer, Data Engineer, Operations Engineer, Security Engineer, or Automation Engineer, and explain what made it enjoyable for you.]

# Mission Reflection

## 1. Why is it important to check the host server's resources even if your containers are running perfectly?

Checking the host server's resources is important because containers do not have their own hardware. They share the host's RAM, CPU, and disk. A container may look healthy while the host is quietly running out of memory or storage. If that happens, the operating system can kill processes, or containers may fail to write data, which could crash the client's website during a traffic surge.

## 2. If a user complains that they cannot log into a web application, how would the docker logs command help you solve the problem?

The docker logs command shows every request the application received and how it responded. If a user cannot log in, I would look for entries around the time of their attempt. A 401 or 403 would suggest a credentials or permissions problem, while a 500 would point to an application or server error. A 404 would mean the page or route is wrong, like the 404 I generated in this lab.

## 3. What is the difference between monitoring logs (Checkpoint 4) and monitoring metrics (Checkpoint 5)?

Logs and metrics answer different questions. Logs are records of individual events, such as the single 404 line showing a request to a page that did not exist. Metrics are numbers measured over time, such as the CPU percentage and memory usage from docker stats. Logs help me find why something failed, while metrics show how much capacity is being used.

## 4. How do you think large enterprise companies monitor thousands of containers at the same time?

Large companies cannot run docker stats by hand on thousands of containers. They use automated tools such as Prometheus, which collects and stores metrics from many containers and servers, and Grafana, which turns that data into dashboards and alerts. This lets engineers see trends and get notified before users notice a problem.

## 5. How has your ability to troubleshoot Linux environments improved?

Before this lab, I mostly guessed when something seemed wrong. Now I can check host health with free, df, and top, read application logs with docker logs, and verify resource use with docker stats. If a server became slow, I would check the host first, then the container metrics, and then the logs to find the cause.

---
*AI disclosure: I used an AI assistant to help draft and refine this reflection, with my instructor's permission. I reviewed it and confirmed that it reflects my own understanding of the lab.*

# Mission 6 Reflection

Writing a `docker-compose.yml` file lets an engineer define the whole environment in one readable file instead of typing several long commands by hand. The same file can be rerun for an identical result, shared with teammates, and stored in Git, which reduces human error and makes deployment repeatable.

An indentation error, such as using a Tab instead of spaces, makes the file invalid. YAML uses spaces to show which items belong to which section, so Docker Compose cannot parse it. The deployment fails with a syntax error and nothing starts until the file is fixed.

Environment variables like `MYSQL_PASSWORD` pass configuration into the containers at startup instead of building it into the images. The same image can be reused with different settings, and the database and Nextcloud containers receive matching credentials in one place. In production, secrets should be kept out of the file because plain-text passwords in a repository are a security risk.

Deploying Nextcloud in just a few minutes felt surprising and a little unreal. Before this lab, I imagined an enterprise storage system would take hours of installing and configuring a database and a web server. Instead, one file and one command pulled both images and linked them together. Seeing the setup page appear in my browser made Infrastructure as Code feel real, although I had to be careful with the indentation.

In Mission 1, I saw cloud computing mostly as renting someone else's servers. Since then, I have moved from exploring cloud providers to running containers, then storage, and now a full multi-container stack. I now understand that cloud computing is about automation and repeatability, not just hardware. Writing infrastructure as code taught me that engineers describe what they want and let tools build it, and I feel more confident about handling real deployments.

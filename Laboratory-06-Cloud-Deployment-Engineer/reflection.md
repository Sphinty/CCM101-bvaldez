# Mission 6 Reflection

**1. How does writing a docker-compose.yml file make a cloud engineer's job easier compared to manually typing commands?**

Writing a `docker-compose.yml` file makes a cloud engineer's job easier because the entire environment is defined in one readable file instead of several long commands typed by hand. The same file can be rerun to get an identical result, shared with teammates, and saved in Git. That removes most human error and turns deployment into something repeatable.

**2. What happens if you make an indentation error (like using a Tab instead of Spaces) in a YAML file?**

If there is an indentation error in a YAML file, such as using a Tab instead of spaces, Docker Compose cannot parse the file. YAML uses spaces to show which items belong to which section, and tabs are not allowed for indentation. The deployment fails with a syntax error and nothing starts until the file is fixed.

**3. Why did we use environment variables (like MYSQL_PASSWORD) in the Compose file?**

We used environment variables like `MYSQL_PASSWORD` so that configuration is passed into the containers when they start instead of being built into the images. The same image can be used in different environments with different settings, and both containers can be given matching database credentials in one place. In production, these values should be kept out of the file itself, since plain-text passwords in a repository are a security risk.

**4. How did it feel to deploy a fully functional enterprise cloud storage system (Nextcloud) in just a few minutes?**

Seeing the Nextcloud setup page load for the first time felt ... (3-4 sentences: What surprised you? How is this different from installing software manually? Was anything confusing or frustrating along the way?)

**5. How has your understanding of Cloud Computing evolved since Mission 1?**

In Mission 1, I thought cloud computing was mainly ... Since then I have learned to ... Now I understand that ... (3-4 sentences: mention what you learned about containers, storage, and Infrastructure as Code.)

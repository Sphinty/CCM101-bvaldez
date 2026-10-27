# Two-Tier Architecture

A two-tier architecture splits an application into two layers that run separately and talk to each other over a network: an application tier that users interact with, and a database tier that stores the data. In this lab, Nextcloud is the application tier and MariaDB is the database tier, each running in its own container.

## The Web/Application Tier

The web/application tier is the part users actually reach. It serves the user interface, receives HTTP requests from the browser, runs the application logic (logging in, uploading files, sharing folders), and asks the database for whatever data it needs. In this deployment, the Nextcloud container plays this role and is exposed to the outside world on port 8080.

## The Database Tier

The database tier is responsible for storing persistent data. For Nextcloud, this includes user accounts and credentials, file metadata, sharing settings, and app configuration. In this deployment, the MariaDB container plays this role. It is not published to any host port, so only the Nextcloud container can reach it through the internal Compose network.

## Why Separate Them?

Keeping the web server and the database in separate containers lets each be updated, restarted, scaled, or replaced without affecting the other. For example, the Nextcloud container can be upgraded or crash without touching the stored data. It also improves security, because the database is not exposed to the internet and only the application tier can talk to it. Finally, each container does one job, which makes it easier to troubleshoot, monitor, and give the right resources to each part.

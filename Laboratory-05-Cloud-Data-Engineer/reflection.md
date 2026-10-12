# Mission Reflection

**1. Why is object storage better suited for millions of photos than a traditional block storage hard drive?**
Object storage is better suited for storing millions of photos than a traditional block storage hard drive because it is built to scale. A block drive has a fixed size and must be attached to one server, so growing capacity means resizing volumes or adding disks. Object storage keeps each photo as an object with its own ID and metadata in a flat structure, so it can grow almost without limit and every photo can be retrieved over HTTP. It is also usually cheaper for large amounts of unstructured data.

**2. How did using Docker make it easier to deploy MinIO?**
Docker made deploying MinIO much easier because I did not have to install or configure anything by hand. One docker run command downloaded the image, started the server, mapped ports 9000 and 9001, and set the admin credentials through environment variables. If something went wrong, I could remove the container and start again in seconds.

**3. What is a "bucket" in cloud storage?**
A bucket is a top-level container in cloud storage that holds objects. It is similar to a folder, but it is flat and has its own name, access rules, and settings. In this lab, client-photos was the bucket that held my uploaded test file.

**4. How do large enterprises keep object storage data safe if a physical server crashes?**
Large enterprises protect object data from server crashes through replication and redundancy. They store several copies of each object on different disks, servers, and even different data centers or regions. Some systems use erasure coding to split data into pieces so it can be rebuilt if some pieces are lost. Backups and versioning add another layer of protection.

**5. How is my confidence with the Linux command line growing?**
My confidence with the Linux command line is growing. In this lab I used commands like docker run, docker ps, cd, mkdir, nano, and git without needing to look up every step. [Add your own experience: what felt hard, what you can now do easily.] I am more comfortable reading error messages and fixing problems, such as removing a container with a duplicate name.

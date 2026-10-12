# Types of Cloud Storage

| Feature | Block Storage | File Storage | Object Storage |
|---|---|---|---|
| **Description** | Stores data in fixed-size blocks, each with its own address. It is attached to a server like a hard drive, and the operating system manages the file system on top of it. | Stores data as files in a hierarchy of folders and directories. It is shared over a network so multiple servers or users can access the same files. | Stores data as objects in a flat structure. Each object holds the data, its metadata, and a unique ID, and is accessed over HTTP through an API or URL. |
| **Primary Use Case** | Databases, operating system disks, and applications that need fast, low-latency performance. | Shared drives, content management, and applications where many servers need the same files. | Images, videos, backups, logs, and other large amounts of unstructured data. |
| **Cloud Provider Example** | AWS EBS | AWS EFS | AWS S3 |

## Recommendation to the Client

Object storage is the best choice for your user-uploaded images because it scales almost without limit, so it can handle millions of photos as your app grows. Each image is stored as an object that can be retrieved by URL, which suits a photo-sharing application. It also costs less than block storage for large amounts of data, and it keeps your photos safe even when the web server container is deleted or replaced.

# Client Recommendations

## Client A – Startup Company
**Scenario:** Limited budget, launching a mobile app, expects rapid growth.
**Recommended Platform:** AWS (or GCP — either is defensible; justify your pick)
**Justification:** A startup benefits from pay-as-you-go pricing and a free
tier to control costs early on, with the ability to scale services up as
usage grows without re-architecting. Its App Runner/Elastic Beanstalk and
serverless options let a small team ship quickly without managing servers.
**Services to use:**
- Amazon EC2 / AWS Lambda (compute)
- Amazon S3 (storage for app assets)
- Amazon RDS or DynamoDB (database)

## Client B – University
**Scenario:** Already uses Windows Server, Microsoft 365, Active Directory.
**Recommended Platform:** Microsoft Azure
**Justification:** Azure integrates natively with the university's existing
Microsoft ecosystem, minimizing migration friction. Microsoft Entra ID can
extend the university's existing Active Directory to the cloud (hybrid
identity), and licensing agreements (Microsoft Enterprise Agreements/EDU
pricing) often make Azure more cost-effective for Microsoft-heavy
organizations.
**Services to use:**
- Azure Virtual Machines (migrate Windows Server workloads)
- Microsoft Entra ID / Azure AD Connect (identity)
- Azure Virtual Desktop or Azure Files (for shared resources)

## Client C – AI Research Company
**Scenario:** Needs high-performance computing for AI/ML.
**Recommended Platform:** Google Cloud Platform
**Justification:** GCP offers Vertex AI, TPUs (Tensor Processing Units)
purpose-built for ML workloads, and GKE for scalable containerized training
pipelines — giving the company specialized hardware and tooling not matched
elsewhere.
**Services to use:**
- Vertex AI (ML platform)
- Compute Engine with GPU/TPU support
- Google Kubernetes Engine (GKE)

## Client D – Global E-Commerce Company
**Scenario:** Needs high availability and automatic scaling worldwide.
**Recommended Platform:** AWS
**Justification:** AWS's global infrastructure footprint (most regions/
availability zones) combined with auto-scaling and global content delivery
via CloudFront makes it well suited for a multinational e-commerce
operation that needs low latency and resilience worldwide.
**Services to use:**
- Amazon EC2 Auto Scaling
- Amazon CloudFront (CDN)
- Amazon RDS Multi-AZ / DynamoDB Global Tables

## Multi-Cloud Decision Matrix (Checkpoint 6)

| Business Requirement    | Recommended Platform | Justification |
|---------------------------|------------------------|------------------|
| Startup Company            | AWS                    | Flexible pricing, free tier, fast to launch |
| Enterprise Organization      | AWS or Azure            | Mature governance tools, wide service catalog |
| Microsoft Environment        | Azure                   | Native AD/365 integration |
| AI / Machine Learning         | GCP                     | Vertex AI, TPUs, strong ML tooling |
| Kubernetes Deployment          | GCP                     | Created Kubernetes, most mature GKE |
| Global Web Application         | AWS                     | Largest global infrastructure, CloudFront CDN |

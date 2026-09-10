## Linux Investigation (Checkpoint 7)

**Operating System:** (paste output here)
**CPU Info:** (paste output here)
**Memory:** (paste output here)
**Disk Space:** (paste output here)

### If this Linux server were migrated to the cloud, which services could host it?
- **AWS:** Amazon EC2 (with an AMI matching this OS/distro)
- **Azure:** Azure Virtual Machines (matching Linux image from Marketplace)
- **GCP:** Compute Engine (matching Linux image)

All three support this workload as a standard IaaS virtual machine; the
choice would come down to cost, region availability, and which
ecosystem the rest of the infrastructure lives in.

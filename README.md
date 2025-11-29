# Dynamic Frequency Based Fingerprinting Attacks against Modern Sandbox Environments
The cloud computing landscape has evolved significantly in recent years, embracing various sandboxes to meet the diverse demands of modern cloud applications. These sandboxes encompass container-based technologies like Docker and gVisor, microVM-based solutions like Fire-cracker, and security-centric sandboxes relying on Trusted Execution Environments (TEEs) such as Intel SGX and AMD SEV. However, the practice of placing multiple tenants on shared physical hardware raises security and privacy concerns, most notably side-channel attacks. In this paper, we investigate the possibility of fingerprinting containers through CPU frequency reporting sensors in Intel and AMD CPUs. One key enabler of our attack is that the current CPU frequency information can be accessed by user-space attackers. We demonstrate that Docker images exhibit a unique frequency signature, enabling the distinction of different containers with up to 84.5 % accuracy even when multiple containers are running simultaneously in different cores. Additionally, we assess the effectiveness of our attack when performed against several sandboxes deployed in cloud environments, including Google's gVisor, AWS’ Firecracker, and TEE-based platforms like Gramine (utilizing Intel SGX) and AMD SEV. Our empirical results show that these attacks can also be carried out successfully against all of these sandboxes in less than 40 seconds, with an accuracy of over 70 % in all cases. Finally, we propose a noise injection-based countermeasure to mitigate the proposed attack on cloud environments. For more details, please read the paper: [[Paper]](https://ieeexplore.ieee.org/document/10629032)

## Threat Model:
<p align="center">
  <img src="Threat_model.png" width="800" title="Threat Model">
</p>

## Targeted Sandbox Environments
Choose one of the environments:
- [ ] Native (Docker Container)
- [ ] gVisor 
- [ ] Firecracker VMM
- [ ] AMD SEV
- [ ] Gramine

## Workflow inside each Directory

### **1. Pull Container Images**
Before running any containers, make sure all required images are available.

- `pull_images.sh` reads container names from `container_name.txt`
- It will pull images automatically

This must be completed once before running workloads.

### **2. Check Container Execution Status**
Use:

- `status.sh`  
  This shows whether a task within the container is currently running inside the targeted sandboxed environment.

### **3. Collect CPU Frequency Data**
Two scripts are provided:

#### **A. `data.sh`**
Collects **4,000 samples** of CPU-frequency data while a containerized workload is running.  

#### **B. `data_collection.sh`**
This performs automated large-scale data collection:

- For each container in the list (`container_name.txt`)
- Runs each container **100 times**
- Collects CPU frequency data on each run
- Saves the results into the **`Data/`** directory

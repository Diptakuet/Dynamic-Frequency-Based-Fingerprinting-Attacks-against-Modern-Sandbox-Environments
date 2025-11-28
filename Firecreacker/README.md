## Firecracker + containerd Environment Setup 

To use the scripts in this directory, you must first install and configure:

### **1. Firecracker**
Follow the official Firecracker installation and environment setup:

- Firecracker Getting Started:  
  https://github.com/firecracker-microvm/firecracker/blob/main/docs/getting-started.md

- Firecracker User Guide (kernel, networking, jailer, API):  
  https://github.com/firecracker-microvm/firecracker/blob/main/docs/user-guide.md

### **2. containerd**
Install and configure containerd based on its upstream documentation:

- containerd Getting Started:  
  https://github.com/containerd/containerd/blob/main/docs/getting-started.md

### **3. Firecracker-containerd Integration**
The Firecracker-containerd runtime is required to run containers inside a Firecracker MicroVM.

Use the official reference:

- Firecracker-containerd Documentation:  
  https://github.com/firecracker-microvm/firecracker-containerd/tree/main/docs

This includes:
- Runtime architecture  
- containerd configuration  
- Setting up the Firecracker shim  
- Pulling and running containers inside a microVM

Once Firecracker, containerd, and firecracker-containerd are installed and fully functional, you can proceed with the workflow below.

---

## Workflow in This Directory

After the environment is ready, the project uses the following workflow.

### **1. Run `script.sh`**
This script performs initial setup or environment preparation steps required before launching containers in Firecracker.

### **2. Run `run_firecracker_containerd.sh`**
You must **keep this script running**.  
It initializes or manages the Firecracker-containerd service loop required for container execution.

Keep it active in its own terminal window.

### **3. Pull Container Images**
Before running any containers, make sure all required images are available.

- `pull_images.sh` reads container names from `container_name.txt`
- It will pull **126 images** automatically

This must be completed once before running workloads.

### **4. Run Test Containers**
You can run any test workload from the **`container/`** directory to verify functionality.

This confirms:
- Firecracker microVM boot  
- containerd runtime  
- Firecracker-containerd shim pipeline  
- Container execution inside the microVM

### **5. Check Container Execution Status**
Use:

- `status.sh`  
  This shows whether a task is currently running inside the Firecracker-backed container.

The script queries the container runtime and validates proper Firecracker execution.

### **6. Collect CPU Frequency Data**
Two scripts are provided:

#### **A. `data.sh`**
Collects **4,000 samples** of CPU-frequency data while a containerized workload is running.  
This is used to study microVM behavior, and workload characteristics.

#### **B. `data_collection.sh`**
This performs automated large-scale data collection:

- For each container in the list (`container_name.txt`)
- Runs each container **100 times**
- Collects CPU frequency data on each run
- Saves the results into the **`Data/`** directory



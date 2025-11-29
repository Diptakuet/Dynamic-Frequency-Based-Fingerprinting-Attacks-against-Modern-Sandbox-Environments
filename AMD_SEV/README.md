## Workflow in This Directory

### **1. Pull Container Images**
Before running any containers, make sure all required images are available.

- `pull_images.sh` reads container names from `container_name.txt`
- It will pull **126 images** automatically

This must be completed once before running workloads.

### **2. Run Test Containers**
You can run any test workload from the **`container/`** directory to verify functionality.

This confirms:
- Firecracker microVM boot  
- containerd runtime  
- Firecracker-containerd shim pipeline  
- Container execution inside the microVM

### **3. Check Container Execution Status**
Use:

- `status.sh`  
  This shows whether a task is currently running inside the Firecracker-backed container.

The script queries the container runtime and validates proper Firecracker execution.

### **4. Collect CPU Frequency Data**
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

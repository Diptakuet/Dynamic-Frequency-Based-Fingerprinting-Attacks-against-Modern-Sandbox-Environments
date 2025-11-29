## Workflow in This Directory

### **1. Pull Container Images**
Before running any containers, make sure all required images are available.

- `pull_images.sh` reads container names from `container_name.txt`
- It will pull images automatically

This must be completed once before running workloads.

### **2. Check Container Execution Status**
Use:

- `status.sh`  
  This shows whether a task is currently running inside the AMD SEV container.

### **3. Collect CPU Frequency Data**
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

## Implementation

### 1) Install Dependencies

Install the required system dependencies (compiler toolchain, Python, Docker, SGX prerequisites, etc.) appropriate for your distribution.

For detailed, up-to-date dependency and environment requirements, see the Gramine documentation:

- Gramine installation options (packages, Docker image, or from source):  
  https://gramine.readthedocs.io/en/stable/installation.html

- Complete building instructions & common dependencies:  
  https://gramine.readthedocs.io/en/stable/devel/building.html

- Quick start and SGX prerequisites:  
  https://gramine.readthedocs.io/en/stable/quickstart.html

Follow those guides to ensure your system meets all prerequisites (kernel, SGX driver, FSGSBASE, etc.).

---

### 2) Install Intel SGX SDK and PSW

Install the **Intel SGX SDK** and **Platform Software (PSW)** as required for Gramine with SGX support.

You can follow the SGX-related prerequisites from the Gramine documentation (they reference Intel’s official guides and package repositories):

- Quick start prerequisites (SGX requirements):  
  https://gramine.readthedocs.io/en/stable/quickstart.html

Make sure that:

- SGX support is enabled in BIOS/firmware
- The SGX driver is installed on the host
- SDK/PSW (and optionally DCAP) are installed according to your platform

---

### 3) Install Gramine

Once the environment and SGX components are ready, install **Gramine**.

You can choose one of the options described in the official docs:

- **Install Gramine packages** from your distribution’s repository
- **Use the official Gramine Docker image**
- **Build and install Gramine from source**

See:

- Gramine installation options:  
  https://gramine.readthedocs.io/en/stable/installation.html

- Gramine GitHub repository (entry point and links to docs):  
  https://github.com/gramineproject/gramine

Use whichever installation path best fits your environment (bare-metal, VM, or container-based).

---

### 4) Install and Use GSC (Gramine Shielded Containers)

After Gramine is installed and working, set up **Gramine Shielded Containers (GSC)** to protect Docker containers with SGX + Gramine.

GSC has its own repository and documentation:

- GSC documentation (installation and usage):  
  https://gramine.readthedocs.io/projects/gsc

- GSC GitHub repository:  
  https://github.com/gramineproject/gsc

Follow those documents to:

1. Install GSC and its prerequisites
2. Configure `config.yaml` as needed
3. Use `gsc build`, `gsc sign-image`, and `docker run` to graminize and run your container

---

### 5) Continue with GSC Workflow

Once GSC is installed and configured:

1. Build a base Docker image for your application
2. Use GSC to transform the base image into a **graminized** image
3. Sign the graminized image for SGX
4. Run the resulting container in SGX mode 

This repository assumes that all low-level environment setup (drivers, kernel, SGX, Gramine, GSC) is done following the upstream documentation referenced above.

---

## Repository Structure

```text
├── pull_container.sh
├── build_image.sh
├── signed_image.sh
├── run_docker.sh
├── check_container.sh
├── data.sh
├── data_collection.sh
├── kill_docker.sh



1) Run script.sh
2) Run run_firecracker_containerd.sh (Keep it running in one terminal)
3) Pull the images first. The 'pull_images.sh' will pull 126 images read from 'container_name.txt'
3) You can run any containers from the 'container' folder to check whether it works or not. 
4) status.sh will show whether the task is running inside the container or not.
5) The 'data.sh' will collect 4000 samples of CPU frequency data.
6) The 'data_collection.sh' will run each containers from the list 100 times and save the CPU frequency values inside the Data folder.

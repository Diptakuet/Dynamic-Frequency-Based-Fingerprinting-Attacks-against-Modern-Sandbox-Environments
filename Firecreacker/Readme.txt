1) Run script.sh
2) Run run_firecracker_containerd.sh (Keep it running in one terminal)
3) Pull the images first. The 'pull_images.sh' will pull 129 images read from 'container_name.txt'
3) You can run any containers from the 'container' folder to check whether it works or not. 
4) status.sh will show whether the task is running inside the container or not.
5) The 'data.sh' will collect 4000 samples of CPU frequency data.
6) The 'data_collection.sh' will run each containers from the list 100 times and print CPU frequency values during each run.
7) To save the CPU frequerncy values printed in the terminal, please use the 'script' command.
  For example: 
>>script -a data.txt
>> sudo ./data_collection.sh

Once the 'data collection.sh' stops, enter exit to stop the script as well.
>>exit

This way 'data.txt' will save evrything that is printed in the terminal. 

We are not saving the data directly in a file (e.g., ./data.sh >> data.txt), 
because we have seen that the frequency rises if we save it this way and introduces more noise to the cpu frequency data.



 
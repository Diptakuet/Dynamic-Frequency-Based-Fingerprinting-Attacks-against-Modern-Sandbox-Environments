#!/bin/bash

sudo nerdctl stop test_container
sudo nerdctl container rm test_container
#sudo killall containerd-shim-aws-firecracker
#sudo rm -rf /run/firecracker-containerd/io.containerd.runtime.v2.task/default/test_container
#sleep 5s
#sudo firecracker-ctr --address /run/firecracker-containerd/containerd.sock c rm test_container

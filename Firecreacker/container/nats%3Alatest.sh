#!/bin/bash

img_name='nats:latest'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 --memory-limit 1024000000 \
     docker.io/library/$img_name \
     test_container 


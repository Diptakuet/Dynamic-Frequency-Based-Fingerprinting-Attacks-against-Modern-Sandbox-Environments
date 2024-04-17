#!/bin/bash

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env MY_CONTAINER_NAME=my-consul-container \
     docker.io/library/consul:latest \
     test_container

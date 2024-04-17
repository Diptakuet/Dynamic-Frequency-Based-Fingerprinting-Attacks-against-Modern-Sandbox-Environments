#!/bin/bash


sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --rm --tty --env NODE_ENV=development --net-host --cpus 1 \
     docker.io/library/ghost:latest \
     test_container

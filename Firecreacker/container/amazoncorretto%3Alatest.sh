#!/bin/bash

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1\
     docker.io/library/amazoncorretto:latest \
     test_container

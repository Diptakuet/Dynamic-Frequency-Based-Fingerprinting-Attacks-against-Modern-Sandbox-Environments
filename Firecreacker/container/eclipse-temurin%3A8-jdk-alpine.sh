#!/bin/bash

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1\
     docker.io/library/eclipse-temurin:8-jdk-alpine \
     test_container

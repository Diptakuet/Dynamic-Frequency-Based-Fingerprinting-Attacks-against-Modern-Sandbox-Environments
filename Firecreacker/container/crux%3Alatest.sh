#!/bin/bash

sudo firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --detach --net-host --cpus 1\
     docker.io/library/crux:latest \
     test_container

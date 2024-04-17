#!/bin/bash


sudo firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --rm --tty --net-host --cpus 1 \
     docker.io/library/bonita:latest \
     test_container

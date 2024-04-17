#!/bin/bash

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --rm --tty --net-host --cpus 1 \
     docker.io/library/plone:latest \
     test_container

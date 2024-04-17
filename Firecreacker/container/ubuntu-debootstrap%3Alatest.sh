#!/bin/bash

img_name='ubuntu-debootstrap:latest'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env NICK=FooBot -env SERVER=irc.libera.chat \
     docker.io/library/$img_name \
     test_container 

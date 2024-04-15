#!/bin/bash

sudo firecracker-ctr \
   --address /run/firecracker-containerd/containerd.sock c ls

sudo firecracker-ctr \
   --address /run/firecracker-containerd/containerd.sock t ls

sudo dmsetup ls

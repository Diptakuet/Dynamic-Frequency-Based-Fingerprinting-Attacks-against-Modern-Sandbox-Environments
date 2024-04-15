#!/bin/bash

sudo nerdctl \
   --address /run/containerd/containerd.sock c ls

sudo nerdctl \
   --address /run/containerd/containerd.sock t ls

sudo dmsetup ls

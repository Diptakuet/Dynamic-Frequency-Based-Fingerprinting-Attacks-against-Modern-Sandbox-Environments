#!/bin/bash

echo "Image: "
read image

sudo ./gsc build --insecure-args $image test/generic.manifest

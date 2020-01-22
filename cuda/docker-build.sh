#! /usr/bin/env bash
REGISTRY=192.168.10.10:8083
docker build --target base -t shapelets/khiva-cuda-builder-base:16.1.2 .
docker build --target build-arrayfire -t shapelets/arrayfire-cuda-builder:3.6.4 .
docker build --target arrayfire-cuda -t shapelets/arrayfire-cuda:3.6.4 .
docker build --target build-khiva -t shapelets/khiva-cuda-builder:0.4.0 .
docker build --target khiva-cuda -t shapelets/khiva-cuda:0.4.0 .
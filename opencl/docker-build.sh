#! /usr/bin/env bash
docker build --target build -t shapelets/khiva-opencl-builder-base:0.4.0 .
docker build --target build-arrayfire -t shapelets/arrayfire-opencl-builder:3.6.2 .
docker build --target arrayfire-intel-opencl -t shapelets/arrayfire-intel-opencl:3.6.2 .
docker build --target build-khiva -t shapelets/khiva-builder:0.4.0 .
docker build --target khiva-intel-opencl -t shapelets/khiva:0.4.0 .
docker tag shapelets/khiva-opencl-builder-base:0.4.0 $REGISTRY/shapelets/khiva-opencl-builder-base:0.4.1
docker tag shapelets/arrayfire-opencl-builder:3.6.2 $REGISTRY/shapelets/arrayfire-opencl-builder:3.6.2
docker tag shapelets/arrayfire-intel-opencl:3.6.2 $REGISTRY/shapelets/arrayfire-intel-opencl:3.6.2
docker tag shapelets/khiva-builder:0.4.0 $REGISTRY/shapelets/khiva-builder:0.4.1
docker tag shapelets/khiva:0.4.0 $REGISTRY/shapelets/khiva:0.4.1
# NOTE: Here we have changed tag from 0.4.0 to 0.4.1 because khiva 0.4.1 image is optimized for space 
# and does not have java installed so it is not the same image as the one in DockerHub
docker push $REGISTRY/shapelets/khiva-opencl-builder-base:0.4.1
docker push $REGISTRY/shapelets/arrayfire-opencl-builder:3.6.2
docker push $REGISTRY/shapelets/arrayfire-intel-opencl:3.6.2
docker push $REGISTRY/shapelets/khiva-builder:0.4.1
docker push $REGISTRY/shapelets/khiva:0.4.1
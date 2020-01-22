#! /usr/bin/env bash
docker build --target base -t shapelets/khiva-cuda-builder-base:0.4.0 .
docker build --target build-arrayfire -t shapelets/arrayfire-cuda-builder:3.6.4 .
docker build --target arrayfire-cuda -t shapelets/arrayfire-cuda:3.6.4 .
docker build --target build-khiva -t shapelets/khiva-cuda-builder:0.4.0 .
docker build --target khiva-cuda -t shapelets/khiva-cuda:0.4.0 .
docker tag shapelets/khiva-cuda-builder-base:0.4.0 $REGISTRY/shapelets/khiva-cuda-builder-base:0.4.1
docker tag shapelets/arrayfire-cuda-builder:3.6.2 $REGISTRY/shapelets/arrayfire-cuda-builder:3.6.2
docker tag shapelets/arrayfire-cuda:3.6.2 $REGISTRY/shapelets/arrayfire-cuda:3.6.2
docker tag shapelets/khiva-cuda-builder:0.4.0 $REGISTRY/shapelets/khiva-cuda-builder:0.4.1
docker tag shapelets/khiva-cuda:0.4.0 $REGISTRY/shapelets/khiva-cuda:0.4.1
# NOTE: Here we have changed tag from 0.4.0 to 0.4.1 because khiva 0.4.1 image is optimized for space 
# and does not have java installed so it is not the same image as the one in DockerHub
docker push $REGISTRY/shapelets/khiva-cuda-builder-base:0.4.1
docker push $REGISTRY/shapelets/arrayfire-cuda-builder:3.6.2
docker push $REGISTRY/shapelets/arrayfire-cuda:3.6.2
docker push $REGISTRY/shapelets/khiva-cuda-builder:0.4.1
docker push $REGISTRY/shapelets/khiva-cuda:0.4.1
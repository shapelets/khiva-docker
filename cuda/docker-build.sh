#! /usr/bin/env bash
docker build --target base -t $PUSH_REGISTRY/shapelets/khiva-cuda-builder-base:0.4.1 .
docker build --target build-arrayfire -t $PUSH_REGISTRY/shapelets/arrayfire-cuda-builder:3.6.2 .
docker build --target arrayfire-cuda -t $PUSH_REGISTRY/shapelets/arrayfire-cuda:3.6.2 .
docker build --target build-khiva -t $PUSH_REGISTRY/shapelets/khiva-cuda-builder:0.4.1 .
docker run --device /dev/dri:/dev/dri --workdir /root/khiva/build $PUSH_REGISTRY/shapelets/khiva-cuda-builder:0.4.1 ctest
docker build --target khiva-cuda -t $PUSH_REGISTRY/shapelets/khiva-cuda:0.4.1 .
docker push $PUSH_REGISTRY/shapelets/khiva-cuda-builder-base:0.4.1
docker push $PUSH_REGISTRY/shapelets/arrayfire-cuda-builder:3.6.2
docker push $PUSH_REGISTRY/shapelets/arrayfire-cuda:3.6.2
docker push $PUSH_REGISTRY/shapelets/khiva-cuda-builder:0.4.1
docker push $PUSH_REGISTRY/shapelets/khiva-cuda:0.4.1
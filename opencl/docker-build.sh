#! /usr/bin/env bash
docker build --target build -t $PUSH_REGISTRY/shapelets/khiva-opencl-builder-base:0.5.0 .
docker build --target build-arrayfire -t $PUSH_REGISTRY/shapelets/arrayfire-opencl-builder:3.6.2 .
docker build --target arrayfire-intel-opencl -t $PUSH_REGISTRY/shapelets/arrayfire-intel-opencl:3.6.2 .
docker build --target build-khiva -t $PUSH_REGISTRY/shapelets/khiva-builder:0.5.0 .
docker run --device /dev/dri:/dev/dri --workdir /root/khiva/build $PUSH_REGISTRY/shapelets/khiva-builder:0.5.0 ctest
docker build --target khiva-intel-opencl -t $PUSH_REGISTRY/shapelets/khiva:0.5.0 .
docker push $PUSH_REGISTRY/shapelets/khiva-opencl-builder-base:0.5.0
docker push $PUSH_REGISTRY/shapelets/arrayfire-opencl-builder:3.6.2
docker push $PUSH_REGISTRY/shapelets/arrayfire-intel-opencl:3.6.2
docker push $PUSH_REGISTRY/shapelets/khiva-builder:0.5.0
docker push $PUSH_REGISTRY/shapelets/khiva:0.5.0
# Khiva docker images
This repository contains a set of folders to build the Docker images of the Khiva library.

More concretely, each folder contains:
- `intel-opencl`: prepares a Docker image with the Intel OpenCL Runtime (v16.1.2).
- `arrayfire-intel-opencl`: prepares a Docker image based on the previous one. In addition, it includes the ArrayFire library and all its dependencies.
- `khiva-ocl-build`: prepares a Docker image with the rest of the Khiva dependencies satisfied (i.e. Doxygen, GraphViz, Sphinx and Java JDK 8).
- `khiva`: prepares a Docker image with all the Khiva dependencies satisfied (i.e. OpenCL, ArrayFire, Doxygen, GraphViz, Sphinx and Java JDK 8)
- `khiva-python`: with the Khiva library and its Python binding installed.
- `khiva-java`: with the Khiva library and its Java binding installed.
- `khiva-r`: with the Khiva library and its R binding installed.
- `khiva-ci-build`: the main purpose of this image is generating the Khiva installer for Travis CI.
- `khiva-jupyter`: with the Khiva Python library environment and a Jupyter server running. It provides some examples.

The previous images are pushed to the [Shapelets Docker hub repository](https://hub.docker.com/u/shapelets).

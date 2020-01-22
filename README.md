# Khiva docker images
This repository contains a set of folders to build the Docker images of the Khiva library.

NOTE: All the images below need to be rebuilt with the multistage approach like we do in khiva:0.4.1 image in the opencl folder.
We need to do it this way because khiva 0.4.1 does not have java installed so it is not the same image as the one in DockerHub. 
We need to build one for each binding.

More concretely, each folder contains:
- `khiva-python`: with the Khiva library and its Python binding installed.
- `khiva-csharp`: with the Khiva library and its C# binding installed.
- `khiva-java`: with the Khiva library and its Java binding installed.
- `khiva-r`: with the Khiva library and its R binding installed.
- `khiva-jupyter`: with the Khiva Python library environment and a Jupyter server running. It also provides some examples.
- `khiva-ignite`: with the Khiva library and its Java binding installed, and also Apache Ignite installed.

The previous images are pushed to the [Shapelets Docker hub repository](https://hub.docker.com/u/shapelets).

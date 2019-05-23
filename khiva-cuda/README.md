# khiva

Dockerfile with all the Khiva dependencies satisfied (i.e. CUDA, ArrayFire, Doxygen, GraphViz, Sphinx and Java JDK 8).


## Building image

```
docker build --rm -t shapelets/khiva:0.2.2 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva:0.2.2 shapelets/khiva:latest
docker push shapelets/khiva:0.2.2
docker push shapelets/khiva:latest
```

## Running container

```
docker run --rm -ti shapelets/khiva
```

## Using the Khiva library

You can set up your CMake project to load the Khiva library. Please follow the instructions contained [here](https://khiva.readthedocs.io/en/latest/cmake.html).


### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>

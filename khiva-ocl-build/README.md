# khiva-ocl-build

Dockerfile with all the Khiva dependencies satisfied (i.e. OpenCL, ArrayFire, Conan, Doxygen, GraphViz, Sphinx and Java JDK 8)


## Building image

```
docker build --rm -t shapelets/khiva-ocl-build:0.1.0 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva-ocl-build:0.1.0 shapelets/khiva-ocl-build:latest
docker push shapelets/khiva-ocl-build:0.1.0
docker push shapelets/khiva-ocl-build:latest
```

## Running container

```
docker run --rm -ti shapelets/khiva-ocl-build
```


### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>
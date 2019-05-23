# khiva-cuda-build

Dockerfile with all the Khiva dependencies satisfied (i.e. CUDA, ArrayFire, Conan, Doxygen, GraphViz, Sphinx and Java JDK 8)


## Building image

```
docker build --rm -t shapelets/khiva-cuda-build:0.2.2 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva-cuda-build:0.2.2 shapelets/khiva-cuda-build:latest
docker push shapelets/khiva-cuda-build:0.2.2
docker push shapelets/khiva-cuda-build:latest
```

## Running container

```
docker run --rm -ti shapelets/khiva-cuda-build
```


### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>

# intel-opencl

Dockerfile with the Intel OpenCL Runtime (v16.1.2).


## Building image

```
docker build --rm -t shapelets/intel-opencl:16.1.2 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/intel-opencl:16.1.2 shapelets/intel-opencl:latest
docker push shapelets/intel-opencl:16.1.2
docker push shapelets/intel-opencl:latest
```

## Running container

```
docker run --rm -ti shapelets/intel-opencl
```

### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>
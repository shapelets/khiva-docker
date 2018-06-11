# intel-opencl

Dockerfile with the Intel OpenCL driver (v5.0) and SDK (v7.0.0).


## Building image

```
docker build --rm -t shapelets/intel-opencl:5.0-7.0.0 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/intel-opencl:5.0-7.0.0 shapelets/intel-opencl:latest
docker push shapelets/intel-opencl:5.0-7.0.0
docker push shapelets/intel-opencl:latest
```

## Running container

```
docker run --rm -ti shapelets/intel-opencl
```

### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>
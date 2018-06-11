# arrayfire-intel-opencl

Dockerfile based on the Dockerfile contained in the `intel-opencl` folder. In addition, it includes the ArrayFire library and all its dependencies.


## Building image

```
docker build --rm -t shapelets/arrayfire-intel-opencl:3.6.0 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/arrayfire-intel-opencl:3.6.0 shapelets/arrayfire-intel-opencl:latest
docker push shapelets/arrayfire-intel-opencl:3.6.0
docker push shapelets/arrayfire-intel-opencl:latest
```

## Running container

```
docker run --rm -ti shapelets/arrayfire-intel-opencl
```

### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>
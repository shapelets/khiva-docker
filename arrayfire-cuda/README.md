# arrayfire-cuda

Dockerfile based on the `nvidia/cuda` image. In addition, it includes the ArrayFire library and all its dependencies.


## Building image

```
docker build --rm -t shapelets/arrayfire-cuda:3.6.2 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/arrayfire-cuda:3.6.2 shapelets/arrayfire-cuda:latest
docker push shapelets/arrayfire-cuda:3.6.2
docker push shapelets/arrayfire-cuda:latest
```

## Running container

```
docker run --rm -ti shapelets/arrayfire-cuda
```

### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>

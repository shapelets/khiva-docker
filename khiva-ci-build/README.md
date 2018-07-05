# khiva-ci-build

Dockerfile based on an Ubuntu trusty image. This Dockerfile compiles ArrayFire only with the CPU backend, and will serve to do the same with the Khiva library. The main purpose of this image is generating the Khiva installer for Travis CI.


## Building image

```
docker build --rm -t shapelets/khiva-ci-build:0.1.0 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva-ci-build:0.1.0 shapelets/khiva-ci-build:latest
docker push shapelets/khiva-ci-build:0.1.0
docker push shapelets/khiva-ci-build:latest
```

## Running container

```
docker run --rm -ti shapelets/khiva-ci-build
```

### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>

# khiva-r

Dockerfile with the Khiva library and its R binding installed.


## Building image

```
docker build --rm -t shapelets/khiva-r:0.1.0 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva-r:0.1.0 shapelets/khiva-r:latest
docker push shapelets/khiva-r:0.1.0
docker push shapelets/khiva-r:latest
```

## Running container

```
docker run --rm -ti shapelets/khiva-r
```


### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>
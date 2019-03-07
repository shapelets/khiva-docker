# khiva-python

Dockerfile with the Khiva library and its Python binding installed.


## Building image

```
docker build --rm -t shapelets/khiva-python:0.2.0 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva-python:0.2.0 shapelets/khiva-python:latest
docker push shapelets/khiva-python:0.2.0
docker push shapelets/khiva-python:latest
```

## Running container

```
docker run --rm -ti shapelets/khiva-python
```

## Using the Khiva Python binding

Please follow the Khiva Python binding documentation contained [here](https://khiva-python.readthedocs.io/en/latest).


### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>
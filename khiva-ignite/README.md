# khiva-ignite

Dockerfile with the Khiva library and its Java binding installed. It also installs Apache Ignite.


## Building image
First of all, please make sure you have the Apache Ignite binary archive available in the same directory as the `Dockerfile`. Follow the next steps if you do not have it:
1. Build Apache Ignite binary archive as describe in [Ignite DEVNOTES.txt](https://github.com/apache/ignite/blob/master/DEVNOTES.txt). 
2. Copy Apache Ignite's binary archive to Docker module directory.
3. Unpack Apache Ignite's binary archive.

```
docker build --rm -t shapelets/khiva-ignite:0.1.0 .
```


## Pushing the image

Before pushing the image, please ensure you have entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva-ignite:0.1.0 shapelets/khiva-ignite:latest
docker push shapelets/khiva-ignite:0.1.0
docker push shapelets/khiva-ignite:latest
```


## Running container

```
docker run --rm -ti shapelets/khiva-ignite
```


### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>

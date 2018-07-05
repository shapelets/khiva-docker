# khiva-jupyter

Dockerfile with the Khiva Python library environment and a Jupyter server running.
It provides some examples.

## Building image

```
docker build --rm -t shapelets/khiva-jupyter:0.1.0 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva-jupyter:0.1.0 shapelets/khiva-jupyter:latest
docker push shapelets/khiva-jupyter:0.1.0
docker push shapelets/khiva-jupyter:latest
```

## Running container

```
docker run -p 8888:8888 --name khiva-jupyter --rm -ti -td shapelets/khiva-jupyter:latest
```

Then, run the next command in order to get the Jupyter token:

```
docker exec -it khiva-jupyter jupyter notebook list
```

## Installing Python Packages from Pypi

```
docker exec -it khiva-jupyter pip3 install <package-name>
```

## Use the interactive applications

Please visit the khiva-use-cases repo to understand the interactive applications that are provided as examples [here](https://github.com/shapelets/khiva-use-cases).


### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva?source=orgpage)
* Email: <mailto:dev@shapelets.io>

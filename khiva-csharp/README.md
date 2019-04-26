# khiva-csharp

Dockerfile with the Khiva library and its C# binding installed.


## Building image

```
docker build --rm -t shapelets/khiva-csharp:0.2.3 .
```

## Pushing the image

Before pushing the image, please ensure you entered your Docker hub credentials with the command: `docker login`

```
docker tag shapelets/khiva-csharp:0.2.3 shapelets/khiva-csharp:latest
docker push shapelets/khiva-csharp:0.2.3
docker push shapelets/khiva-csharp:latest
```

## Running container

```
docker run --rm -ti shapelets/khiva-csharp
```


### Support and Contact Info

* [Gitter](https://gitter.im/shapelets-io/khiva-csharp?source=orgpage)
* Email: <mailto:dev@shapelets.io>
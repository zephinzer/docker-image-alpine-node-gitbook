# Alpine:Node:Gitbook Docker Image
[![Build Status](https://travis-ci.org/zephinzer/docker-image-alpine-node-gitbook.svg?branch=master)](https://travis-ci.org/zephinzer/docker-image-alpine-node-gitbook)

An open-sourced, minimal, extensible, customisable and self-updating GitBook image.

This image is built upon a minimal `alpine-node` image and has been designed to be used in close-sourced environments through extension and customisation.

## Relevant Links

Travis CI pipeline: https://travis-ci.org/zephinzer/docker-image-alpine-node-gitbook

Base Image (`zephinzer/alpine-node`):
  - https://github.com/zephinzer/docker-image-alpine-node
  - https://hub.docker.com/r/zephinzer/alpine-node/
  - https://travis-ci.org/zephinzer/docker-image-alpine-node

## TL;DR : Use It

Examples can be found in the `/examples` folder.

### via `Dockerfile`
Create a `Dockerfile` with the following:

```dockerfile
FROM zephinzer/alpine-node-gitbook:latest
COPY . /app
EXPOSE 4000/tcp
ENTRYPOINT ["gitbook", "serve"]
```

Then run:

```bash
docker build . -t angitbook_image
docker run -t -i -p 80:4000 --name angitbook_container angitbook_image
```

### via `docker-compose`
Create the `docker-compose.yml` file with the following:

```yaml
version: "3"
services:
  gitbook:
    image: zephinzer/alpine-node-gitbook:latest
    container_name: alpine-node-gitbook-with-docker-compose
    working_dir: /app
    entrypoint: "gitbook serve"
    expose:
      - "4000/tcp"
    ports:
      - "80:4000"
    volumes:
      - ./:/app
```

Then run:

```bash
docker-compose up
```

### via `docker-compose` and `Dockerfile`
Create the `docker-compose.yml` file with the following:

```yaml
version: "3"
services:
  gitbook:
    build: .
    container_name: alpine-node-gitbook-with-docker-compose-and-build
    working_dir: /app
    entrypoint: "gitbook serve"
    expose:
      - "4000/tcp"
    ports:
      - "80:4000"
```

Create the `Dockerfile` with the following:

```dockerfile
FROM zephinzer/alpine-node-gitbook:latest
COPY . /app
```

Then run:

```bash
docker-compose up
```

## Customisations

Place customisation directives inside `./conf.d` as files. For example to override the `BASE_IMAGE_NAME`, place a file named `BASE_IMAGE_NAME` in `./conf.d` containing the name of the base image you want to use.

### BASE_IMAGE_NAME
Specifies the name of the image we want to use to build upon.

> Defaults to `zephinzer/alpine-node`

### BASE_IMAGE_TAG
Specifies the tag of the image we want to use to build upon.

> Defaults to `latest-argon`

### GITBOOK_VERSION
Specifies the version of GitBook we want to use.

> Defaults to `3.2.3`

### REPOSITORY_NAME
This specifies where we should try to `docker push` to.

> Defaults to `zephinzer/alpine-node-gitbook`

## Contributing

Fork this repository, make your changes and submit a merge request.

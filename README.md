# Hawtio Docker Image

[![CI](https://github.com/boolivar/docker-hawtio/actions/workflows/ci.yml/badge.svg)](https://github.com/boolivar/docker-hawtio/actions/workflows/ci.yml)
[![Dockerhub](https://img.shields.io/docker/v/boolivar/hawtio)](https://hub.docker.com/r/boolivar/hawtio)

Docker image for https://hawt.io web console

## Run web console
```
docker run -p 8080:8080 boolivar/hawtio:latest
```
Open console at http://localhost:8080/hawtio

Container entrypoint supports Hawtio CLI [configuration options](https://hawt.io/docs/get-started.html#_running_from_cli_jbang):
```
docker run boolivar/hawtio:latest -V
```
## Image Variants

### `boolivar/hawtio:latest`

Release with the greatest version from `boolivar/hawtio:<version>`

### `boolivar/hawtio:<version>`

Image based on `eclipse-temurin:21` with [jbang](https://www.jbang.dev/) installed to run hawtio.

### `boolivar/hawtio:<version>-alpine`

Image is based on `eclipse-temurin:21-alpine` with `bash` and [jbang](https://www.jbang.dev/) installed to run hawtio.

## Build image

`HAWTIO_VERSION` build-arg is required to build image using Dockerfile:
```bash
docker build -t hawtio:4.3.0 --build-arg HAWTIO_VERSION=4.3.0 .
```
See [Dockerfile](Dockerfile) for supported build args.

Java is required to build image using gradle:
```bash
./gradlew build
```

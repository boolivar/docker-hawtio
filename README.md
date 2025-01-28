# Hawtio Docker Image

[![CI](https://github.com/boolivar/docker-hawtio/actions/workflows/ci.yml/badge.svg)](https://github.com/boolivar/docker-hawtio/actions/workflows/ci.yml)
[![Dockerhub](https://img.shields.io/docker/v/boolivar/hawtio)](https://hub.docker.com/repository/docker/boolivar/hawtio/general)

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

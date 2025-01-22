# syntax=docker/dockerfile:1
ARG JAVA_VERSION=latest

FROM eclipse-temurin:$JAVA_VERSION

LABEL org.opencontainers.image.title="hawtio"
LABEL org.opencontainers.image.source="https://github.com/boolivar/docker-hawtio"

ARG HAWTIO_VERSION=
ARG JBANG_VERSION=

ENV PATH=/root/.jbang/bin:$PATH

RUN    JBANG_DOWNLOAD_VERSION=$JBANG_VERSION curl -Ls https://sh.jbang.dev | bash -s - app setup
RUN    jbang trust add https://github.com/hawtio/hawtio/ \
    && jbang app install hawtio@hawtio/hawtio/$HAWTIO_VERSION

ENTRYPOINT ["hawtio"]
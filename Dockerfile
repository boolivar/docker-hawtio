# syntax=docker/dockerfile:1
ARG JAVA_VERSION=latest

FROM eclipse-temurin:$JAVA_VERSION

ARG HAWTIO_VERSION=

ENV PATH=/root/.jbang/bin:$PATH

RUN    curl -Ls https://sh.jbang.dev | bash -s - app setup
RUN    jbang trust add https://github.com/hawtio/hawtio/ \
    && jbang app install hawtio@hawtio/hawtio/$HAWTIO_VERSION

ENTRYPOINT ["hawtio"]
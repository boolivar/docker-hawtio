# syntax=docker/dockerfile:1
ARG java_version=latest

FROM eclipse-temurin:${java_version}

ARG hawtio_version=
ARG jbang_version=latest

ENV PATH=/root/.jbang/bin:$PATH

RUN    curl -Ls https://sh.jbang.dev | bash -s - app setup
RUN    jbang trust add https://github.com/hawtio/hawtio/ \
    && jbang app install hawtio@hawtio/hawtio/$hawtio_version

ENTRYPOINT ["hawtio"]
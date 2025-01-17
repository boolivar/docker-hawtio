# syntax=docker/dockerfile:1
ARG hawtio_version=
ARG java_image=eclipse-temurin:latest
ARG jbang_version=latest
ARG jbang_path=/jbang

# jbang image
FROM jbangdev/jbang-action:${jbang_version} AS jbang

ARG hawtio_version

RUN jbang trust add https://github.com/hawtio/hawtio/
RUN jbang app install hawtio@hawtio/hawtio/${hawtio_version}

# java image
FROM ${java_image}

ARG jbang_path

COPY --from=jbang /jbang ${jbang_path}

ENV JBANG_DIR=${jbang_path}/.jbang
ENV PATH="${jbang_path}/bin:${JBANG_DIR}/bin:${PATH}"

ENTRYPOINT ["hawtio"]

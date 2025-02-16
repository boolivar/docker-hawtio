# syntax=docker/dockerfile:1
ARG JAVA_VERSION=latest

FROM eclipse-temurin:$JAVA_VERSION

EXPOSE 8080

ARG HAWTIO_VERSION=
ARG JBANG_VERSION=
ARG USERNAME=java
ARG GROUPNAME=java
ARG USER_UID=1001
ARG USER_GID=$USER_UID
ARG WORK_DIR=hawtio

ENTRYPOINT ["hawtio"]

LABEL org.opencontainers.image.title="hawtio"
LABEL org.opencontainers.image.source="https://github.com/boolivar/docker-hawtio"
LABEL org.opencontainers.image.licenses="MIT"

RUN    bash --version || apk add --no-cache bash \
    && addgroup --gid $USER_GID $GROUPNAME \
    && adduser --disabled-password --gecos=$USERNAME --ingroup=$GROUPNAME --uid=$USER_UID $USERNAME \
    && mkdir -p /home/$USERNAME/$WORK_DIR \
    && chown -R $USERNAME:$GROUPNAME /home/$USERNAME

USER $USERNAME
ENV PATH=/home/$USERNAME/.jbang/bin:$PATH
WORKDIR /home/$USERNAME/$WORK_DIR

RUN    JBANG_DOWNLOAD_VERSION=$JBANG_VERSION wget -qO - https://sh.jbang.dev | bash -s - app setup \
    && jbang trust add https://github.com/hawtio/hawtio/ \
    && jbang app install hawtio@hawtio/hawtio/$HAWTIO_VERSION \
    && jbang config set --file=. offline true
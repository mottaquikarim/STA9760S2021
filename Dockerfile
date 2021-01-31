FROM alpine:latest

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.80.0
COPY hugo_0.80.0_Linux-64bit/hugo .
RUN pwd
RUN ls -ahl

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && mv /hugo /usr/local/bin/hugo \
    && curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
    && mv minify /usr/local/bin/ \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
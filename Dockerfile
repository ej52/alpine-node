FROM mhart/alpine-node:0.12
MAINTAINER Elton Renda "https://github.com/ej52"

RUN echo "http://dl-4.alpinelinux.org/alpine/v3.2/main" >> /etc/apk/repositories && \
    apk add --update graphicsmagick && \
    mkdir /app && \ 
    npm install nodemon -g && \
    rm -rf /var/cache/apk/*

WORKDIR /app

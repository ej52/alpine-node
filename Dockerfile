FROM mhart/alpine-node:4.5
MAINTAINER Elton Renda "https://github.com/ej52"

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --update bash graphicsmagick --update-cache && \
    mkdir /app && \ 
    npm install pm2 nodemon -g && \
    rm -rf /var/cache/apk/*

WORKDIR /app

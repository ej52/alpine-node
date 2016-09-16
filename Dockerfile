FROM mhart/alpine-node:4.5
MAINTAINER Elton Renda "https://github.com/ej52"

RUN mkdir /app && apk add --update bash graphicsmagick --update-cache && npm install pm2 nodemon -g && rm -rf /var/cache/apk/*

WORKDIR /app

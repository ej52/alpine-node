FROM mhart/alpine-node:4.5
MAINTAINER Elton Renda "https://github.com/ej52"

RUN mkdir /app && apk add --update bash && npm install pm2 -g && rm -rf /var/cache/apk/*

WORKDIR /app

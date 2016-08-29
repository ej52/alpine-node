FROM mhart/alpine-node:4.5
MAINTAINER Elton Renda "https://github.com/ej52"

RUN mkdir /app && npm install pm2 -g

WORKDIR /app

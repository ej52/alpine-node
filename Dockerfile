FROM mhart/alpine-node:0.12
MAINTAINER Elton Renda "https://github.com/ej52"

RUN mkdir /app && npm install nodemon -g

WORKDIR /app

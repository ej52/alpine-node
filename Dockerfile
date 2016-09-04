FROM mhart/alpine-node:4.5
MAINTAINER Elton Renda "https://github.com/ej52"

RUN mkdir /app && apk add --update bash && npm install -g serverless nodemon && rm -rf /var/cache/apk/*

WORKDIR /app

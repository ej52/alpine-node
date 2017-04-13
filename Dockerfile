FROM node:6-alpine
MAINTAINER Elton Renda "https://github.com/ej52"

RUN apk add --no-cache bash

WORKDIR /app
CMD [ "node" ]

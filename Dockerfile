FROM ej52/alpine-base:latest
MAINTAINER Elton Renda "https://github.com/ej52"

ENV NPM_CONFIG_LOGLEVEL info

RUN adduser -D node \
    && apk add --no-cache \
        libstdc++ \
    && apk add --no-cache --virtual .build-deps \
        binutils-gold \
        curl \
        g++ \
        gcc \
        gnupg \
        libgcc \
        linux-headers \
        make \
        python \
  # gpg keys listed at https://github.com/nodejs/node#release-team
  && for key in \
    9554F04D7259F04124DE6B476D5A82AC7E37093B \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    56730D5401028683275BD23C23EFEFE93C4CFFFE \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys ""; \
  done \
    && curl -SLO "https://nodejs.org/dist/v6.10.1/node-v6.10.1.tar.xz" \
    && curl -SLO "https://nodejs.org/dist/v6.10.1/SHASUMS256.txt.asc" \
    && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
    && grep " node-v6.10.1.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
    && tar -xf "node-v6.10.1.tar.xz" \
    && cd "node-v6.10.1" \
    && ./configure \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install \
    && apk del .build-deps \
    && cd .. \
    && rm -Rf "node-v6.10.1" \
    && rm "node-v6.10.1.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt

RUN apk add --no-cache --virtual .build-deps-yarn curl gnupg \
  && for key in \
    6A010C5166006599AA17F08146C2130DFD2497F5 \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys ""; \
  done \
  && curl -fSL -o yarn.js "https://yarnpkg.com/downloads/0.21.3/yarn-legacy-0.21.3.js" \
  && curl -fSL -o yarn.js.asc "https://yarnpkg.com/downloads/0.21.3/yarn-legacy-0.21.3.js.asc" \
  && gpg --batch --verify yarn.js.asc yarn.js \
  && rm yarn.js.asc \
  && mv yarn.js /usr/local/bin/yarn \
  && chmod +x /usr/local/bin/yarn \
  && apk del .build-deps-yarn

  WORKDIR /app
  CMD [ "node" ]

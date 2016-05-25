FROM mhart/alpine-node:6

ENV APP_NAME kosmio-micro-base-image
ENV NODE_TLS_REJECT_UNAUTHORIZED 0

WORKDIR /var/www

ADD package.json /tmp/package.json
RUN cd /tmp && npm config set registry http://registry.npmjs.org/ && npm config set loglevel info && npm install --no-optional
RUN mkdir -p /var/www && cp -a /tmp/node_modules /var/www && rm /tmp/package.json && cd /var/www

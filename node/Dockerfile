FROM mhart/alpine-node:8

MAINTAINER Shaun Warman

WORKDIR /app/node

COPY . .
COPY app.logrotate /etc/logrotate.d/app.logrotate

RUN apk update && apk add \
    logrotate \
    && npm install

CMD ["node", "index.js"]

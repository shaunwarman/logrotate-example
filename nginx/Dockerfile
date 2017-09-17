FROM ubuntu:xenial

WORKDIR /tmp/nginx

COPY startup.sh startup.sh

RUN apt-get update && apt-get install -y \
    curl \
    less \
    logrotate \
    man \
    nginx \
    cron \
    && chmod +x startup.sh

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.logrotate /etc/logrotate.d

CMD startup.sh

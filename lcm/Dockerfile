FROM ubuntu:xenial

WORKDIR /app/lcm

COPY startup.sh startup.sh

RUN apt-get update && apt-get install -y \
    cron \
    curl \
    less \
    man \
    logrotate \
    && chmod +x startup.sh

CMD /app/lcm/startup.sh

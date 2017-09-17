#!/bin/bash

NGINX_URL="http://localhost:8080/"

function rotateNode()
{
  echo "NODE LOGS - PRE-ROTATE"
  ls applogs

  docker exec node /usr/sbin/logrotate -d /etc/logrotate.d/app.logrotate

  newline

  docker exec node /usr/sbin/logrotate -f /etc/logrotate.d/app.logrotate

  echo "NODE LOGS - POST-ROTATE"
  ls applogs
}

function rotateNginx()
{
  echo "NGINX LOGS - PRE-ROTATE"
  ls nginxlogs

  docker exec nginx /usr/sbin/logrotate -d /etc/logrotate.d/nginx.logrotate

  newline

  docker exec nginx /usr/sbin/logrotate -f /etc/logrotate.d/nginx.logrotate

  echo "NGINX LOGS - POST-ROTATE"
  ls nginxlogs
}

function newline()
{
  echo " "
}

# use ab to send traffic
ab -c 5 -n 1000 $NGINX_URL

rotateNode

newline

rotateNginx

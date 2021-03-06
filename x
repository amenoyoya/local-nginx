#!/bin/bash

cd $(dirname $0)

export STAGE=local
export DOMAINS=$(cat config | tr '\n' ',' | sed 's/,$//')

case "$1" in
"init")
    tee ./config << \EOS
app.localhost -> http://localhost:8080
EOS
    tee ./docker-compose.yml << \EOS
version: "3.8"

services:
  proxy:
    image: steveltn/https-portal:1
    logging:
      driver: json-file
    # 所属ネットワーク
    network_mode: host
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - /var/run/docker.sock/:/tmp/docker.sock/:ro
    environment:
      STAGE: "${STAGE:-local}" # 本番環境の場合は production を指定（実際の Let's Encrypt に SSL 申請を行う）
      DOMAINS: "$DOMAINS" # 'domain -> http://port-forward, ...'
      WEBSOCKET: "true" # WebSocket接続を許可
EOS
    ;;
"set-stage")
    sed -i "s/^export STAGE=.*/export STAGE=${2:-local}/" ./x
    ;;
*)
    docker-compose $*
    ;;
esac

FROM node:14-alpine3.12

RUN : 'コンテナ内で必要なパッケージをインストール' && \
    apk add --no-cache shadow nginx && \
    mkdir -p /run/nginx && \
    : 'nodeユーザをsudoersに追加' && \
    apk add --no-cache sudo && \
    echo 'node ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER node
WORKDIR /home/node/
EXPOSE 80

# スタートアップコマンド（docker up の度に実行される）
CMD ["/bin/ash", "/home/node/startup.sh"]

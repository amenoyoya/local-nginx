# local nginx

ローカル開発環境で nginx サーバを稼働させる

## Environment

- Shell: bash
- Docker: `19.0.12`
    - docker-compose: `1.26.0`

### Initialize
```bash
# ./n に実行権限付与
$ chmod +x ./n

# Dockerプロジェクト展開
$ ./n init
```

### Structure
```bash
./
|_ docker/
|  |_ conf.d/ # mount => /etc/nginx/conf.d/
|  |  |_ default.conf # default server config
|  |
|  |_ Dockerfile # app service container definition file
|
|_ node/ # mount => service://app:/home/node/
|  |_ public/ # nginx server document root
|  |  |_ index.html
|  |
|  |_ startup.sh # execute on docker.service://app start
|
|_ docker-compose.yml # docker containers definition file
```

### Docker
- services:
    - **app**: `node:14-alpine3.12`
        - Node.js 14 + Nginx WEB Server
        - network_mode: `host`
        - user: `node` (USER_ID 環境変数で指定したユーザIDが設定される)
        - workdir: `/home/node/`

### Setup
```bash
# dockerコンテナ構築
# $ export USER_ID=$UID && docker-compose build
$ ./n build

# dockerコンテナ起動
# $ export USER_ID=$UID && docker-compose up -d
$ ./n up -d

# => nginx server: http://localhost
```

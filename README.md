# local-nginx

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

### Setup
```bash
# dockerコンテナ起動
$ ./n up -d

# => reverse proxy from ./config
```
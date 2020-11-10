# -- node@service://app/

# 環境変数 UID が与えられていれば node ユーザIDを $UID に合わせる
if [ "$UID" != "" ]; then
    # node ユーザIDを変更
    sudo usermod -u $UID node
    # node のホームディレクトリのパーミッション修正
    sudo chown -R node:node /home/node/
fi

# nginx サーバ起動
sudo /usr/sbin/nginx -g 'daemon off;'

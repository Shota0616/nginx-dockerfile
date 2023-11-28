# dockerイメージのベースとなるイメージを指定、最新の安定版1.24.0をタグ指定
# https://nginx.org/en/download.html
FROM nginx:1.24.0

# コンテナに入って操作するときvim使いたいので、aptでインストールしておく
RUN apt update
RUN apt install -y vim

# ホスト側で用意したnginx設定ファイルをコンテナ側にコピー
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
# 初期のindex.htmlを送付
COPY ./index.html /usr/share/nginx/html/index.html

# 公開ポートを指定、今回はwebなので80番開けておく
EXPOSE 80

# デーモンはオフにしてフォアグラウンドで実行
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

FROM mcr.microsoft.com/mssql/server:2022-CU10-ubuntu-20.04

# 環境変数
ENV SA_PASSWORD=${SA_PASSWORD}
ENV DB_NAME=${DB_NAME}

# 初期スクリプトをコンテナにコピー
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY init-db.sql /tmp/init-db.sql

# root 権限で実行権限を付与（`COPY` の後に `chmod` を実行）
USER root
RUN chown -R mssql:root /var/opt/mssql
RUN chmod -R +x /var/opt/mssql
RUN chmod +x /usr/local/bin/entrypoint.sh

# `mssql` ユーザーに戻す
USER mssql

# `entrypoint.sh` を実行
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

#!/bin/bash

# エラーが発生したらスクリプトを終了する
set -e

# SQL Server をバックグラウンドで起動
/opt/mssql/bin/sqlservr &

# サーバー起動を待機
echo "Waiting for SQL Server to be ready..."
until /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "${SA_PASSWORD}" -Q "SELECT 1" > /dev/null 2>&1; do
    echo "SQL Server の起動待ち. 3秒後にリトライします..."
    sleep 3
done

# 初期 SQL スクリプトを実行
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "${SA_PASSWORD}" -i "/tmp/pubs_azure_with_timestamp.sql"

# MSSQL のメインプロセスを実行
wait

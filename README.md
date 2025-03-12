MSSQL（Microsoft SQL Server）のセットアップ

- 使用イメージは mssql/server:2022-CU10-ubuntu-20.04

- .env_example を .env にコピーし、以下を設定してください
  - SA (System Admin) のパスワード
  - 初期に作成するDB名

- ビルド方法
  - プロジェクトフォルダで docker-compose up -d --build

- 成功時のログ（例）
  - docker logs my_mssql を入力

```
2025-03-12 06:26:25.77 spid52      Starting up database 'pubs'.
2025-03-12 06:26:25.77 spid52      RemoveStaleDbEntries: Cleanup of stale DB entries called for database ID: [5]
2025-03-12 06:26:25.77 spid52      RemoveStaleDbEntries: Cleanup of stale DB entries skipped because master db is not memory optimized. DbId: 5.
2025-03-12 06:26:25.83 spid52      Parallel redo is started for database 'pubs' with worker pool size [16].
2025-03-12 06:26:25.85 spid52      Parallel redo is shutdown for database 'pubs' with worker pool size [16].
```

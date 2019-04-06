# README

## ディレクトリ作成
mkdir .docker/mysql


## Railsアプリケーション作成
docker-compose run --rm web rails new . --force --database=mysql --skip-bundle

## データベース作成
`myapp_development`

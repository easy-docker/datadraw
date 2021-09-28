#!/bin/bash
USER="root"
if [ "$PASSWORD" == "" ];then
    PASSWORD="123456"
fi
if [ "$DATABASE" == "" ];then
    DATABASE="datadraw"
fi

docker pull mysql:5
mkdir -p mysqldata
docker rm -f mysql5
docker run -d -p 172.17.0.1:3306:3306 --name mysql5 -e MYSQL_ROOT_PASSWORD=$PASSWORD -v $PWD/mysqldata:/var/lib/mysql --restart always mysql:5

docker pull ghostry/datadraw
docker rm -f datadraw
touch config.php
mkdir -p sql
mkdir -p public
docker run -d -p \
    8081:80 \
    --name datadraw \
    -v "$PWD/sql":/var/www/sql \
    -v "$PWD/public":/var/www/html/public \
    -v "$PWD/config.php":/var/www/html/application/config.php \
    --restart always \
    -e HOSTNAME="172.17.0.1" \
    -e DATABASE=$DATABASE \
    -e USERNAME=$USER \
    -e PASSWORD=$PASSWORD \
    -e HOSTPORT="3306" \
    ghostry/datadraw

#crate database
docker exec mysql5 mysql -u $USER -p$PASSWORD -e "CREATE DATABASE $DATABASE DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
#importdata
docker exec mysql5 mysql -u $USER -p$PASSWORD $DATABASE < sql/mysql.sql

echo "------------------------------------"
echo "mysql用户名$USER,密码 $PASSWORD"
echo "修改 config.php 中的微信支付宝信息"
echo "然后 docker restart datadraw"
echo "http://127.0.0.1:8081/"
echo "用户名: admin@datadraw.net 密码: admin"


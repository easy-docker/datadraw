#!/bin/sh
#ext-gd
mkdir -p tmp
mkdir -p ../mysqldata
docker run --rm --interactive --tty -v $PWD:/app -v $PWD/tmp:/tmp --user $(id -u):$(id -g) composer install
docker run -d -p 3306:3306 --name mysql5 -e MYSQL_ROOT_PASSWORD=123456  -v $PWD/../mysqldata:/var/lib/mysql --restart always mysql:5
docker build . -t php7.2apache
docker run -d -p 8081:80 --name apache-php-app -v "$PWD":/var/www/html --restart always php7.2apache
echo "现在需要创建数据库 datadraw 并把 mysql.sql 导入mysql5"
echo "mysql用户名root,密码123456"
echo "修改 application/database.php 中的数据库IP"
echo "然后 docker restart apache-php-app"
echo "http://127.0.0.1:8081/"
echo "用户名:admin@datadraw.net 密码:admin"
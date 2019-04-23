#!/bin/sh
#ext-gd
mkdir -p tmp
docker run --rm --interactive --tty -v $PWD:/app -v $PWD/tmp:/tmp --user $(id -u):$(id -g) composer install
docker run -d -p 3306:3306 --name mysql5 -e MYSQL_ROOT_PASSWORD=123456 mysql:5
docker build . -t php7.2apache
docker run -d -p 8081:80 --name apache-php-app -v "$PWD":/var/www/html php7.2apache
echo "现在需要把mysql.sql导入mysql5,mysql用户名root,密码123456"
echo "修改 application/database.php 中的数据库IP"
echo "然后 docker restart apache-php-app"
echo "http://127.0.0.1:8081/"
echo "用户名:admin@datadraw.net 密码:admin"
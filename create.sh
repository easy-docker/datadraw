#!/bin/sh
#ext-gd
mkdir -p tmp
mkdir -p ../mysqldata
# chmod 777 runtime
# chmod -R 777 public
docker run --rm --interactive --tty -v $PWD:/app -v $PWD/tmp:/tmp --user $(id -u):$(id -g) composer install
docker run -d -p 172.17.0.1:3306:3306 --name mysql5 -e MYSQL_ROOT_PASSWORD=123456 -v $PWD/../mysqldata:/var/lib/mysql --restart always mysql:5

docker run -d -p 8081:80 --name datadraw -v "$PWD":/var/www/html --restart always ghostry/php:7.2-apache
./importSQL.sh
echo "mysql用户名root,密码123456"
echo "修改 application/database.php 中的数据库IP"
echo "然后 docker restart apache-php-app"
echo "http://127.0.0.1:8081/"
echo "用户名:admin@datadraw.net 密码:admin"

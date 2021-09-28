#!/bin/sh
#ext-gd
mkdir -p tmp
mkdir -p ../mysqldata
# chmod 777 runtime
# chmod -R 777 public

docker run -d -p 172.17.0.1:3306:3306 --name mysql5 -e MYSQL_ROOT_PASSWORD=123456 -v $PWD/../mysqldata:/var/lib/mysql --restart always mysql:5

docker run -d -p 8081:80 --name datadraw -v "$PWD/sql":/var/www/mysql -v "$PWD/public":/var/www/html/public -v "$PWD/config.php":/var/www/html/application/config.php --restart always ghostry/datadraw
./importSQL.sh
echo "mysql用户名root,密码123456"
echo "修改 application/database.php 中的数据库IP"
echo "然后 docker restart apache-php-app"
echo "http://127.0.0.1:8081/"
echo "用户名:admin@datadraw.net 密码:admin"

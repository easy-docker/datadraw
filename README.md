# 快速开始
此方法适合在空的服务器上，会同时安装DataDraw和MySQL5
```
cd /data
export PASSWORD="123456"
export DATABASE="datadraw"
curl -L https://raw.githubusercontent.com/easy-docker/datadraw/master/create.sh | bash -
```

# 手动
 - 使用以下命令安装
 - 然后把sql下的文件导入到数据库
 - 修改 config.php 中的微信支付宝信息
 - 然后 `docker restart datadraw`
 - 访问 http://127.0.0.1:8081/
 - 用户名: admin@datadraw.net 密码: admin
```
name=datadraw
HOSTNAME="172.17.0.1"
DATABASE="datadraw"
USERNAME="root"
PASSWORD="123456"
HOSTPORT="3306"

docker pull ghostry/datadraw
docker rm -f $name

touch config.php
mkdir -p sql
mkdir -p public

docker run -d -p \
    8081:80 \
    --name $name \
    -v "$PWD/sql":/var/www/mysql \
    -v "$PWD/public":/var/www/html/public \
    -v "$PWD/config.php":/var/www/html/application/config.php \
    --restart always \
    -e HOSTNAME=$HOSTNAME \
    -e DATABASE=$DATABASE \
    -e USERNAME=$USER \
    -e PASSWORD=$PASSWORD \
    -e HOSTPORT=$HOSTPORT \
    ghostry/datadraw
```
# 介绍
[原项目介绍](https://github.com/zxhm001/DataDraw#readme)

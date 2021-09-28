#!/bin/bash
sed "s/{hostname}/$HOSTNAME/" /var/www/html/CloudreveInstaller/database_sample.php > /var/www/html/application/database.php
sed -i "s/{database}/$DATABASE/" /var/www/html/application/database.php
sed -i "s/{username}/$USERNAME/" /var/www/html/application/database.php
sed -i "s/{password}/$PASSWORD/" /var/www/html/application/database.php
sed -i "s/{hostport}/$HOSTPORT/" /var/www/html/application/database.php

if [ ! -f /var/www/sql/mysql.sql ];then
    cp /var/www/mysql.sql /var/www/sql/
fi

if [ ! -f /var/www/html/public/locks ];then
    cp -r /var/www/html/public.ex/* /var/www/html/public/
    chmod -R 777 /var/www/html/public
fi

config=`cat /var/www/html/application/config.php`

if [ "$config" == "" ];then
    cat /var/www/html/application/config_sample.php > /var/www/html/application/config.php
fi

chmod 777 /var/www/html/runtime

/usr/local/bin/apache2-foreground

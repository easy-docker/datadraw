#!/bin/bash
sed "s/{hostname}/$HOSTNAME/" /var/www/html/CloudreveInstaller/database_sample.php > /var/www/html/application/database.php
sed -i "s/{database}/$DATABASE/" /var/www/html/application/database.php
sed -i "s/{username}/$USERNAME/" /var/www/html/application/database.php
sed -i "s/{password}/$PASSWORD/" /var/www/html/application/database.php
sed -i "s/{hostport}/$HOSTPORT/" /var/www/html/application/database.php

if [ ! -f /var/www/mysql/mysql.sql ];then
    cp /var/www/mysql.sql /var/www/mysql/
    cp /var/www/html/static/editor/templates/templates.sql /var/www/mysql/
    cp /var/www/html/static/editor/templates/templatedata.sql /var/www/mysql/
fi

if [ ! -f /var/www/html/public/locks ];then
    cp -r /var/www/html/public.ex/* /var/www/html/public/
fi

/usr/local/bin/apache2-foreground

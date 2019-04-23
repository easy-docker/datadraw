#!/bin/sh
export LC_ALL=C.UTF-8;
export LANG=C.UTF-8;
USER="root"
PASSWORD="123456"
DATABASE="datadraw"
######################
#crate database
docker exec -it mysql5 mysql -u $USER -p$PASSWORD -e "CREATE DATABASE $DATABASE DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
#importdata
docker exec -i mysql5 mysql -u $USER -p$PASSWORD $DATABASE < mysql.sql
docker exec -i mysql5 mysql -u $USER -p$PASSWORD $DATABASE < static/editor/templates/templates.sql
docker exec -i mysql5 mysql -u $USER -p$PASSWORD $DATABASE < static/editor/templates/templatedata.sql
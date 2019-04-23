#!/bin/sh
USER="root"
PASSWORD="123456"
DATABASE="datadraw"
SQLSTR=`cat mysql.sql`
######################
#crate database
docker exec -it mysql5 mysql -u $USER -p$PASSWORD -e "CREATE DATABASE $DATABASE;"
#importdata
docker exec -it mysql5 mysql -u $USER -p$PASSWORD $DATABASE -e "$SQLSTR"
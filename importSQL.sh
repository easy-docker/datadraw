#!/bin/sh
USER="root"
PASSWORD="123456"
DATABASE="datadraw"
######################
#crate database
docker exec -it mysql5 mysql -u $USER -p$PASSWORD -e "CREATE DATABASE $DATABASE;"
#importdata
SQLSTR=`cat mysql.sql`
docker exec -it mysql5 mysql -u $USER -p$PASSWORD $DATABASE -e "$SQLSTR"
SQLSTR=`cat static/editor/templates/templates.sql`
docker exec -it mysql5 mysql -u $USER -p$PASSWORD $DATABASE -e "$SQLSTR"
cat static/editor/templates/templatedata.sql|while read line;do
    docker exec -it mysql5 mysql -u $USER -p$PASSWORD $DATABASE -e "$line";
done
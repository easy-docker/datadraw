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
SQLSTR=`cat static/editor/templates/templatedata1.sql`
docker exec -it mysql5 mysql -u $USER -p$PASSWORD $DATABASE -e "$SQLSTR"
SQLSTR=`cat static/editor/templates/templatedata2.sql`
docker exec -it mysql5 mysql -u $USER -p$PASSWORD $DATABASE -e "$SQLSTR"
SQLSTR=`cat static/editor/templates/templatedata3.sql`
docker exec -it mysql5 mysql -u $USER -p$PASSWORD $DATABASE -e "$SQLSTR"
SQLSTR=`cat static/editor/templates/templatedata4.sql`
docker exec -it mysql5 mysql -u $USER -p$PASSWORD $DATABASE -e "$SQLSTR"
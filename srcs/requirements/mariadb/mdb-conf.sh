#!/bin/bash

service mariadb start
sleep 5 

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_USER}\`@'%';"

mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop
sleep 2

exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
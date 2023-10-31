#!/bin/bash

service mariadb start

sleep 5
if [ ! -d "/var/lib/mysql/$MYSQL_DB" ]
then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
    mysql -u root -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';" 
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;" && mysql -u root -e "FLUSH PRIVILEGES;"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
fi

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
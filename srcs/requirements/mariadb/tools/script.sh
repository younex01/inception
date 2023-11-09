#!/bin/bash

service mariadb start
sleep 2
mysql -h localhost -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
mysql -h localhost -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" 
mysql -h localhost -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"
mysql -h localhost -u root -e "FLUSH PRIVILEGES;"
mysql -h localhost -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

sed -i 's@= 127.0.0.1@= 0.0.0.0@' /etc/mysql/mariadb.conf.d/50-server.cnf
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld_safe
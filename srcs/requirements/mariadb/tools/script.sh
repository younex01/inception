#!/bin/bash

service mariadb start
sleep 2
sed -i 's@= 127.0.0.1@= 0.0.0.0@' /etc/mysql/mariadb.conf.d/50-server.cnf
mysql -u root -e "create database $MARIA_DB;"
mysql -u root -e "create user '$MARIA_USER'@'%' identified by '$MARIA_PASSWORD';"
mysql -u root -e "grant all privileges on $MARIA_DB.* to '$MARIA_USER'@'%';"
mysql -u root -e "alter user 'root'@'localhost' identified by '$MARIA_PASSWORD';"
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
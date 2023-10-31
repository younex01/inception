#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ];
then
    wp core download --allow-root
    wp core config --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root
    wp core install --url=$DOMAIN_NAME --title="yelousse blog" --admin_user="odyn" --admin_password="valhalla" --admin_email="odyn@gmail.com" --allow-root
    wp user create yelousse yelousse@gmail.com --user_pass="Yelousse123" --allow-root
fi
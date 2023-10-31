#!/bin/bash

if [! -f "/var/www/html/wp-config.php"]
then
    wp core download
    chown -R root:root /var/www/html/wordpress
    wp core config --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD
    wp core install --url=$DOMAIN_NAME --title="yelousse blog" --admin_user="odyn" --admin_password="valhalla" --admin_email="odyn@gmail.com"
    wp user create yelousse yelousse@gmail.com --user_pass="Yelousse123"
fi
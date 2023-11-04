#!/bin/bash

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

if [ ! -f "/var/www/html/wp-config.php" ];
then
    wp core download --allow-root
    wp core config --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title="yelousse blog" --admin_user="odyn" --admin_password="valhalla" --admin_email="odyn@gmail.com" --allow-root
    wp user create yelousse yelousse@gmail.com --user_pass="Yelousse123" --allow-root
fi
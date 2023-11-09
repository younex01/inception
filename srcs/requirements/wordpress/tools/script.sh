#!/bin/bash

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
chown -R www-data:www-data /var/www/html/

if [ ! -f "/var/www/html/wp-config.php" ];
then
    wp core download --allow-root
    wp core config --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title="yelousse blog" --admin_user=$WP_ROOT --admin_password=$WP_ROOT_PASSWORD --admin_email=$WP_ROOT_EMAIL --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_PASSWORD --allow-root
fi

php-fpm8.2 -F
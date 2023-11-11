#!/bin/bash
mkdir -p /run/php/php7.4-fpm
sed -i 's@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf

if [ ! -f "/var/www/html/wp-config.php" ];
then
    wp core download --allow-root
    wp core config --dbname=$MARIA_DB --dbuser=$MARIA_USER --dbpass=$MARIA_PASSWORD --dbhost=$MARIA_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title="yelousse blog" --admin_user=$WP_ROOT --admin_password=$WP_ROOT_PASSWORD --admin_email=$WP_ROOT_EMAIL --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_PASSWORD --allow-root
fi

php-fpm7.4 -F
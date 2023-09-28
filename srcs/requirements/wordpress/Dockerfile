FROM debian:bookworm

RUN apt-get update && apt-get upgrade

RUN apt-get -y install wget

RUN apt-get install -y php\
						php-fpm\
						php-mysql\
						mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html

RUN cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# RUN wp config create --dbname=db --dbuser=yelousse --dbpass=toor --dbhost=mariadb::3306 --dbprefix=wp_
# RUN wp core install --url=yelousse.42.fr --title="INCEPTION" --admin_user=youness --admin_password=youness123 --admin_email=admin@example.com 
# RUN wp user create john john@example.com --role=editor --user_pass=john123

CMD ["cat"]

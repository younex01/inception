FROM debian:bullseye

RUN apt-get update && apt-get upgrade

RUN apt-get install wget -y
RUN apt-get install php -y
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY /tools/script.sh /home/

RUN chmod +x /home/script.sh

WORKDIR /var/www/html

CMD ["/home/script.sh"]
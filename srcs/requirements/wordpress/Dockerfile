FROM debian:bookworm

RUN apt-get update && apt-get upgrade

RUN apt-get -y install wget

RUN apt-get install -y php\
						php-fpm\
						php-mysql\
						mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY /tools/script.sh /home/

WORKDIR /var/www/html

CMD ["./home/script.sh"]

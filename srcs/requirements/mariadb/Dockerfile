FROM debian:bullseye

RUN apt-get update

RUN	apt-get install mariadb-server -y

COPY tools/script.sh /home

RUN	chmod 777 /home/script.sh

CMD ["/home/script.sh"]
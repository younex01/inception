FROM debian:bullseye

RUN apt update

RUN	apt install mariadb-server -y

COPY tools/script.sh /home

RUN	chmod 777 /home/script.sh

CMD ["/home/script.sh"]
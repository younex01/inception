FROM debian:bullseye

ENV MARIA_ROOT_PASSWORD=root123@
ENV MARIA_USER=yelousse
ENV MARIA_PASSWORD=root
ENV MARIA_DB=data
ENV MARIA_HOST=mariadb

RUN apt-get update

RUN	apt install mariadb-server -y

COPY tools/script.sh /home

RUN	chmod 777 /home/script.sh

CMD ["/home/script.sh"]
FROM debian:bookworm

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=yelousse
ENV MYSQL_PASSWORD=toor

RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

EXPOSE 3306

CMD ["mysqld"]
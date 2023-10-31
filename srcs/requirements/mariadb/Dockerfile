FROM debian:bookworm

# Set environment variables
ENV DOMAIN_NAME=yelousse.42.fr
ENV MYSQL_PASSWORD=root
ENV MYSQL_USER=yelousse
ENV MYSQL_DB=data

RUN apt-get update && apt install -y mariadb-server \
    mariadb-client 

COPY /tools/script.sh /home/

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

CMD ["/home/script.sh"]

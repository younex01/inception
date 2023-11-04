FROM debian:bullseye

RUN apt update && apt install -y mariadb-server 

COPY /tools/script.sh /home

RUN chmod -R 777 /var/lib/mysql

RUN chmod +x /home/script.sh

RUN /home/script.sh

ENTRYPOINT mysqld_safe

FROM debian:bookworm

ENV MYSQL_ROOT_PASSWORD=kali
ENV MYSQL_USER=yelousse
ENV MYSQL_PASSWORD=toor

RUN apt-get update && apt-get install -y mariadb-server mariadb-client && apt-get clean

EXPOSE 3306

RUN service mariadb start && mysql -u root -e "create database db;"
RUN service mariadb start && mysql -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';" 
RUN service mariadb start && mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;" && \
    mysql -e "FLUSH PRIVILEGES;"
RUN service mariadb start && mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

CMD ["cat"]

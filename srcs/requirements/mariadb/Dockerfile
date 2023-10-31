FROM debian:bookworm

RUN apt-get update && apt install mariadb-server -y


COPY /tools/script.sh /home/

CMD ["./home/script.sh"]

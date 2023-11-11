FROM debian:bullseye

RUN apt-get update
RUN apt-get install nginx  -y 
RUN apt-get install openssl -y 

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj "/C=MA/ST=B/L=Khouribga/O=1337/CN=localhost"

COPY /conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
FROM debian:12

RUN apt update && apt install nginx openssl -y

#COPY index.html /var/www/html/
COPY nginx-custom.conf /etc/nginx/conf.d/
COPY start.sh /

CMD ["/start.sh"]


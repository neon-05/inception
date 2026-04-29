FROM debian:12

RUN apt upgrade -y && apt install nginx -y && apt install openssl -y

COPY start.sh /

CMD ["/start.sh"]

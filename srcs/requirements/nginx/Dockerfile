FROM debian:12

RUN apt update && apt install openssl nginx -y

COPY server.conf www start.sh /

CMD ["/start.sh"]

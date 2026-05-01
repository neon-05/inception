FROM debian:12

RUN apt update -y && apt install openssl nginx -y

COPY server.conf /
COPY www /
COPY start.sh /

CMD ["/start.sh"]

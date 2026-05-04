FROM debian:12

RUN apt update && apt install mariadb -y

COPY start.sh /

RUN ["/start.sh"]

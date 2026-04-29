FROM debian:12

RUN apt update -y && apt install mariadb server -y

COPY satrt.sh /

RUN ["/start.sh"]

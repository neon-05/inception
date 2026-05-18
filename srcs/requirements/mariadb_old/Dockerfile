FROM debian:12

RUN apt update && apt install mariadb-server -y

COPY start_mariadb.sh /
COPY my.cnf /etc/mysql/mariadb.conf.d/

CMD ["/start_mariadb.sh"]

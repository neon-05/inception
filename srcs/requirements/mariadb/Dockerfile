FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["mysqld"]
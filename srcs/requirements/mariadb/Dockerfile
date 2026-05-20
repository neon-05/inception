FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY start_mariadb.sh /

RUN chmod +x /start_mariadb.sh

ENTRYPOINT ["/start_mariadb.sh"]

FROM debian:12

RUN apt update && apt install php-fpm php-mysql curl -y

COPY start_wordpress.sh /
COPY wp-config.php /
COPY www.conf /etc/php/8.2/fpm/pool.d/

CMD ["/start_wordpress.sh"]

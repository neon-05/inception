FROM debian:12

RUN apt update && apt install php-fpm php-mysql curl -y

COPY start_wordpress.sh /
COPY wp-config.php /var/www/html

CMD ["/start_wordpress.sh"]

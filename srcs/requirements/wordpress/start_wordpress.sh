#!/bin/bash
echo wordpress startup

cd /var/www/html/

until mysqladmin ping -h"mariadb" --silent; do
	sleep 1
done

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php
sed -i "s/username_here/wpuser/" /var/www/html/wp-config.php
sed -i "s/password_here/wppassword/" /var/www/html/wp-config.php
sed -i "s/localhost/mariadb/" /var/www/html/wp-config.php

wp core install \
	--url=$DOMAIN_NAME/ \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USR \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EML \
	--skip-emal --allow-root

wp user create $WP_USR $WP_EML --role=author --user_pass=$WP_PWD --allow-root

wp theme install astra --activate --allow-root

wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root

wp redis enable --allow-root

php-fpm8.2 -F

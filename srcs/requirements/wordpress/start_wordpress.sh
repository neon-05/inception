#!/bin/bash
echo wordpress startup

cd /var/www/html/

if [ ! -f /var/www/html/.init ]; then
	touch /var/www/html/.init
	echo Wordpress Init

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root
	cp /wp-config.php ./
	wp core install \
		--url=$DOMAIN_NAME/ \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PWD \
		--admin_email=$WP_ADMIN_EML \
		--allow-root

	wp user create $WP_USR $WP_EML --role=author --user_pass=$WP_PWD --allow-root
fi

echo "Wordpress done"
php-fpm8.2 -F

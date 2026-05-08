#!/bin/bash
echo mariadb startup


mysqld_safe --datadir=/var/lib/mysql &

until mysqladmin ping --silent; do
	sleep 1
done

if [! -d "/var/lib/mysql/$db_name"]; then
	echo "DB Init"
	mysql -u root << EOF
CREATE DATABASE IF NOT EXTISTS \`$db_name\`;
CREATE USER IF NOT EXISTS \`$db_usr\`@'%' IDENTIFIED BY '$db_pwd';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO \`$db_usr\`@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_rpwd';
FLUSH PRIVILEGES;
EOF
else
	echo "skip DB Init"
fi
mysqladmin -u root -p$db_rpwd shutdown

mysqld_safe


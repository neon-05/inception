#!/bin/bash
set -e

if [ ! -f "/var/lib/mysql/.init" ]; then
	touch /var/lib/mysql/.init
	echo "Initializing MariaDB"

	mariadb-install-db --user=mysql --ldata=/var/lib/mysql

	mysqld --user=mysql &
	pid="$!"

	echo "Waiting for MariaDB to start"

	until mariadb-admin ping --silent; do
		sleep 1
	done

	echo "Running initialization SQL"

	echo "CREATE DATABASE $DB_NAME;" > init.sql
	echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> init.sql
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> init.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOTPASS';" >> init.sql
	echo "FLUSH PRIVILEGES;" >> init.sql
	
	cat init.sql
	mariadb < init.sql

	echo "Stopping temporary server"

	mariadb-admin -uroot -p"$DB_ROOTPASS" shutdown
else
	echo "MariaDB already configured"
fi

echo "Starting MariaDB"

sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
exec mysqld --user=mysql

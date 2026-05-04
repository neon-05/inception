#!/bin/bash
echo nginx startup

openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CH/ST=VD/L=Lausanne/O=42/CN=ylabussi.42.fr/UID=ylabussi/"

nginx -g "daemon off;"

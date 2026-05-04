#!/bin/bash
echo "hello world"
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /selfsigned.key -out /selfsigned.crt -subj "/C=SW/O=42/OU=student/CN=ylabussi.42.fr)"


nginx -c /server.conf;


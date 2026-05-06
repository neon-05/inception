#!/bin/bash
echo nginx startup

openssl req -x509 -nodes -out /inception.crt -keyout /inception.key -subj "/C=CH/ST=VD/L=Lausanne/O=42/CN=ylabussi.42.fr/UID=ylabussi/"

nginx -g "daemon off;"

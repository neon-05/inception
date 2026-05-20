COMPOSE = srcs/docker-compose.yml

up down stop:
	docker compose -f $(COMPOSE) $@

rm:
	docker rm nginx wordpress mariadb

rmi: 
	docker rmi srcs-nginx:latest srcs-wordpress:latest srcs-mariadb:latest

rmv:
	docker volume rm wordpress mariadb

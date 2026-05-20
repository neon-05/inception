*This project has been create as part of the 42 curriculum by ylabussi*

# Description

This project aims at creating a small wordpress server with docker. It consists of three containers working on two volumes in a network.

Docker containers are similar in many ways to virtual machines. however there are some important differences, one of the most important being: a virtual machine contains an entire operating system, docker containers only include basic features.

Secrets are files passed to docker compose by `docker-compose.yml` that get added to containers at `/run/secrets/`. environment variables are values (usually in key-value pairs) that can be accessed by any process running as a child of the current process (for examlpe, defining an environment variable in a shell instance makes programs run by that shell able to get those variables).

A Docker network is what a local network is to a physical machine reported to a docker containers. only difference is: there can only be 65535 ports in contact with the outside (limited to the host machine's ports).

Docker volumes are ways to store a container's contents permanently (otherwise, everything would be deleted when stopping the container).

A bind mount maps a part of the host machine's filesystem to a part of the container's filesystem. everything in the mapped folders stored by the container will persist after the container is stopped.

In the inception network, there are three containers:
- one for mariadb, with its own volume
- one for wordpress, with its volume
- one with nginx, which has access to wordpress' volume

only port exposed is for nginx (443:443)

# instructions

*make is required to start this project*

- build and start:	`make up`
- stop:				`make stop`
- remove containers:	`make rm`
- remove images:		`make rmi`
- remove volumes:		`make rmv`

# resources

- chatGPT was used for the mariadb container
- [docker compose doc](https://docs.docker.com/reference/cli/docker/compose/)

# Set up the project
- clone the repository in `~/`
- add the line `127.0.0.1 ylabussi.42.fr` in `/etc/hosts`
# Build and launch
`make up` to build and launch
# Manage containers and volumes
- `docker ps` - list all running containers
- `docker volume ls` - list all volumes
# Project contents
everything needed to configure the project in contained in this repo.

persistent data is managed by docker
FILE = srcs/docker-compose.yml

up:
	sudo docker compose -f $(FILE) up --build

build:
	sudo docker compose -f $(FILE) build --no-cache

down:
	sudo docker compose -f $(FILE) down

prune:
	sudo docker system prune -a

fdown: down
	sudo docker compose -f $(FILE) down --volumes
	sudo rm -rf /home/yelousse/data/wp/*
	sudo rm -rf /home/yelousse/data/db/*
	# sudo docker rmi -f $(docker images -qa)
	# sudo docker volume rm $(docker volume ls -q)
	# sudo docker volume rm srcs_db
	# sudo docker volume rm srcs_wp


re:	fdown prune up

maria:
	sudo docker compose -f $(FILE) up mariadb --build

nginx:
	sudo docker compose -f $(FILE) up nginx --build

wordpress:
	sudo docker compose -f $(FILE) up wordpress --build

.PHONY: up down fdown re prune nginx wordpress maria
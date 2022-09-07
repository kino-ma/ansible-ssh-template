DOCKER_COMPOSE := docker-compose
DOCKER_COMPOSE_RUN := $(DOCKER_COMPOSE) run --rm app

.PHONY: all build-container run encrypt

all: id_ed25519 encrypt run

id_rsa:
	$(DOCKER_COMPOSE_RUN) ssh-keygen -t rsa -b 4096 -f "./$@"

id_ed25519:
	$(DOCKER_COMPOSE_RUN) ssh-keygen -t ed25519 -f "./$@"

build-container:
	$(DOCKER_COMPOSE) build

run:
	$(DOCKER_COMPOSE_RUN) pipenv run start

encrypt:
	$(DOCKER_COMPOSE_RUN) pipenv run encrypt
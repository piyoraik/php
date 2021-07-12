restart:
	docker compose down; \
	docker compose build; \
	docker compose up -d

build:
	docker compose build --no-cache

exec:
	docker exec -it php bash

logs:
	docker logs php

up:
	docker compose up -d

down:
	docker compose down

create:
	docker compose run --rm php composer create-project laravel/laravel ${app}
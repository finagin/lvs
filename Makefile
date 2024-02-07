LVS_SENTRY_USERNAME ?= 'sentry'
LVS_SENTRY_PASSWORD ?= 'sentry'

force: remove up

up: sentry-upgrade sentry-create-user
	@docker-compose up -d --build --force-recreate --remove-orphans

down:
	@docker-compose down

remove:
	@docker-compose down -v

bash:
	@docker-compose exec traefik sh

sentry-upgrade:
	@docker-compose run --rm sentry upgrade --noinput --traceback --verbosity 0

sentry-key-gen:
	@docker-compose run --rm sentry config generate-secret-key

sentry-create-user:
	@docker-compose run --rm sentry createuser \
		--email $(LVS_SENTRY_USERNAME) \
		--password $(LVS_SENTRY_PASSWORD) \
		--no-superuser --no-input

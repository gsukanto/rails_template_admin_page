# BUILD_NUM ?= 1
GIT_SHORT_SHA := $(shell git log -1 --format="%h")

build_docker:
	# Build the image.
	docker build --no-cache -t=rails_template_admin_page .
	docker build -t=rails_template_admin_page:$(GIT_SHORT_SHA) .

run_docker:
	docker run -it -p 3000:3000 rails_template_admin_page:latest rails server -b 0.0.0.0

build_docker_compose:
	docker-compose build --no-cache rails_template_admin_page

up_docker_compose:
	docker-compose up

seed_docker_compose:
	docker-compose exec postgres psql -U postgres --command "CREATE USER rails_template_admin_page WITH SUPERUSER;"
	docker-compose run rails_template_admin_page rake db:create
	docker-compose run rails_template_admin_page rake db:migrate
	docker-compose run rails_template_admin_page rake db:seed

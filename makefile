# BUILD_NUM ?= 1
GIT_SHORT_SHA := $(shell git log -1 --format="%h")

build_docker:
    # Build the image.
    docker build --no-cache -t=rails_template_admin_page .
    docker build -t=rails_template_admin_page:$(GIT_SHORT_SHA) .

run_docker:
    docker run -it -p 3000:3000 rails_template_admin_page:latest
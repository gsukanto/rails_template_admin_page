# **Rails Admin Page Template**

Admin page template using Ruby on Rails. This template support model management, role management, and authorization management.

This repository is just for fun project.

## Pages

This project have some pages.

| Page | Description |
|-----|--------------|
| /admin | Model management. |
| /users/sign_in | Login page/API. |
| /users/sign_out | Logout (API only). |
| /users/password | Create, Update, Delete password. |
| /users/cancel | Cancel user registration. |
| /users/sign_up | Register through web page. |

## Setup

Install nodejs for execjs for minify asset.

```bash
sudo apt-get install nodejs
```

Install gem dependencies

```bash
bundle install
```

Create postgres database

```bash
rake db:create
```

Migrate tables

```bash
rake db:migrate
```

Add seed datas

```bash
rake db:seed
```

To run this repository on local

```bash
rails s -b 0.0.0.0
```

- Runs the app server on `http://localhost:3000`
- Open admin page on `http://localhost:3000/admin`
- Sign up page on `http://localhost:3000/users/sign_in`
- Sign in page on `http://localhost:3000/users/sign_up`

## Commands

The following commands are useful when working with this repo:

| Command | Usage |
|---------|-------|
| `make build_docker` | Builds `rails_template_admin_page:latest`, also created an image with the current short git SHA. |
| `make run_docker` | Runs single docker. |
| `make build_docker_compose` | Build docker compose. |
| `make up_docker_compose` | Run docker compose on port 80. |
| `make seed_docker_compose` | Create database role, create database, create tables, and add seed datas. |

## Application Structure

```
.
├── Dockerfile
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app
│   ├── assets
│   │   ├── images
│   │   ├── javascripts
│   │   │   └── application.js
│   │   └── stylesheets
│   │       └── application.css
│   ├── controllers
│   │   ├── application_controller.rb
│   │   └── concerns
│   ├── helpers
│   │   └── application_helper.rb
│   ├── mailers
│   ├── models
│   │   ├── ability.rb
│   │   ├── concerns
│   │   ├── role.rb
│   │   └── user.rb
│   └── views
│       └── layouts
│           └── application.html.erb
├── bin
│   ├── bundle
│   ├── rails
│   ├── rake
│   ├── setup
│   └── spring
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── database.yml
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── assets.rb
│   │   ├── backtrace_silencers.rb
│   │   ├── cookies_serializer.rb
│   │   ├── devise.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   ├── rails_admin.rb
│   │   ├── rolify.rb
│   │   ├── session_store.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   ├── devise.en.yml
│   │   └── en.yml
│   ├── routes.rb
│   └── secrets.yml
├── config.ru
├── db
│   ├── migrate
│   │   ├── 20170407034248_devise_create_users.rb
│   │   └── 20170407034257_rolify_create_roles.rb
│   ├── schema.rb
│   └── seeds.rb
├── docker-compose.yml
├── lib
│   ├── assets
│   └── tasks
├── log
│   └── development.log
├── makefile
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── favicon.ico
│   └── robots.txt
└── test
│   ├── controllers
│   ├── fixtures
│   │   ├── roles.yml
│   │   └── users.yml
│   ├── helpers
│   ├── integration
│   ├── mailers
│   ├── models
│   │   ├── role_test.rb
│   │   └── user_test.rb
│   └── test_helper.rb
```

## Environment

To run the server, create `.env` file for passing (secret) configuration.

```bash
DB_NAME=
DB_HOST=
DB_PORT=
DB_USERNAME=
DB_PASSWORD=
```

## Coding Guidelines

- **Requirement**: Read [Clean Code](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)
- **Pull Requests**: Make sure the code works. Assume the reviewer is dumb.
- **Business Logic**: If writing a fair amount of business logic that should be unit tested, you should write the code in a modular way that can easily be unit tested.
- **KISS**: always Keep It Simple Stupid
- **Functional Programming**: High order function, atomic (or Singleton),  single responsibility principle, pure function, encapsulation, immutable
- **Avoid class**: I hate class.
- **100x30**: 100 length maximum, with 30 line maximum (should be able to read from my Atom with 14 pt font and normal theme without scrolling)

FROM ruby:2.3.3-alpine
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libcurl3-dev
RUN mkdir /rails_template_admin_page
WORKDIR /rails_template_admin_page
ADD . /rails_template_admin_page
RUN bundle install
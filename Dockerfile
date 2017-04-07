# Base the image on the super lean and clean Alpine distro
FROM ruby:2.3.3-alpine

# Install essential package
RUN apk add --update --virtual build_deps build-base libc-dev openssl-dev postgresql-dev ruby-dev linux-headers \
    libxml2-dev libxslt-dev nodejs

# Create a non-root user to run the service as. Set that user for the image.
RUN addgroup -S rails_template_admin_page && adduser -S -g rails_template_admin_page rails_template_admin_page

# Set a sensible server directory.
WORKDIR /home/rails_template_admin_page

# Copy code if it's not exist
ADD . /home/rails_template_admin_page

# Change owner for permission
RUN chown -R rails_template_admin_page:rails_template_admin_page /home/rails_template_admin_page

# Change user. Please do not use root
USER rails_template_admin_page

# Install gem dependencies
RUN bundle install

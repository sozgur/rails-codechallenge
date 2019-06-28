FROM ruby:2.6.1-slim

RUN apt-get update && apt-get install -y curl gnupg
RUN echo "deb http://apt.thoughtbot.com/debian/ stable main" | tee /etc/apt/sources.list.d/thoughtbot.list
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN curl -q https://apt.thoughtbot.com/thoughtbot.gpg.key -k | apt-key add -
RUN curl -q https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get install apt-transport-https -y

RUN apt-get -y update && \
      apt-get install --fix-missing --no-install-recommends -qq -y \
        build-essential \
        locales-all \
        vim \
        wget gnupg \
        git-all \
        curl \
        ssh \
        parity \
        postgresql-client-10 imagemagick libmagickwand-dev libgeos-dev libpq-dev && \
      wget -qO- https://deb.nodesource.com/setup_10.x  | bash - && \
      apt-get install -y nodejs && \
      apt-get update && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo "export LANG=en_US.UTF-8" >> /etc/profile
ENV LANG en_US.UTF-8
RUN gem install bundler
#Install gems
RUN mkdir /gems
WORKDIR /gems
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

ARG INSTALL_PATH=/opt/railscodechallenge
ENV INSTALL_PATH $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY . .

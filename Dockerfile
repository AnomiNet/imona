FROM debian:jessie

# Config
# ---
ENV APP_HOME /opt/imona
ENV BUNDLE_JOBS 8
ENV GIT_BRANCH docker2
ENV RAILS_ENV production

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  build-essential \
  # curl \
  git-core \
  libssl-dev \
  ruby ruby-dev \
  zlib1g-dev && \
  gem install bundler

# node for bower
# RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
# RUN apt-get install -y --no-install-recommends \
#   nodejs && \
#   npm install bower -g

WORKDIR $APP_HOME

# Using ADD instead of COPY lets Docker cache bundle install.
ADD Gemfile* $APP_HOME/

RUN bundle install \
  --deployment \
  --without development \
  --without test

# This step invalidates cache
RUN git init && \
  git remote add -t $GIT_BRANCH origin https://github.com/AnomiNet/imona.git && \
  git fetch && \
  git reset --hard origin/$GIT_BRANCH
COPY config/secrets.yml $APP_HOME/secrets.yml

# HACK: For some reason I have to run this again.
RUN bundle install

# HACK: I regret my choice of bower
# To avoid installing nodejs, install it on the dev machine and install there
# then just copy them over.
ADD ./vendor/assets/bower_components $APP_HOME/vendor/assets/bower_components

# Compile Rails assets
RUN bundle exec rake assets:precompile

CMD ["/usr/local/bin/bundle", "exec", "puma"]

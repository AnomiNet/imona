FROM alpine:3.2

# Config
# ---
ENV APP_HOME /opt/imona
ENV BUNDLE_JOBS 8
ENV GIT_BRANCH docker-alpine
# NOTE: if you change env change it at the very bottom CMD
ENV RAILS_ENV production


RUN export RAILS_ENV=$RAILS_ENV

RUN apk add --update ruby ruby-rdoc ruby-irb \
                     ruby-bundler ruby-nokogiri\
                     ruby-tzinfo ruby-rake\
                     ruby-io-console ruby-bigdecimal

# RUN apk add --update postgresql-client imagemagick nodejs

WORKDIR $APP_HOME

# Using ADD instead of COPY lets Docker cache bundle install.
ADD Gemfile* $APP_HOME/

RUN \
  apk add --update \
    g++ \
    git \
    libxml2-dev \
    libxslt-dev \
    make \
    nodejs \
    openssl-dev \
    ruby-dev \
    ruby-io-console \
    zlib-dev

RUN \
  bundle config build.libv8 --with-system-v8 && \
  bundle config build.nokogiri --use-system-libraries && \
  bundle install \
    --deployment \
    --full-index \
    --jobs $BUNDLE_JOBS \
    --without development test

# node for bower
# RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
# RUN apt-get install -y --no-install-recommends \
#   nodejs && \
#   npm install bower -g

# This step invalidates cache
RUN git init && \
  git remote add -t $GIT_BRANCH origin https://github.com/AnomiNet/imona.git && \
  git fetch && \
  git reset --hard origin/$GIT_BRANCH && \
  cp config/secrets.yml.example config/secrets.yml

# RUN \
#   apk del --purge -r g++ make libxml2-dev libxslt-dev zlib-dev git ruby-dev

RUN \
  bundle exec rake bower:install

RUN \
  bundle exec rake assets:precompile

RUN \
  apk del --purge -r \
    g++ \
    git \
    libxml2-dev \
    libxslt-dev \
    make \
    nodejs \
    openssl-dev \
    ruby-dev \
    # ruby-io-console \ For IRB
    zlib-dev

# HACK: I regret my choice of bower
# To avoid installing nodejs, install it on the dev machine and install there
# then just copy them over.
# COPY ./vendor/assets $APP_HOME/vendor/assets

# Compile Rails assets
# RUN bundle exec rake assets:precompile

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/bundle", "exec"]

# NOTE: if you change env change it here too
CMD ["puma", "-p", "80", "-e", "production"]

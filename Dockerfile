FROM alpine:3.2

# Config
# ---
ENV APP_HOME /opt/imona
ENV BUNDLE_JOBS 8
ENV GIT_BRANCH docker-alpine-therubyracer
# NOTE: if you change env change it at the very bottom CMD
ENV RAILS_ENV production
RUN export RAILS_ENV=$RAILS_ENV

# Packages we want to keep.
RUN apk add --update \
  ruby \
  ruby-rdoc \
  ruby-irb \
  ruby-bundler \
  ruby-nokogiri \
  ruby-tzinfo \
  ruby-rake \
  ruby-io-console \
  ruby-bigdecimal

WORKDIR $APP_HOME

# Using ADD instead of COPY lets Docker cache bundle install.
ADD Gemfile* $APP_HOME/

# Install packages required for building, build, then remove them in one step.
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
    zlib-dev && \
  npm install bower -g && \
  bundle config build.libv8 --with-system-v8 && \
  bundle config build.nokogiri --use-system-libraries && \
  bundle install \
    --deployment \
    --full-index \
    --jobs $BUNDLE_JOBS \
    --without development test && \
  git init && \
  git remote add -t $GIT_BRANCH origin https://github.com/AnomiNet/imona.git && \
  git fetch && \
  git reset --hard origin/$GIT_BRANCH && \
  cp config/secrets.yml.example config/secrets.yml && \
  bundle exec rake bower:install['--allow-root --config.interactive=false'] && \
  bundle exec rake assets:precompile && \
  npm uninstall bower -g && \
  apk del --purge -r \
    g++ \
    git \
    libxml2-dev \
    libxslt-dev \
    make \
    nodejs \
    openssl-dev \
    ruby-dev \
    zlib-dev

EXPOSE 80

ENTRYPOINT ["/usr/bin/bundle", "exec"]

# NOTE: if you change env change it here too
CMD ["puma", "-p", "80", "-e", "production"]

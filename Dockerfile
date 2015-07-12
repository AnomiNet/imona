FROM debian:jessie

RUN \
  apt-get update -qq && \
  apt-get install -y --no-install-recommends build-essential curl libssl-dev ruby ruby-dev zlib1g-dev

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y --no-install-recommends nodejs

ENV APP_HOME /imona
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=/bundle \
  BUNDLE_WITHOUT=development:test

RUN gem install bundler

RUN bundle install --local

EXPOSE 9292

CMD ["./run.sh"]

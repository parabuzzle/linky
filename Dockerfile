# This docker file sets up the rails app container
#
# https://docs.docker.com/reference/builder/

#FROM parabuzzle/ruby:2.3.1
FROM ruby:3.0
MAINTAINER Mike Heijmans <parabuzzle@gmail.com>

# Add env variables
ENV PORT 80
ENV APP_HOME /webapp
ENV RAILS_ENV production

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
   apt-transport-https

RUN curl -sL https://dev.nodesource.com/setup_12.x | bash -
# install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
   tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
   nodejs \
   yarn

# switch to the application directory for exec commands
WORKDIR $APP_HOME

# Add the app
ADD . $APP_HOME

RUN gem update bundler

RUN bundle install

RUN rake assets:precompile

# Run the app
CMD SECRET_KEY_BASE=$(rake secret) rails s -b 0.0.0.0 -p $PORT

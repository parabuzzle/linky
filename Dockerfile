# This docker file sets up the rails app container
#
# https://docs.docker.com/reference/builder/

FROM parabuzzle/ruby:2.3.1
MAINTAINER Mike Heijmans <parabuzzle@gmail.com>

# Add env variables
ENV PORT 80
ENV APP_HOME /webapp
ENV RAILS_ENV production

# switch to the application directory for exec commands
WORKDIR $APP_HOME

# Add the app
ADD . $APP_HOME

RUN gem update bundler

RUN bundle install

RUN rake assets:precompile

# Run the app
CMD SECRET_KEY_BASE=$(rake secret) rails s -b 0.0.0.0 -p $PORT

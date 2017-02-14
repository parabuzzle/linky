# This docker file sets up the rails app container
#
# https://docs.docker.com/reference/builder/

FROM parabuzzle/ruby:2.3.1
MAINTAINER Mike Heijmans <parabuzzle@gmail.com>

# Add env variables
ENV PORT 80
ENV APP_HOME /webapp

# switch to the application directory for exec commands
WORKDIR $APP_HOME

# Add the app
ADD . $APP_HOME

RUN gem update bundler

RUN bundle install

# Run the app
CMD rails s -b 0.0.0.0 -p $PORT

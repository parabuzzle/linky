Linky
---

Linky is your friendly internal URL shortener service.

This app is super simple to get up and running and makes managing intranet short links super simple!

# Why Linky?

While I was searching for an open source version of the kinds of intranet URL shorteners that I was used to using at companies around Silicon Valley, I found that there are a ton of URL shorteners out there but all of them are either over complicated or just a "proof of concept". Linky was built to serve as a simple, yet useful, URL shortener for use internally in company based on what I've observed as useful inside large organizations.

![/dashboard.jpg](/dashboard.jpg)

![/param_passing.jpg](/param_passing.jpg)

# Installation

## Requirements

You will need a postgres database to connect to.

## Heroku

Fork the code, push to Heroku.

## Docker

Run the container:

```
docker run -d -p 80:80 -e DB=your_database -e DB_USER=your_user -e DB_PASS=your_pass parabuzzle/linky
```

### Variables

  * DB = hostname for the database
  * DB_USER = the database username
  * DB_PASS = the database password
  * PORT = the application port to listen on

## Setup the Database

You need to create and setup the database on the first run:

```
rake db:create; rake db:migrate
```

or docker:

```
docker run -e DB=your_database -e DB_USER=your_user -e DB_PASS=your_pass parabuzzle/linky rake db:create; rake db:migrate
```

# Params Passing?

Params passing allows you to create fancier URL's by allowing you to specify a special redirect url when something is given after the initial short url.

As an example, let's say we have a short url known as `twsearch` that points to `http://www.twitter.com/search`... ok but then I've got to input my search when I get to the page... what if I could do `http://go/twsearch/mysearch` and it just executed the search? Well with params parsing you can! If I put `http://www.twitter.com/search?q=` in the optional params parsing field for the short url, it will split the `twsearch/mysearch` and pass the `mysearch` at the end of the url which would send you to `http://www.twitter.com/search?q=mysearch` automatically!

This feature is really useful for things like jira where you have a project like `myproject` linked with `myjira` which would send you to the dashboard but if you wanted to go directly to a ticket, you could do `/myjira/TKT-123` which would use the ticket url. The possiblities are endless here!

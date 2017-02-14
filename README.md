Linky
---

Linky is your friendly internal URL shortener service.

This app is super simple to get up and running and makes managing intranet short links super simple!

# Why Linky?

While I was searching for an open source version of the kinds of intranet URL shorteners that I was used to using at companies around Silicon Valley, I found that there are a ton of URL shorteners out there but all of them are either over complicated or just a "proof of concept". Linky was built to serve as a simple, yet useful, URL shortener for use internally in company based on what I've observed as useful inside large organizations.

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

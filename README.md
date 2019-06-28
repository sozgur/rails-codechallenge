# README

## Install docker for Mac (or Linux)

## Build images

`docker-compose build`

## Setup database

`docker-compose run web rake db:drop db:setup`

## Enter web container and possibly run rails console (or if installed rspec)

### First start services
`docker-compose up`

### Enter web container
`docker-compose exec web bash`

### Start rails console
and then you can run

`rails console`

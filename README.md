# Shopware6

## Installation

```bash

$ cp ./src/.env.example ./src/.env

$ docker-compose up -d

$ make setup

```

## Commands
Please run `make build-buddle-js` once before use `hot reload`

- Enable hot reload for storefront : `make watch-storefront`
- Enable hot reload for admin : `make watch-admin`

Note : you can exec to shopware service by `docker exec -it shopware bash` to use CLI commands (bin/console) from shopware

## Usage

- Default : [http://localhost/](http://localhost/)
- Storefront hot reload : [http://localhost:9998/](http://localhost:9998/)
- Admin hot reload : [http://localhost:8888/](http://localhost:8888/)

## TODO (Will update soon...)

- Add `db manger` instance eg. phpmyadmin
- Add `Dockerfile` to build `production` application
- Check every functionality of shopware6 to make sure everything works fine...

## Issues
- Please check and report to me :P

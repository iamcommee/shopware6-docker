# Shopware6

## Installation

```
$ cp ./src/.env.example ./src/.env

$ docker-compose up -d

$ make setup
```

## Customization

There is `.env` in root dir that you can use to build custom image

Example

```
PHP_VERSION=7.4.21
SHOPWARE6_VERSION=master
NODE_VERSION=14
COMPOSER_VERSION=2.1.3
```

- PHP_VERSION : [Check the version and please use only php version for php apache tag](https://hub.docker.com/*/php)
- SHOPWARE6_VERSION : [Check the version from branch](https://github.com/shopware/production)
- NODE_VERSION : [nodejs](https://nodejs.org/en/about/releases/)
- COMPOSER_VERSION : [composer](https://github.com/composer/composer/releases)

or

Modify `Dockerfile` and build it as your own image

## Commands

Please run `make build-buddle-js` once before use `hot reload`

- Enable hot reload for storefront : `make watch-storefront`
- Enable hot reload for admin : `make watch-admin`

Note : you can exec to shopware service example `docker exec -it ... bash` to use CLI commands (bin/console) from shopware

## Usage

- Default : [http://localhost/](http://localhost/)
- DB manager : [http://localhost:8080/](http://localhost:8080/) - root : root_password
- Storefront hot reload : [http://localhost:9998/](http://localhost:9998/)
- Admin hot reload : [http://localhost:8888/](http://localhost:8888/)

## TODO (Will update soon...)

- Add `Dockerfile` to build `production` application

## Issues

- Please check and report to me :P

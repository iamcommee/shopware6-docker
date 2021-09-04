# Shopware6 <img align="right" width="100px" src="https://assets.shopware.com/media/logos/shopware_signet_blue.svg" />

This repo is created to solve performace issue on docker when mount large volume by full accessing all src with Mutagen.

<img align="right" width="100px" src="https://mutagen.io/img/logo_dark.svg" />

## Requirements

- [Mutagen](https://mutagen.io/documentation/introduction)
    - macOS (please use mutagen-beta) : [click](https://mutagen.io/documentation/introduction/installation#development-channels)
    - other platforms : [click](https://mutagen.io/documentation/introduction/installation)

## Installation

Tip : If you already have production template, just create `src` dir then `paste` all files inside.

### First time running

```

$ make setup

```

Note1 : Next time just run `mutagen up -d`

Note2 : To stop container run `mutagen compose stop` or clear everything `mutagen compose down -v`

Note3 : Please use `mutagen compose` instead `docker-compose` commands

## Customization

There is `.env` in root dir that you can use to build custom image

Example

```
PHP_VERSION=7.4.21
SHOPWARE6_VERSION=master
NODE_VERSION=14
COMPOSER_VERSION=2.1.3
```

- PHP_VERSION : [check the version and please use only php version for php apache tag](https://hub.docker.com/*/php)
- SHOPWARE6_VERSION : [check the version from branch](https://github.com/shopware/production)
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

# |--------------------------------------------------------------------------
# | Initial command to auto setup shopware
# |--------------------------------------------------------------------------
setup:
	docker-compose exec shopware make setup

# |--------------------------------------------------------------------------
# | Build all buddle before use hot reload
# |--------------------------------------------------------------------------
build-buddle-js:
	docker-compose exec shopware ./bin/build-js.sh

# |--------------------------------------------------------------------------
# | Hot reload for Storefront
# |--------------------------------------------------------------------------
watch-storefront:
	docker-compose exec shopware ./bin/watch-storefront.sh

# |--------------------------------------------------------------------------
# | Hot reload for Admin
# |--------------------------------------------------------------------------
# |
# | This command might be error when build the image with unstable branch because there is difference command in each shopware version
# | So, please check the error and check it on shopware website
# |
watch-admin:
	docker-compose exec shopware bash -c "APP_URL=http://localhost \
	PROJECT_ROOT=/var/www/html \
	APP_ENV=dev \
	PORT=8888 \
	HOST=0.0.0.0 \
	ENV_FILE=/var/www/html/.env \
	ESLINT_DISABLE=true \
	npm run --prefix /var/www/html/vendor/shopware/administration/Resources/app/administration dev"
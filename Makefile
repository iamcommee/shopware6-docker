setup:
	docker exec -it shopware make setup

build-buddle-js:
	docker exec -it shopware ./bin/build-js.sh

watch-storefront:
	docker exec -it shopware ./bin/watch-storefront.sh

# sometime, it might be error at feature command because there is difference command in each shopware version
watch-admin:
	docker exec -it shopware bash -c "APP_URL=http://localhost \
	PROJECT_ROOT=/var/www/html \
	APP_ENV=dev \
	PORT=8888 \
	HOST=0.0.0.0 \
	ENV_FILE=/var/www/html/.env \
	ESLINT_DISABLE=true \
	npm run --prefix /var/www/html/vendor/shopware/administration/Resources/app/administration dev"
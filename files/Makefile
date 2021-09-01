# |--------------------------------------------------------------------------
# | Setup Shopware
# |--------------------------------------------------------------------------
# |
# | Auto install Shopware (existing config will be removed when use this command)
# |
setup:
	bin/console system:install --create-database --basic-setup --drop-database --force && \
	echo "Removing config/jwt..." && \
	rm -rf ./config/jwt/* && \
	bin/console system:generate-jwt-secret && \
	echo "Update .env" && \
	cp .env .env.tmp && \
	sed -i -r "s/^(APP_SECRET=).*/\1$$(bin/console system:generate-app-secret)/" .env.tmp && \
	sed -i -r "s/^(INSTANCE_ID=).*/\1$$(openssl rand -hex 32)/" .env.tmp && \
	cp .env.tmp .env && rm -rf .env.tmp && \
	echo "Done!"
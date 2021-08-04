# use cp to solve docker can not use sed -i for original file
setup:
	bin/console system:install --create-database --basic-setup && \
	bin/console system:generate-jwt-secret && \
	chown www-data:www-data ./config/jwt/* && \
	cp .env .env.tmp && \
	sed -i -r "s/^(APP_SECRET=).*/\1$$(bin/console system:generate-app-secret)/" .env.tmp && \
	sed -i -r "s/^(INSTANCE_ID=).*/\1$$(openssl rand -hex 32)/" .env.tmp && \
	cp .env.tmp .env
ARG PHP_VERSION=7.4.21
FROM php:${PHP_VERSION}-apache

RUN echo 'root:password' | chpasswd

# install nodejs
ARG NODE_VERSION=14
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash
RUN apt-get install -y nodejs

# install composer
ARG COMPOSER_VERSION=2.1.3
RUN curl -O https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    chmod 755 composer.phar && \
    mv composer.phar /usr/local/bin/composer

# install required pkgs for shopware
RUN apt-get update && apt-get install -y \
    sudo \
    default-mysql-client \
    vim \
    unzip \
    wget \
    git \
    zlib1g \
    libgd-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libicu-dev \
    libzip-dev \ 
    xdg-utils

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install gd \
    intl \
    pdo_mysql \
    zip

# custom php config
ARG PHP_MEMORY_LIMIT=1024M
ENV PHP_MEMORY_LIMIT=$PHP_MEMORY_LIMIT

ARG PHP_UPLOAD_MAX_FILESIZE=128M
ENV PHP_UPLOAD_MAX_FILESIZE=$PHP_UPLOAD_MAX_FILESIZE

COPY ./config/custom-php.ini /usr/local/etc/php/conf.d
COPY ./config/shopware.conf /etc/apache2/sites-available

RUN a2enmod rewrite
RUN a2ensite shopware.conf

# install shopware6
ARG SHOPWARE6_VERSION=master
RUN git clone --branch ${SHOPWARE6_VERSION} https://github.com/shopware/production.git .
RUN chown -R www-data:www-data /var/www/html/ && chmod -R 775 /var/www/html/
RUN composer install

# solution to fix permission issue in custom dir
RUN usermod -u 1000 www-data
ARG PHP_VERSION=7.4.21
FROM php:${PHP_VERSION}-apache

# |--------------------------------------------------------------------------
# | User
# |--------------------------------------------------------------------------
# |
# | Define a default user
# | @todo 1 : Should we allow a default user as sudo ???
# | @todo 2 : Should we allow a default user use sudo without password ???
# |
RUN echo 'root:password' | chpasswd && \
    useradd -p $(openssl rand -hex 32) shopware

# |--------------------------------------------------------------------------
# | NodeJS
# |--------------------------------------------------------------------------
# |
# | Installs NodeJS version 14 because it is suitable for shopware
# | And create dir for default user to access NodeJS
# |
ARG NODE_VERSION=14
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash && \
    apt-get install -y nodejs && \
    mkdir /home/shopware && \
    chown shopware:shopware -R /home/shopware/

# |--------------------------------------------------------------------------
# | Composer
# |--------------------------------------------------------------------------
# |
# | Installs Composer to manage PHP dependencies
# |
ARG COMPOSER_VERSION=2.1.3
RUN curl -O https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    chmod 755 composer.phar && \
    mv composer.phar /usr/local/bin/composer

# |--------------------------------------------------------------------------
# | Required pkgs for shopware
# |--------------------------------------------------------------------------
# |
# | Installs pkgs from shopware system-requirements
# | https://docs.shopware.com/en/shopware-6-en/first-steps/system-requirements
# |
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

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    docker-php-ext-install gd \
    intl \
    pdo_mysql \
    zip

# |--------------------------------------------------------------------------
# | PHP config
# |--------------------------------------------------------------------------
# |
# | Define a PHP config
# |
ARG PHP_MEMORY_LIMIT=1024M
ENV PHP_MEMORY_LIMIT=$PHP_MEMORY_LIMIT
ARG PHP_UPLOAD_MAX_FILESIZE=128M
ENV PHP_UPLOAD_MAX_FILESIZE=$PHP_UPLOAD_MAX_FILESIZE
COPY ./config/custom-php.ini /usr/local/etc/php/conf.d

# |--------------------------------------------------------------------------
# | Apache config
# |--------------------------------------------------------------------------
# |
# | Configure Apache2 Shopware Site
# |
COPY ./config/shopware.conf /etc/apache2/sites-available
RUN a2enmod rewrite && \ 
    a2ensite shopware.conf

# |--------------------------------------------------------------------------
# | Shopware
# |--------------------------------------------------------------------------
# |
# | Installs Shopware
# |
USER shopware
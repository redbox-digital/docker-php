FROM php:7.0-fpm

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libpng12-dev

RUN docker-php-ext-install \
    bcmath \
    gd \
    hash \
    intl \
    json \
    mbstring \
    mcrypt \
    mysqli \
    pdo \
    pdo_mysql

# docker-php-ext-configure \
#     gd \
#       --with-freetype-dir=/usr/include/ \
#       --with-jpeg-dir=/usr/include/

# PhpRedis

RUN mkdir /src/
ADD https://github.com/phpredis/phpredis/archive/php7.tar.gz \
    /src/phpredis.tar.gz

RUN cd /src/ \
    && tar xzf phpredis.tar.gz \
    && cd /src/phpredis-php7 \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf /src/phpredis.tar.gz /src/phpredis-php7

RUN docker-php-ext-enable redis


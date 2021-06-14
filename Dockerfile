FROM php:8.0.0-fpm-buster

RUN apt-get update

RUN apt-get install -y wget libjpeg-dev libfreetype6-dev
RUN apt-get install -y  libmagick++-dev \
  libmagickwand-dev \
  libpq-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libwebp-dev \
  libxpm-dev \
  libgmp-dev

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
      docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install mysqli pdo_mysql gmp

COPY --from=composer /usr/bin/composer /usr/bin/composer

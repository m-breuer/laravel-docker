# Stage 1: Build stage
FROM composer:2 as build

WORKDIR /app

COPY ./ /app

RUN composer install --no-dev --optimize-autoloader


# Stage 2: Final stage
FROM php:8.3-fpm-alpine

WORKDIR /var/www

COPY --from=build /app /var/www

COPY ./production/php.ini /usr/local/etc/php/php.ini

RUN chown -R www-data:www-data /var/www

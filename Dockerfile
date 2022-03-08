FROM php:8.0.3-fpm
RUN usermod -u 1000 www-data


WORKDIR /var/www/html
ADD ./src /var/www/html

COPY ./.env .
RUN link /usr/local/bin/php /usr/bin/php

#RUN chown -R www-data:www-data /var/www/html
#RUN chmod 777 /var/www/html
#RUN chmod 1001 /bitnami/redis/data

# Install Postgre PDO
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql pdo_mysql mysqli && docker-php-ext-enable mysqli

#install redis
#RUN pecl install -o -f redis
#RUN docker-php-ext-enable redis

FROM quay.io/adifarhan/disnaker-l9:1.0

COPY . /var/www/html/

RUN composer require 'phpoption/phpoption'
RUN composer require 'vlucas/phpdotenv'

RUN composer install --prefer-dist --no-interaction

#RUN php saya key

COPY docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

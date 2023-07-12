FROM quay.io/adifarhan/disnaker-l9:1.0

COPY . /var/www/html/

RUN composer require spatie/laravel-permission ^5.10
RUN composer require maatwebsite/excel:^3.1

RUN composer install --prefer-dist --no-interaction

#RUN php saya key

COPY docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf


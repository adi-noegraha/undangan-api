FROM quay.io/adifarhan/disnaker-l9:1.0

COPY . /var/www/html/

RUN composer require spatie/laravel-permission ^5.10
RUN composer require maatwebsite/excel:^3.1

RUN composer install --prefer-dist --no-interaction

COPY docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

#RUN apt update -y
#RUN apt install -y libreoffice

RUN php artisan config:cache && \
    php artisan route:cache && \
    chmod 777 -R /var/www/html/storage/ && \
    chown -R www-data:www-data /var/www/ && \
    a2enmod rewrite

#RUN php composer.phar install && \
#    php artisan key:generate && \
#    php artisan route:clear && \
#    php artisan cache:clear && \
#    php artisan config:clear && \
#    php artisan view:clear

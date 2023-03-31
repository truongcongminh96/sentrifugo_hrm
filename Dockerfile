FROM php:7.1-apache

RUN apt-get update -y && apt-get install -y libpng-dev curl libcurl4-openssl-dev vim zip unzip

#PHP ext
RUN docker-php-ext-install pdo pdo_mysql gd curl

RUN docker-php-ext-configure calendar && docker-php-ext-install calendar

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip

RUN a2enmod rewrite

#COPY . /var/www/html/

#RUN unzip /var/www/html/Sentrifugo.zip -d /var/www/html/
#
#RUN rm -r /var/www/html/Sentrifugo.zip
#
#RUN mv /var/www/html/Sentrifugo_3.2 /var/www/html/sentrifugo

RUN chmod -R ugo+rwx /var/www/html/

EXPOSE 80

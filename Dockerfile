FROM php:7.1-apache

RUN apt-get update -y && apt-get install -y libpng-dev curl libcurl4-openssl-dev vim

RUN docker-php-ext-install pdo pdo_mysql gd curl

RUN a2enmod rewrite

RUN apt-get install zip unzip

COPY . /var/www/html/

#RUN unzip /var/www/html/Sentrifugo.zip -d /var/www/html/
#
#RUN rm -r /var/www/html/Sentrifugo.zip
#
#RUN mv /var/www/html/Sentrifugo_3.2 /var/www/html/sentrifugo

RUN chmod -R ugo+rwx /var/www/html/

EXPOSE 80

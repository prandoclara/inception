FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysqli \
    php-pdo \
    php-mysql \
    curl \
    unzip \
    && apt-get clean

# Supprimer page par défaut Apache
RUN rm -f /var/www/html/index.html

# Télécharger Adminer (avec redirection !)
RUN curl -L -o /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN a2enmod php* rewrite

CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80

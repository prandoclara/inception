FROM debian:bullseye

RUN apt-get update -y && apt-get install -y \
    curl \
    php \
    php-fpm \
    php-mysql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM to listen on 0.0.0.0:8081
RUN sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:8081|' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html/adminer && \
    chown -R www-data:www-data /var/www/html/adminer && \
    chmod -R 755 /var/www/html/adminer

# Create the required PHP runtime directory
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

COPY ./tools/startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

WORKDIR /var/www/html/adminer

EXPOSE 8081

ENTRYPOINT [ "/usr/local/bin/startup.sh" ]
CMD [ "php-fpm7.4", "-F" ]
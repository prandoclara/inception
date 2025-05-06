FROM debian:bullseye

RUN apt-get update -y && apt-get install -y \
    curl \
    php \
    php-fpm \
    php-mysql \
    php-redis && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf

# Set up Adminer directory
RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress && \
    chmod -R 755 /var/www/wordpress

# Create the required PHP runtime directory
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

COPY ./wp_conf.sh /usr/local/bin/wp_conf.sh
RUN chmod +x /usr/local/bin/wp_conf.sh

WORKDIR /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/wp_conf.sh" ]
CMD [ "php-fpm7.4", "-F" ]
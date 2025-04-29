FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && apt-get install -y \
    curl \
    php \
    php-fpm \
    php-mysql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf

# Set up Adminer directory
RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress && \
    chmod -R 755 /var/www/wordpress

# Create the required PHP runtime directory
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

# Copy the startup script
COPY ./wp_conf.sh /usr/local/bin/wp_conf.sh
RUN chmod +x /usr/local/bin/wp_conf.sh

# Set the working directory
WORKDIR /var/www/wordpress

# Expose the application port
EXPOSE 9000

# Define the container startup process
ENTRYPOINT [ "/usr/local/bin/wp_conf.sh" ]
CMD [ "php-fpm7.4", "-F" ]
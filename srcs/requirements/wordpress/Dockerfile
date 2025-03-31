FROM debian:bullseye

# Update and install required dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    lsb-release \
    ca-certificates \
    curl \
    sudo \
    gnupg2

# Add PHP repository
RUN curl -sS https://packages.sury.org/php/README.txt | bash -x
RUN apt-get update && apt-get install -y php7.4-fpm

RUN apt-get update

# Install PHP and related extensions
RUN apt-get install -y \
    php8.0-fpm \
    php8.0-mysql \
    php8.0-mbstring \
    php8.0-xml \
    mariadb-client

# Continue with the rest of your setup as usual
RUN mkdir -p /var/www/wordpress

COPY ./wp_conf.sh /

RUN chmod +x /wp_conf.sh

ENTRYPOINT ["./wp_conf.sh"]

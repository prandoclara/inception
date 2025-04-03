FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    curl \
    sudo \
    gnupg2

RUN curl -sS https://packages.sury.org/php/README.txt | bash -x

RUN apt-get update && apt-get install -y \
    php8.0-fpm \
    php8.0-mysql \
    php8.0-mbstring \
    php8.0-xml \
    php8.0-mysqli \
    mariadb-client

RUN mkdir -p /var/www/wordpress

COPY ./wp_conf.sh /

RUN chmod +x /wp_conf.sh

ENTRYPOINT ["./wp_conf.sh"]

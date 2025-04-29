#!/bin/bash

set -e

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    cd /var/www/wordpress
    chmod -R 755 .
    chown -R www-data:www-data .

    wp core download --allow-root

    wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root

    wp core install \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_N" \
        --admin_password="$WP_ADMIN_P" \
        --admin_email="$WP_ADMIN_E" \
        --allow-root

    wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root

    wp plugin install redis-cache --activate --allow-root
else
    echo "WordPress déjà installé."
fi

mkdir -p /run/php

# Démarrer PHP-FPM 7.4 au premier plan
exec /usr/sbin/php-fpm7.4 -F

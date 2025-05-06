#!/bin/bash
set -e
WP_DIR="/var/www/wordpress"

if [ ! -f "$WP_DIR/wp-config.php" ]; then
    echo "📦 Installation de WordPress..."
    wp core download --path="$WP_DIR" --allow-root
    
    wp config create \
        --path="$WP_DIR" \
        --dbname="$MYSQL_DB" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --allow-root
    
    wp core install \
        --path="$WP_DIR" \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_N" \
        --admin_password="$WP_ADMIN_P" \
        --admin_email="$WP_ADMIN_E" \
        --allow-root
    
    wp user create "$WP_U_NAME" "$WP_U_EMAIL" \
        --user_pass="$WP_U_PASS" \
        --role="$WP_U_ROLE" \
        --path="$WP_DIR" \
        --allow-root
    
    # Installation et configuration de Redis
    wp plugin install redis-cache --activate --allow-root
    
    # Configuration Redis
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    wp config set WP_REDIS_CLIENT phpredis --allow-root
    
    wp redis enable --allow-root
else
    echo "✅ WordPress déjà installé"
    
    # Assurer que Redis est correctement configuré
    if ! grep -q "WP_REDIS_HOST" "$WP_DIR/wp-config.php"; then
        wp config set WP_REDIS_HOST redis --allow-root
        wp config set WP_REDIS_PORT 6379 --allow-root
        wp config set WP_REDIS_CLIENT phpredis --allow-root
    fi
    
    # Activer le plugin Redis si nécessaire
    if ! wp plugin is-active redis-cache --allow-root; then
        wp plugin install redis-cache --activate --allow-root
        wp redis enable --allow-root
    fi
fi

# Vérifier rapidement la connexion Redis
if redis-cli -h redis ping > /dev/null 2>&1; then
    echo "✅ Redis connecté"
fi

mkdir -p /run/php
exec /usr/sbin/php-fpm7.4 -F
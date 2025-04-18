#!/bin/bash
set -e

# Vérifier que les variables d'environnement requises sont définies
if [ -z "$MYSQL_DB" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    echo "Erreur: Variables d'environnement manquantes"
    echo "MYSQL_DB, MYSQL_USER, MYSQL_PASSWORD et MYSQL_ROOT_PASSWORD sont requises"
    exit 1
fi

# Set MySQL directory permissions
mkdir -p /var/run/mysqld
chmod 777 /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Initialize DB if empty
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initialisation de la base de données..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Démarrer temporairement MariaDB sans contrôle d'accès
mysqld --skip-grant-tables --user=mysql --skip-networking &
PID=$!

# Attendre que le serveur soit prêt
echo "Attente du démarrage du serveur..."
for i in {1..30}; do
    if mysqladmin ping &>/dev/null; then
        break
    fi
    sleep 1
done

# Configurer la base de données
echo "Configuration de la base de données..."
mysql -u root <<-EOSQL
    FLUSH PRIVILEGES;
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;
    CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_USER}\`@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOSQL

# Arrêter le serveur temporaire
echo "Arrêt du serveur temporaire..."
kill $PID
wait $PID || true

# Démarrer MariaDB normalement
echo "Démarrage de MariaDB..."
exec mysqld_safe --user=mysql --bind-address=0.0.0.0
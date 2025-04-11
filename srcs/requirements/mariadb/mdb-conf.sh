#!/bin/bash
# Configure mysql directory permissions
mkdir -p /var/run/mysqld
chmod 777 /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Initialize database if not exists
if [ ! -d "/var/lib/mysql/mysql" ]; then
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB server in the background
mysqld --user=mysql &

# Wait for the MariaDB server to be available
for i in {1..30}; do
  if mysqladmin ping >/dev/null 2>&1; then
    break
  fi
  echo "Waiting for MariaDB to be ready... ($i/30)"
  sleep 1
done

# Configure the database
if [ $i -lt 30 ]; then
  # Database configuration
  mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
  mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
  mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_USER}\`@'%';"
  mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
  mysql -e "FLUSH PRIVILEGES;"
  
  # Shutdown the temporary server
  mysqladmin shutdown
else
  echo "Failed to connect to MariaDB server"
  exit 1
fi

# Start MariaDB in foreground mode
echo "Starting MariaDB server..."
exec mysqld_safe --user=mysql --bind-address=0.0.0.0
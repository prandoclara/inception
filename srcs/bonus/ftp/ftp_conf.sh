#!/bin/bash

# Créer l’utilisateur ftpuser s’il n’existe pas déjà
if ! id ftpuser >/dev/null 2>&1; then
  echo "👤 Création de l'utilisateur ftpuser..."
  useradd -m ftpuser -d /var/www/wordpress
  echo "ftpuser:ftppassword" | chpasswd
fi

mkdir -p /var/run/vsftpd/empty

# Donner les bons droits
chown -R ftpuser:ftpuser /var/www/wordpress

rm -f /var/run/vsftpd/vsftpd.pid

# Lancer vsftpd
echo "🚀 Démarrage de vsftpd..."
exec /usr/sbin/vsftpd /etc/vsftpd.conf

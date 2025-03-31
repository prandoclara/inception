# Utiliser l'image officielle de Nginx
FROM nginx:latest

# Créer un répertoire pour les certificats SSL
RUN mkdir -p /etc/nginx/ssl

# Générer un certificat SSL auto-signé (pour un usage en développement)
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=42/CN=domain_name.fr/UID=admin_name"

# Copier la configuration Nginx personnalisée
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/snippets/

COPY ./fastcgi-php.conf /etc/nginx/snippets/

# Exposer les ports nécessaires
EXPOSE 443 80

# Lancer nginx en mode non-daemon
CMD ["nginx", "-g", "daemon off;"]

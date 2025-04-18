FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server netcat

# Set proper permissions
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

COPY ./mdb-conf.sh /mdb-conf.sh
RUN chmod +x /mdb-conf.sh

# Définir des valeurs par défaut pour les variables d'environnement
ENV MYSQL_DB=wordpress \
    MYSQL_USER=wpuser \
    MYSQL_PASSWORD=wppassword \
    MYSQL_ROOT_PASSWORD=rootpassword

EXPOSE 3306

ENTRYPOINT ["/mdb-conf.sh"]
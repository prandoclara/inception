FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    redis-server \
    redis-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY redis.conf /etc/redis/redis.conf

# Créer et configurer le répertoire de données
RUN mkdir -p /var/lib/redis \
    && chown -R redis:redis /var/lib/redis \
    && chmod 777 /var/lib/redis

RUN chown -R redis:redis /etc/redis \
    && chmod 644 /etc/redis/redis.conf

EXPOSE 6379

USER redis

CMD ["redis-server", "/etc/redis/redis.conf"]
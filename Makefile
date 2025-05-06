# Makefile pour Inception - Docker Compose

COMPOSE_FILE = ./srcs/docker-compose.yml
DATA_DIR = $(HOME)/data
MARIADB_DATA_DIR = $(DATA_DIR)/mariadb
WORDPRESS_DATA_DIR = $(DATA_DIR)/wordpress
GRAFANA_DATA_DIR = $(DATA_DIR)/grafana


all: up

# Démarrer les services Docker Compose
up:
	sudo mkdir -p $(MARIADB_DATA_DIR) $(WORDPRESS_DATA_DIR) $(GRAFANA_DATA_DIR)
	docker compose -f $(COMPOSE_FILE) up -d --build

# Arrêter et supprimer les services Docker Compose + supprimer les volumes
down:
	docker compose -f $(COMPOSE_FILE) down -v

# Démarrer les services Docker Compose déjà arrêtés
start:
	docker compose -f $(COMPOSE_FILE) start

# Arrêter les services Docker Compose
stop:
	docker compose -f $(COMPOSE_FILE) stop

# Redémarrer les services Docker Compose
restart:
	$(MAKE) down
	$(MAKE) up

# Afficher les logs de tous les services
logs:
	docker compose -f $(COMPOSE_FILE) logs -f

# Vérifier l'état des services
status:
	docker compose -f $(COMPOSE_FILE) ps

# Afficher les processus en cours d'exécution dans tous les services
ps:
	@for service in wordpress mariadb nginx redis adminer ftp prometheus node-exporter grafana; do \
	  echo "Processes in $$service:"; \
	  docker compose -f $(COMPOSE_FILE) exec $$service ps aux; \
	  echo "---------------------------------"; \
	done

# Générer un fichier de sortie avec l'arborescence et le contenu des fichiers
out:
	@bash -c '{ tree; find . -type f \( -name ".env" -or ! -path "*/.*" \) -and ! -path "./srcs/bonus/static-website/*" -exec echo "=== {} ===" \; -exec cat {} \; ; } > output.txt'

# Supprimer les conteneurs, volumes et réseaux
clean:
	docker compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	@read -p "Are you sure you want to delete data directories? [y/N] " confirm && [ $${confirm} = "y" ] && sudo rm -rf $(MARIADB_DATA_DIR) $(WORDPRESS_DATA_DIR) $(GRAFANA_DATA_DIR) || echo "Aborted."

# Nettoyage complet : Purger toutes les données Docker après confirmation
fclean:
	@read -p "Are you sure you want to remove all Docker data (containers, images, volumes, caches)? [y/N] " confirm && [ $${confirm} = "y" ] && docker system prune -a --volumes --force || echo "Aborted."

# Commande par défaut : afficher l'aide
help:
	@echo "Commandes disponibles :"
	@echo "  make up          - Démarrer les services Docker Compose"
	@echo "  make down        - Arrêter et supprimer les services Docker Compose"
	@echo "  make start       - Démarrer les services Docker Compose déjà arrêtés"
	@echo "  make stop        - Arrêter les services Docker Compose"
	@echo "  make restart     - Redémarrer les services Docker Compose"
	@echo "  make logs        - Afficher les logs de tous les services"
	@echo "  make status      - Afficher l'état des services"
	@echo "  make ps          - Afficher les processus en cours d'exécution dans tous les services"
	@echo "  make out         - Générer le fichier output.txt avec l'arborescence et le contenu des fichiers"
	@echo "  make clean       - Supprimer les conteneurs, volumes et réseaux"
	@echo "  make fclean      - Nettoyage complet de Docker (conteneurs, images, volumes, caches) après confirmation"

.PHONY: help all up down start stop restart logs status ps out clean fclean

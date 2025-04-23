FROM debian:bullseye

# 1. Installer les dépendances de base
RUN apt-get update && apt-get install -y \
  curl \
  gnupg \
  ca-certificates

# 2. Ajouter le repo officiel Node.js (version 18)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

# 3. Installer Node.js
RUN apt-get install -y nodejs

# 4. Créer dossier pour l'app
RUN mkdir -p /app
WORKDIR /app

# 5. Copier ton projet React/Vite dans le conteneur
COPY ./tools/static_web_pages/ .

# 6. Installer les dépendances et builder le site
RUN npm install
RUN npm run build

# 7. Installer un petit serveur statique pour servir le build
RUN npm install -g serve

# 8. Exposer le port du serveur
EXPOSE 80

# 9. Commande pour lancer le site
CMD ["serve", "-s", "dist", "-l", "80"]

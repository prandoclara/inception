#!/bin/bash
echo "📦 Installation des dépendances..."
npm install

echo "🛠️ Build du site statique..."
exec "$@"

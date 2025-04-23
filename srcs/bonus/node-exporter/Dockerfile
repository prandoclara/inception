FROM debian:bullseye

# Installer curl pour télécharger le binaire
RUN apt-get update && apt-get install -y curl tar && apt-get clean

# Télécharger et extraire node_exporter
RUN curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz \
  && tar -xzf node_exporter-1.8.0.linux-amd64.tar.gz \
  && mv node_exporter-1.8.0.linux-amd64/node_exporter /usr/local/bin/ \
  && rm -rf node_exporter-1.8.0.linux-amd64*

EXPOSE 9100

CMD ["node_exporter"]

FROM debian:bullseye

RUN apt-get update && apt-get install -y gnupg2 curl software-properties-common \
    && curl -fsSL https://packages.grafana.com/gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/grafana.gpg \
    && echo "deb https://packages.grafana.com/oss/deb stable main" > /etc/apt/sources.list.d/grafana.list \
    && apt-get update && apt-get install -y grafana \
    && apt-get clean

COPY grafana.ini /etc/grafana/grafana.ini
COPY provisioning/ /etc/grafana/provisioning/

EXPOSE 3000

CMD ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini"]


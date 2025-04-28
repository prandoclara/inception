FROM debian:bullseye

RUN apt-get update && apt-get install -y curl tar

RUN curl -LO https://github.com/prometheus/prometheus/releases/download/v2.50.1/prometheus-2.50.1.linux-amd64.tar.gz \
  && tar -xzf prometheus-2.50.1.linux-amd64.tar.gz \
  && mv prometheus-2.50.1.linux-amd64 /opt/prometheus \
  && rm prometheus-2.50.1.linux-amd64.tar.gz

COPY prometheus.yml /opt/prometheus/prometheus.yml

WORKDIR /opt/prometheus

EXPOSE 9090

CMD ["./prometheus", "--config.file=prometheus.yml"]

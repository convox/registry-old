FROM registry:0.9.1

RUN apt-get update
RUN apt-get install -y nginx curl

COPY gen-cert /usr/local/bin/gen-cert
COPY config_convox.yml /docker-registry/config/config_convox.yml
COPY nginx.conf /etc/nginx/sites-enabled/registry.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENV DOCKER_REGISTRY_CONFIG /docker-registry/config/config_convox.yml
ENV SETTINGS_FLAVOR local

EXPOSE 443

WORKDIR /docker-registry

CMD ["/docker-entrypoint.sh"]

FROM registry:0.9.1

RUN apt-get update
RUN apt-get install -y nginx curl apache2-utils

COPY gen-cert /usr/local/bin/gen-cert
COPY gen-passwd /usr/local/bin/gen-passwd
COPY config_convox.yml /docker-registry/config/config_convox.yml
COPY docker-registry.conf /etc/nginx/docker-registry.conf
COPY nginx.conf /etc/nginx/sites-enabled/registry.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENV DOCKER_REGISTRY_CONFIG /docker-registry/config/config_convox.yml
ENV SETTINGS_FLAVOR local

EXPOSE 3000
EXPOSE 443

WORKDIR /docker-registry

CMD ["/docker-entrypoint.sh"]

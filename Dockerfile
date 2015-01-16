FROM registry:0.9.1

COPY config_convox.yml /docker-registry/config/config-convox.yml

ENV DOCKER_REGISTRY_CONFIG /docker-registry/config/config_convox.yml
ENV SETTINGS_FLAVOR convox

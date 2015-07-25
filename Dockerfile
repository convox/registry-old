FROM convox/distribution

RUN apt-get -y update
RUN apt-get -y install apache2-utils

COPY bin/gen-cert /usr/local/bin/gen-cert
COPY bin/gen-passwd /usr/local/bin/gen-passwd
COPY bin/entry /usr/local/bin/entry
COPY registry.conf /etc/registry/registry.conf

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/entry"]
CMD ["registry", "/etc/registry/registry.conf"]

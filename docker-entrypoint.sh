#!/bin/bash

error() {
  echo $*
  exit 1
}

if [ "$REGISTRY_CERT_PUBLIC" == "" ]; then
  error "REGISTRY_CERT_PUBLIC missing"
else
  curl $REGISTRY_CERT_PUBLIC -o /etc/ssl/certs/docker-registry
fi

if [ "$REGISTRY_CERT_PRIVATE" == "" ]; then
  error "REGISTRY_CERT_PRIVATE missing"
else
  curl $REGISTRY_CERT_PRIVATE -o /etc/ssl/private/docker-registry
fi

nginx &

docker-registry

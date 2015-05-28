#!/bin/bash

error() {
  echo $*
  exit 1
}

/usr/local/bin/gen-cert

nginx &

docker-registry

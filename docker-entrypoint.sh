#!/bin/bash

error() {
  echo $*
  exit 1
}

/usr/local/bin/gen-cert
/usr/local/bin/gen-passwd

nginx &

docker-registry

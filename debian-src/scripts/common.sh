#!/bin/bash

set -a
source ../build.env
BASE_DIR="$(dirname "$(pwd)")"
set +a

log_info() {
  echo "|> $@"
}

log_error() {
  echo "error: $@"
}

command_exists() {
  command -v "$1" &> /dev/null
}

debify() {
  cargo deb --dbgsym --maintainer="$DEBIAN_MAINTAINER" -v ${RUST_TRIPLES[@]/#/--target=} $@
}

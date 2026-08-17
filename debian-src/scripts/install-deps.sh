#!/bin/bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./common.sh

if [ "$EUID" -ne 0 ]; then
  log_error "sudo/root is required to install packages"
  exit 1
fi

# See https://github.com/kornelski/cargo-deb#cross-compilation for more details on the required packages.
packages=(pkg-config build-essential)
for arch in "${DEBIAN_ARCHES[@]}"; do
  dpkg --add-architecture $arch
  packages+=("crossbuild-essential-$arch")
done

log_info "installing packages: ${packages[*]}"

apt install ${packages[*]}

#!/bin/bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./common.sh

if ! command_exists rustup; then
  log_error "error: rustup not found"
  exit 1
fi

log_info "installing rustup toolchain: $RUST_TOOLCHAIN"
rustup toolchain install $RUST_TOOLCHAIN

for triple in "${RUST_TRIPLES[@]}"; do
  log_info "|> adding rustup target: $triple"
  rustup target add $triple --toolchain $RUST_TOOLCHAIN
done


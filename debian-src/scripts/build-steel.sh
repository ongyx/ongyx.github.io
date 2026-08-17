#!/bin/bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./common.sh

CRATES=(steel-interpreter steel-language-server cargo-steel-lib steel-forge)

cd "$BASE_DIR/sources/steel"
for crate in "${CRATES[@]}"; do
  log_info "Building $crate"
  debify --package=$crate
done

#!/bin/bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./common.sh

cd "$BASE_DIR/sources/helix"
log_info "Building helix-term"
debify --package=helix-term --features=steel,git

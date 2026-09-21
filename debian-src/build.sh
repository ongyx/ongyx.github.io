#!/bin/bash
set -o errexit -o pipefail -o noclobber

DIR="$(dirname "$(readlink -f "$0")")"

RUST_TARGETS="$(grep 'ARG _RUST_TARGETS' ./Dockerfile | cut -d '=' -f2 | tr -d '"')"

DESTINATION=""

package() {
  local package
  local targets

  package="$1"
  shift
  targets="$(echo "$RUST_TARGETS" | sed -E 's/^|( )/\1--target=/g')"

  # shellcheck disable=SC2086
  cargo deb \
    --color=auto \
    --locked \
    --override-debug=line-tables-only \
    --section=utils \
    --package="$package" \
    --output="$DESTINATION" \
    --maintainer="$MAINTAINER" \
    --deb-revision="$DEB_REVISION" \
    $targets \
    "$@"
}

package_steel() {
  pushd "$DIR/sources/steel"
  for crate in steel-interpreter steel-language-server cargo-steel-lib steel-forge; do
    package "$crate"
  done
  popd
}

package_helix() {
  pushd "$DIR/sources/helix"
  package helix-term --features=steel,git
  popd
}

main() {
  if [ "$#" -lt 2 ]; then
    echo "usage: $0 <destination> <steel|helix>" 1>&2
    exit 1
  fi

  if [[ -z "$MAINTAINER" ]]; then
    echo "warning: maintainer was not specified" 1>&2
  fi

  if [[ -z "$DEB_REVISION" ]]; then
    echo "warning: deb revision was not specified" 1>&2
    DEB_REVISION=1
  fi

  DESTINATION="$1"

  case "$2" in
    "steel")
      package_steel
      ;;
    "helix")
      package_helix
      ;;
    *)
      echo "error: unknown package '$2'"
      ;;
  esac
}

main "$@"

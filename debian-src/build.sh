#!/bin/sh
if [ "$#" -lt 1 ]; then
  echo "usage: build.sh <maintainer name and email>" 1>&2
  exit 1
fi

docker build \
  --build-arg _CACHEBUST=$(date +%s) \
  --build-arg _MAINTAINER="$1" \
  --output type=local,dest=../debian/incoming \
  .

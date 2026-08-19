# debian-src

Scripts and submodules for packages in the Debian repository. The following
packages can be built:

- `steel-interpreter`
- `steel-language-server`
- `cargo-steel-lib`
- `steel-forge`
- `helix`

These packages are unofficial builds of their respective repositories. If you
encounter packaging issues, open an issue here instead of contacting the
original authors.

## Supported Architectures/Versions

Packages are currently built only for `trixie`. Rust crates are (cross-)compiled
with linkers provided by `crossbuild-essential-$arch` using the stable
toolchain.

- amd64 (triple: `x86_64-unknown-linux-gnu`)
- arm64 (triple: `aarch64-unknown-linux-gnu`)

## Prerequisites

You must have [Docker Engine] installed, as the packages are built within a
container for idempotency.

## Quickstart

First, initialize the submodules to download their sources:

```
git submodule update --init --recursive
```

Then run `build.sh <maintainer name and email>` to build the Dockerfile. The
`.deb` files will be copied to [`../debian/incoming`](../debian/incoming).

[Docker Engine]: https://docs.docker.com/engine/install

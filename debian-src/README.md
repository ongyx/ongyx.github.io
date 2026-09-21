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
toolchain, and `1.90.0` for helix.

- amd64 (triple: `x86_64-unknown-linux-gnu`)
- arm64 (triple: `aarch64-unknown-linux-gnu`)

The [Dockerfile](./Dockerfile) takes care of these dependencies for
containerized builds.

## Prerequisites

You must have [Docker Engine] installed, as the packages are built within a
container for idempotency. Both native and integrated Docker installations on
WSL2 are supported.

## Quickstart (Docker)

First, initialize the submodules to download their sources:

```
git submodule update --init --recursive
```

Then build the Docker builder image and run it with:

```
MAINTAINER="name <email>" DEB_REVISION=<rev> ./docker.sh <package>
```

where `<package>` is 'helix', 'steel', or 'all'.

The Docker build script automatically caches the Cargo registry and target directories under [`cache`](./cache/) for faster builds. The resulting packages are output to [`../debian/incoming`](../debian/incoming/).

## Updating the repository

The repository is currently managed with [reprepro]. Add the packages with:

```
cd ../debian
reprepro includedeb trixie incoming/<deb>
```

[Rustup]: https://rustup.rs
[Docker Engine]: https://docs.docker.com/engine/install
[reprepro]: https://manpages.debian.org/trixie/reprepro/reprepro.1.en.html

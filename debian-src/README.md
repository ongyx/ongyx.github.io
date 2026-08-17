# debian-src

Scripts and submodules for packages in the Debian repository. The following
packages can be built:

- `steel-interpreter`
- `steel-language-server`
- `cargo-steel-lib`
- `steel-forge`
- `helix`

These packages are unofficial nightly builds of their respective repositories.
If you encounter packaging issues, do not contact the original authors.

## Supported Architectures/Versions

Packages are currently built only for `trixie`. Rust crates are (cross-)compiled
with linkers provided by `crossbuild-essential-$arch` using the stable
toolchain.

- amd64 (triple: `x86_64-unknown-linux-gnu`)
- arm64 (triple: `aarch64-unknown-linux-gnu`)

## Prerequisites

You must have either Debian `trixie` and [rustup] installed. It is strongly to
setup a Docker container or similar to build these packages for idempotency.

## Quickstart

First, initialize the submodules to download their sources:

```
git submodule update --init --recursive
```

Then install building dependencies and rustup targets:

```
./scripts/install-deps.sh
./scripts/add-targets.sh
```

Finally, build packages with:

```
./scripts/build-steel.sh
./scripts/build-helix.sh
```

[rustup]: https://rustup.rs

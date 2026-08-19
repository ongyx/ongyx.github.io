# syntax=docker/dockerfile:1
FROM rust:trixie AS build
WORKDIR /src

SHELL ["/bin/bash","-c"]

ARG _DEBIAN_ARCHES="amd64 arm64"
# As of 19/8/2026, Helix has a Rust MSRV of 1.90.0.
ARG _RUST_TOOLCHAINS="1.90.0 stable"
ARG _RUST_TARGETS="x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu"

ARG CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER="x86_64-linux-gnu-gcc"
ARG CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER="aarch64-linux-gnu-gcc"
# Disable interactive prompts when installing apt packages.
ARG DEBIAN_FRONTEND=noninteractive
# Grammars can't be fetched if github is down :(
ARG HELIX_DISABLE_AUTO_GRAMMAR_BUILD="1"

# Install dependencies
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/usr/local/cargo/git \
    --mount=type=cache,target=/usr/local/rustup \
    <<EOF
# See https://github.com/kornelski/cargo-deb#cross-compilation for more details on the required packages.
packages=(pkg-config build-essential)
for arch in $_DEBIAN_ARCHES; do
    dpkg --add-architecture $arch
    packages+=("crossbuild-essential-$arch")
done

apt update
apt install -y ${packages[*]}

rustup update
for toolchain in $_RUST_TOOLCHAINS; do
    rustup toolchain install $toolchain
    for triple in $_RUST_TARGETS; do
        rustup target add $triple --toolchain $toolchain
    done
done

cargo install cargo-deb
EOF

# Copy source submodules
COPY ./sources ./sources

# Build steel and helix
ARG _CACHEBUST
ARG _MAINTAINER
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/usr/local/cargo/git \
    --mount=type=cache,target=/usr/local/rustup \
    --mount=type=cache,target=/src/sources/steel/target \
    --mount=type=cache,target=/src/sources/helix/target \
    <<EOF
mkdir /out

debify() {
    # Can't output to target/debian because it is mounted as a cache, which won't be accessible in the next step.
    cargo deb --locked --maintainer="$_MAINTAINER" --output=/out $(printf -- "--target=%s " $_RUST_TARGETS) $@
}

cd /src/sources/steel
for crate in steel-interpreter steel-language-server cargo-steel-lib steel-forge; do
    debify --package=$crate
done

cd /src/sources/helix
debify --package=helix-term --features=steel,git
EOF

FROM scratch
COPY --from=build /out /

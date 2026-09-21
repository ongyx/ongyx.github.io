# syntax=docker/dockerfile:1
FROM rust:trixie AS build
WORKDIR /src

SHELL ["/bin/bash","-c"]

# The Debian architectures to cross-compile for.
ARG _DEBIAN_ARCHES="amd64 arm64"
# The Rust targets corresponding to the Debian architectures above.
ARG _RUST_TARGETS="x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu"
# The Rust toolchains to install. As of 19/8/2026, Helix has a Rust MSRV of 1.90.0.
ARG _RUST_TOOLCHAINS="1.90.0 stable"
# Disable interactive prompts when installing apt packages.
ARG DEBIAN_FRONTEND="noninteractive"

# Install dependencies
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
<<EOF
# See https://github.com/kornelski/cargo-deb#cross-compilation for more details on the required packages.
packages=(pkg-config build-essential)
for arch in $_DEBIAN_ARCHES; do
    dpkg --add-architecture $arch
    packages+=("crossbuild-essential-$arch")
done

apt update
apt install -y ${packages[*]}

for toolchain in $_RUST_TOOLCHAINS; do
    rustup toolchain install $toolchain
    for triple in $_RUST_TARGETS; do
        rustup target add $triple --toolchain $toolchain
    done
done
rustup default stable

cargo install cargo-deb
EOF

# Use the linkers provided by the crossbuild-essential-* packages for cross-compiling.
ENV CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER="x86_64-linux-gnu-gcc"
ENV CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER="aarch64-linux-gnu-gcc"
# Grammars can't be fetched if github is down :(
ENV HELIX_DISABLE_AUTO_GRAMMAR_BUILD="1"

COPY ./build.sh /src/build.sh
COPY ./Dockerfile /src/Dockerfile

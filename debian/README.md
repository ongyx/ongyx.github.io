# ongyx's repository

> [!note]
> This repository is *not affiliated* with the original developers.
> If you encounter issues with packaging, open an issue [here](https://github.com/ongyx/ongyx.github.io).

This Debian repository contains unofficial builds of packages from these sources:

- [Steel]: Scheme interpreter in Rust.
    - `steel-interpreter`
    - `steel-language-server`
    - `cargo-steel-lib`
    - `steel-forge`
- [Helix]: Steel-enabled fork of the [post-modern text editor](https://helix-editor.com).
    - `helix`

All packages are available for `amd64` and `arm64`. They are built using the latest stable release `trixie` (correct as of 21/9/2026).

## Installation

1. Download the signing key:
```sh
sudo apt install wget gpg &&
wget -qO- https://ongyx.github.io/debian/public.asc | sudo gpg --dearmor -o /usr/share/keyrings/ongyx.gpg
```

2. Create a new sources file at `/etc/apt/sources.list.d/ongyx.sources`:
```
Types: deb
URIs: https://ongyx.github.io/debian
Suites: stable
Components: main
Architectures: amd64,arm64
Signed-By: /usr/share/keyrings/ongyx.gpg
```

3. Update your package cache:
```sh
sudo apt update
```

[Steel]: https://github.com/mattwparas/steel
[Helix]: https://github.com/mattwparas/helix/tree/steel-event-system
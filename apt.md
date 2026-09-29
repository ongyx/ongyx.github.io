---
layout: page
title: APT Repository
---

After tinkering with [GitHub Actions] for a while, I've created a [APT repository] hosted on Pages.
Originally, I wanted to host the repository here[^1], but I decided it would be cleaner to keep the Actions in a separate page.

Currently, the APT repository hosts these packages built from their respective sources:[^2]

| Source                                                         | Packages                                                               |
| -------------------------------------------------------------- | ---------------------------------------------------------------------- |
| [Steel] - Scheme interpreter in Rust.                          | steel-interpreter, steel-language-server, cargo-steel-lib, steel-forge |
| [Helix] - Steel-enabled fork of the [post-modern text editor]. | helix-steel[^3]                                                        |

These packages should work on any recent Debian or Debian derivative; if not, please open an [issue] here.

## Installation

1. Download the signing key.
    ```sh
    sudo apt install wget gpg &&
    wget -qO- https://ongyx.github.io/yak-shaving/public.asc | sudo gpg --dearmor -o /usr/share/keyrings/yak-shaving.gpg
    ```

2. Create a new sources file at `/etc/apt/sources.list.d/yak-shaving.sources`. 
    ```
    Types: deb
    URIs: https://ongyx.github.io/yak-shaving
    Suites: stable
    Components: main
    Architectures: amd64,arm64
    Signed-By: /usr/share/keyrings/yak-shaving.gpg
    ```

3. Update your package cache. 
    ```sh
    sudo apt update
    ```

4. Enjoy!

## Credits

Special thanks to:
- [Matthew Paras] for creating Steel and the accompanying Helix plugin system.
- The Helix authors and maintainers for making such a wonderful editor.

[^1]: Hence the blog name.
[^2]: All packages are built for `amd64` and `arm64` on Ubuntu 22.04 runners, which has a [glibc version] of 2.35.
[^3]: Renamed to avoid confusion with the upstream package `helix` or the Debian-maintained package `hx`.

[GitHub Actions]: https://docs.github.com/en/actions
[APT repository]: https://ongyx.github.io/yak-shaving
[Steel]: https://github.com/mattwparas/steel
[Helix]: https://github.com/mattwparas/helix
[post-modern text editor]: https://github.com/helix-editor/helix
[glibc version]: https://gist.github.com/richardlau/6a01d7829cc33ddab35269dacc127680
[issue]: https://github.com/ongyx/yak-shaving/issue
[Matthew Paras]: https://github.com/mattwparas
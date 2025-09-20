---
layout: post
title: Macbook for a Month
date: 2025-09-20 12:35 +0800
category: GameDev
tags:
---

Over the past month, I've been using a MacBook Pro as my daily driver and for developement on the go, courtesy of Impact Colliders for a game project I was working on, '[Eh, How Ah?]'. This short post goes over my day-to-day use and my [Unity] workflow in macOS.

## Prologue

Being a practical IT guy who has used the same Windows laptop since 2020, Apple Silicon Macs weren't an option at that time due to their prohibitive pricing and lack of guaranteed software support. However, it's been 5 years since their introduction and software support (including Unity!) has improved considerably to the point where it's feasible to switch from Windows to macOS as a game developer.

With that in mind, I decided to give the MacBook Pro a try for a month. Specifically, this is a late 2024 model with an M4 Pro chipset.

## First Impressions

Unboxing gets you the MBP itself, its charging head and cable. MagSafe is a nice touch too, but thankfully I didn't get to test its safety features, i.e., disconnecting when tripping over it.

Performance is snappy its screen has great contrast. I play music to help me focus on coding, so I was plesantly suprised by how punchy its speakers were.
Development setup was fuss-free with [Brew], it works like any other package manager on Linux.

## Game Development

After installing VSCode, Unity, and the like, I got down to business. When implementing new functionality, my usual workflow in Unity consists of:
1. Place down or adjust GameObjects in the scene, including UI/UX layout.
2. Switch to VSCode to write components.
3. Switch back to Unity to add and test those components on the GameObjects.

This workflow is therefore dependent on quick domain reloads and recompiles, which the MBP takes **less than 5 seconds on** - blazing fast would be an understatement.
On Windows, I use [Fast Script Reload] to accomplish this, but you still have to reload the domain after exiting Play Mode for your changes to persist.

![Screenshot of writing this post in VSCode](/assets/img/mfam-1.png)
*Fig. 1: VSCode session with this post open.*

For longer coding sessions, the MBP's battery life is no slouch either. It easily lasts for a minimum of 8 hours even when Unity is running continuously, and the passively cooled chassis only gets warmer when doing a full build. Pretty impressive!

## Caveats

There is a productivity cost associated with moving from Windows to macOS, however. It mostly comes down to learning new shortcuts and figuring out macOS equivalents of your Windows apps if they're not cross-platform. This includes:
* Desktop game support being non-existent for Mac, unless you want to try [PlayCover].
* Command and Control being two different keys, e.g., `Ctrl+C` becomes `Cmd+C`.
* Windowing shortcuts using Control and Function, e.g., `Win+Left` becomes `Ctrl+Fn+Left`.
* Left clicking involves clicking using two fingers instead.
* `F2` for renaming files is just `Return` in macOS.
* Specific to VSCode, default shortcuts use a mix of Command and Control.

## Conclusion

After using the MBP for a month, I would recommend getting one for game development on the go, maybe paired with a desktop machine or server at home for building the game itself. Due to the prohibitive pricing of newer models, M1 to M3 MacBooks are a viable alternative and typically have more storage and RAM than their current generation counterparts.

Until next post!

[Eh, How Ah?]: https://impactcolliders.com/about.html
[Brew]: https://brew.sh
[Unity]: https://unity.com
[Fast Script Reload]: https://github.com/handzlikchris/FastScriptReload
[PlayCover]: https://playcover.io
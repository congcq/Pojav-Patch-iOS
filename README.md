# Pojav Patch iOS
[![Development build](https://github.com/congcq/Pojav-Patch-iOS/actions/workflows/development.yml/badge.svg?branch=main)](https://github.com/congcq/PojavLauncher-iOS-Patch/actions/workflows/development.yml)
[![Discord](https://img.shields.io/discord/724163890803638273.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/nUpEeqRBqR)



## Introduction
PojavLauncher is a Minecraft: Java Edition launcher for Android, iOS, and iPadOS, based off of zhuowei's [Boardwalk](https://github.com/zhuowei/Boardwalk) project.
* Supports most versions of Minecraft: Java Edition, from the very first beta to the newest snapshots.
* Supports Forge, Fabric, OptiFine, and Quilt for you to customize the experience with supported mods.
* Includes customizable on-screen controls, keyboard and mouse support, and game controller support.
* Optimized for jailbroken and TrollStore devices to enable better capabilities.
* Microsoft account and demo mode support for logging into Minecraft.
* ...and much more!

This repository contains the code for our iOS and iPadOS fork of [PojavLauncher iOS](https://github.com/PojavLauncherTeam/PojavLauncher_iOS) now is [Amethyst](https://github.com/AngelAuraMC/Amethyst-iOS). It named Pojav Patch - patch for everyone who don't have Premium Account can be played PojavLauncher on iOS without Premium Account.

But it's not because it can play with an internal account that you don't need to buy a Premium Account; I still recommend that you spend money to purchase it.

## Getting started with PojavLauncher
The [PojavLauncher Website](https://pojavlauncherteam.github.io/INSTALL.html#ios) has extensive documentation on how to install, set up, and play! For those who wish to install quickly, here's the basics:

### Requirements
At the minimum, you'll need one of the following devices on **iOS 14.0** and later:
- iPhone 6s and later
- iPad (5th generation) and later
- iPad Air (2nd generation) and later
- iPad mini (4th generation) and later
- iPad Pro (all models)
- iPod touch (7th generation)

However, we recommend one of the following devices on **iOS 14.0** and later:
- iPhone XS and later, excluding iPhone XR and iPhone SE (2nd generation)
- iPad (10th generation) and later
- iPad Air (4th generation) and later
- iPad mini (6th generation) and later
- iPad Pro (all models, except for 9.7-inch)

Recommended devices provide a smoother and more enjoyable gameplay experience compared to other supported devices.
- ~~tvOS support is in development~~ tvOS are disable in this repository.
- iOS 17.x and iOS 18.x is supported. However, a computer is required. These methods will ultilized usage of pymobiledevice3. Python 3.11.(x) must be properly set up on your computer. For more information, please check out the official Wiki: https://pojavlauncherteam.github.io/JIT.html#what-are-the-methods-to-enable-jit
- iOS 26 is not supported due to a JIT issue in this version of iOS.

### Setting up to sideload
Pojav Patch can be sideloaded in many ways. Our recommended solution is to install [TrollStore](https://github.com/opa334/TrollStore) if your iOS version supports it. Installing with TrollStore allows you to permenantly sign the application, automatically enable JIT, and increase memory limits.

For iOS/iPadOS 17.0: Unfortunately,the above process will not work. It is required that you must use [TrollRestore](https://github.com/JJTech0130/TrollRestore). Any versions above iOS/iPadOS 17.0 will NOT be supported (as of December 23, 2024).

If you cannot, [AltStore](https://altstore.io) and [SideStore](https://sidestore.io) are your next best options.
- Signing services that do not use your UDID (and use distribution certificates) are not supported, as PojavLauncher requires capabilities they do not allow. However, if you do managed to gain access to a Development certificate, due to it having the necessary entitlement (being com.apple.security.get-task-allow) to attach a debugger to the running process (enabling JIT), you may use a Development certificate.
  
- Only install sideloading software and PojavLauncher from trusted sources. We are not responsible for any harm caused by using unofficial software.
- Jailbreaks also benefit from permenant signing, autoJIT, and increased memory limits, however we do not recommend them for regular use.

### Installing Pojav Patch
#### Release build (both TrollStore and AltStore/SideStore)
1. Download an IPA of Pojav Patch in [Releases](https://github.com/congcq/Pojav-Patch-iOS/releases).
2. Open the package in TrollStore using the share menu.

#### Nightly builds
*These builds can contain game-breaking bugs. Use with caution.*
1. Download an IPA build of Pojav Patch in the [Actions tab](https://github.com/congcq/Pojav-Patch-iOS/actions).
2. Open the downloaded IPA in your sideloading app to install.

### Enabling JIT
Pojav Patch makes use of **just-in-time compilation**, or JIT, to provide usable speeds for the end user. JIT is not supported on iOS without the application being debugged, so workarounds are required to enable it. You can use this chart to determine the best solution for you and your setup.
| Application         | AltStore | SideStore | TrollStore | Jitterbug          | Jailbroken |
|---------------------|----------|-----------|------------|--------------------|------------|
| Requires ext-device | Yes      | No        | No         | If VPN unavailable | No         |
| Requires Wi-Fi      | Yes      | Yes       | No         | Yes                | No         |
| Auto enabled        | Yes(*)   | No        | Yes        | No                 | Yes        |

(*) AltServer running on the local network is required.

## Contributors
Pojav Patch is amazing, and surprisingly stable, and it wouldn't be this way without the commmunity that helped and contribute to the project! Some notable names:

**In this repository (Pojav-Patch-iOS)**:

@congcq (CongChu)

**In PojavLauncher iOS repository**:

@khanhduytran0 - Lead iOS port developer  
@crystall1nedev - Lead iOS port developer  
@artdeell  
@Mathius-Boulay  
@zhuowei  
@jkcoxson   
@Diatrus 

## Third party components and their licenses
- [Caciocavallo](https://github.com/PojavLauncherTeam/caciocavallo): [GNU GPLv2 License](https://github.com/PojavLauncherTeam/caciocavallo/blob/master/LICENSE).
- [jsr305](https://code.google.com/p/jsr-305): [3-Clause BSD License](http://opensource.org/licenses/BSD-3-Clause).
- [Boardwalk](https://github.com/zhuowei/Boardwalk): [Apache 2.0 License](https://github.com/zhuowei/Boardwalk/blob/master/LICENSE) 
- [GL4ES](https://github.com/ptitSeb/gl4es) by @lunixbochs @ptitSeb: [MIT License](https://github.com/ptitSeb/gl4es/blob/master/LICENSE).
- [Mesa 3D Graphics Library](https://gitlab.freedesktop.org/mesa/mesa): [MIT License](https://docs.mesa3d.org/license.html).
- [MetalANGLE](https://github.com/khanhduytran0/metalangle) by @kakashidinho and ANGLE team: [BSD 2.0 License](https://github.com/kakashidinho/metalangle/blob/master/LICENSE).
- [MoltenVK](https://github.com/KhronosGroup/MoltenVK): [Apache 2.0 License](https://github.com/KhronosGroup/MoltenVK/blob/master/LICENSE).
- [openal-soft](https://github.com/kcat/openal-soft): [LGPLv2 License](https://github.com/kcat/openal-soft/blob/master/COPYING).
- [Azul Zulu JDK](https://www.azul.com/downloads/?package=jdk): [GNU GPLv2 License](https://openjdk.java.net/legal/gplv2+ce.html).
- [LWJGL3](https://github.com/PojavLauncherTeam/lwjgl3): [BSD-3 License](https://github.com/LWJGL/lwjgl3/blob/master/LICENSE.md).
- [LWJGLX](https://github.com/PojavLauncherTeam/lwjglx) (LWJGL2 API compatibility layer for LWJGL3): unknown license.
- [DBNumberedSlider](https://github.com/khanhduytran0/DBNumberedSlider): [Apache 2.0 License](https://github.com/immago/DBNumberedSlider/blob/master/LICENSE)
- [fishhook](https://github.com/khanhduytran0/fishhook): [BSD-3 License](https://github.com/facebook/fishhook/blob/main/LICENSE).
- [shaderc](https://github.com/khanhduytran0/shaderc) (used by Vulkan rendering mods): [Apache 2.0 License](https://github.com/google/shaderc/blob/main/LICENSE).
- [NRFileManager](https://github.com/mozilla-mobile/firefox-ios/tree/b2f89ac40835c5988a1a3eb642982544e00f0f90/ThirdParty/NRFileManager): [MPL-2.0 License](https://www.mozilla.org/en-US/MPL/2.0)
- [AltKit](https://github.com/rileytestut/AltKit)
- [UnzipKit](https://github.com/abbeycode/UnzipKit): [BSD-2 License](https://github.com/abbeycode/UnzipKit/blob/master/LICENSE).
- [DyldDeNeuralyzer](https://github.com/xpn/DyldDeNeuralyzer): bypasses Library Validation for loading external runtime
- Thanks to [MCHeads](https://mc-heads.net) for providing Minecraft avatars.

<!-- sillysock was here -->

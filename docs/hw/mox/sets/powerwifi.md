---
board: mox
---
# MOX Power Wi-Fi

A configuration of the Turris MOX router with two Wi-Fi cards. Marvell Armada
3720 1 GHz dual core, 512 MB DDR3 RAM, GWAN/GLAN, USB 3.0, microSD slot, 2×2
MIMO and 3×3 MIMO 2.4/5 GHz Wi-Fi, Bluetooth.

![MOX Power Wi-Fi](powerwifi.jpg)

## About

{! include-markdown './generic-mox.md' !}

The Power Wi-Fi set is used to provide WiFi signal or increase its range. It is
suitable for purely wireless networks. Unlike with Pocket Wi-Fi, with the Power
Wi-Fi configuration you can use the 5GHz and 2.4GHz Wi-Fi (for legacy
devices) at the same time. And the 5GHz Wi-Fi is even faster than in the case
of Pocket Wi-Fi.

This set consists of the [MOX A (Basic)](../modules/a.md) module, a power
source, a microSD card, the [MOX B (Extension) module](../modules/b.md), [MOX
Wi-Fi add-on (SDIO)](../addons.md#wi-fi-sdio) and [MOX Wi-Fi add-on
(mPCIe)](../addons.md#wi-fi-mpcie).

The MOX Power Wi-Fi configuration can be significantly expanded with
accessories. But there are many reasons to fall in love:

{% set conf = 'ASBW' %}

{! include-markdown './feature-list.md' !}


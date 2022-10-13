---
board: mox
---
# MOX Pocket Wi-Fi

A basic configuration of the Turris MOX router with Wi-Fi. Marvell Armada 3720
1 GHz dual core, 512 MB DDR3 RAM, GWAN/GLAN, USB 3.0, microSD slot, 2×2 MIMO
2.4/5 GHz Wi-Fi, Bluetooth

![MOX Pocket Wi-Fi](pocketwifi.jpg)

## About

{! include-markdown 'hw/mox/sets/generic-mox.md' !}

This set consists of the [MOX A (Basic) module](../modules/a.md), a power
source, a microSD card and the [MOX Wi-Fi add-on
(SDIO)](../addons.md#wifi-sdio). It is used to provide WiFi signal or increase
its range and is suitable for purely wireless networks. You can choose between
2.4GHz and 5GHz Wi-Fi. If you want to use the faster 5GHz or 5GHz and 2.4GHz
Wi-Fi (for legacy devices) at the same time, choose the [MOX Power
Wi-Fi](powerwifi.md) set.

The MOX Pocket Wi-Fi configuration can be significantly expanded with
accessories. But there are many reasons to fall in love:

{% set conf = 'AS' !}

{! include-markdown 'feature-list.md' !}


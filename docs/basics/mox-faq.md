---
board: mox
---

# Frequently asked questions about Turris MOX

## Hardware

### What modules can I use to extend my MOX

MOX can be extended using additional MOX modules or add-ons. There are some
limitations, though. Those limitations are documented
[hardware section](../hw/mox/intro.md) of this documentation. If you want to
check whether your desired combination of modules is valid, you can do so using
[MOX configurator](https://mox-configurator.turris.cz/).

### Why 30W power source, is MOX power-hungry?

Turris MOX comes with a 30W power source. But the real power consumption is
typically much less. We ship our devices with a power source strong enough to
handle all possible load. Although you have just a
[MOX Start](../hw/mox/sets/start.md) right now, you might decide to extend
it using other modules. You may also add some USB devices, such as a USB drive. We
choose to ship the power supply strong enough to handle all those cases.

## Software

### Can I stop LED from blinking/change the pattern?

The behavior of the LED is completely configurable. You can configure it in
[LuCI](luci/luci.md) web interface in section _System_/_LED Configuration_.
You can add/edit the LED action there and modify the trigger to best suit your
preferences.

## Known bugs

### Turris MOX Shield is not capable to route more than 450 Mbps

Between LAN and WAN ports, it is possible that the speed is lower than it should
be. There have been many improvements in the Linux kernel available since version
5.8.

| OpenWrt version                               | Turris OS version | LTS OpenWrt kernel | LTS Turris kernel |
| --------------------------------------------- | :---------------: | -----------------: | ----------------- |
| OpenWrt 21.02                                 |   Turris OS 6.x   |                5.4 | 5.15              |
| OpenWrt 22.03                                 |   Turris OS 7.x   |               5.10 | 5.15              |
| OpenWrt 24.10                                 |   Turris OS 9.x   |                6.6 |  6.6              |

### Turris MOX: reboot issue

In rare cases, Turris MOX and Turris Shield are not correctly rebooted.
We are investigating this issue. We are in touch with Marvell, the processor
manufacturer, to solve it. We prepared
[some workarounds](https://gitlab.nic.cz/turris/mox-boot-builder/-/releases/v2021.09.07),
which could improve the reboot behavior.

### Limitation of the SDIO card on Turris MOX

The provided firmware from NXP for the chipset 88W8997 has a limitation that it is
possible to create only 4 SSIDs and have a maximum of 8 concurrent clients
connected to them. It does not support WPA3 mode.

{! include-markdown './see-also-faq.md' !}

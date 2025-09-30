---
board: shield
---

# Frequently asked questions about Turris Shield

## Software

### Where is LuCI interface

Turris Shield is targeting the non-technical users. For that reason, LuCI
interface is not present on Turris Shield and even some options in the reForis user
interface are hidden to decrease the complexity of the device.

## Known bugs

### Turris Shield is not capable of routing more than 450 Mbps

Between LAN and WAN ports, it is possible that the speed is lower than it should
be. There have been many improvements in the Linux kernel available since version
5.8. Make sure your software is up-to-date.

| OpenWrt version                               | Turris OS version | LTS OpenWrt kernel | LTS Turris kernel |
| --------------------------------------------- | :---------------: | -----------------: | ----------------- |
| OpenWrt 21.02                                 |   Turris OS 6.x   |                5.4 | 5.15              |
| OpenWrt 22.03                                 |   Turris OS 7.x   |               5.10 | 5.15              |
| OpenWrt 24.10                                 |   Turris OS 9.x   |                6.6 |  6.6              |

### Turris Shield: reboot issue

In rare cases, Turris Shield is not correctly rebooted. We are investigating
this issue. We are in touch with Marvell, the processor manufacturer, to solve
it. We prepared
[some workarounds](https://gitlab.nic.cz/turris/mox-boot-builder/-/releases/v2021.09.07),
which could improve the reboot behavior.

{! include-markdown './see-also-faq.md' !}

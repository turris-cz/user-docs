---
board: 1.x
competency: advanced
---
# Migrating the system to a microSD card on Turris 1.x routers

This guide walks you through creating a new system that runs fully from a microSD card; the
onboard memory chips are not utilized. The new system will run the newest Turris OS
and U-Boot.

## Requirements

You will need:

* a [Turris 1.0 or Turris 1.1](../hw/turris-1x/turris-1x.md) router,
* a microSD card with at least 8 GB free storage,
* an internet connection,
* a screwdriver.

### Flashing system on microSD card
This step can be done on any Linux-running computer with an internet connection. This means you can also
use your Turris 1.x router itself, if you choose to do so, skip to the [Inserting a microSD card](#inserting-microsd-card)
step and come back after you insert the microSD card into your router.

Insert the microSD card into a computer running Linux. Open a terminal and
run the [microSD card formatting script](https://gitlab.nic.cz/turris/misc/-/blob/master/turris1x-sd/turris1xsdimg)
as an argument, passing it the microSD device path (e.g., `/dev/mmcblk0`). The script has to be run with root privileges
because it formats the disk.
```bash
cd /tmp
wget https://gitlab.nic.cz/turris/misc/-/raw/master/turris1x-sd/turris1xsdimg -O turris1xsdimg && chmod +x turris1xsdimg
./turris1xsdimg /dev/mmcblk0
```

### Inserting a microSD card

You will need to unplug the router from the power supply. You need to unscrew a
few screws from the top cover of the router to remove it. The microSD card slot is
located underneath the RAM slot. Very cautiously remove the RAM from its slot by
pressing the clips on both sides, and the RAM should pop out by itself. Then you can insert
the microSD card slowly and without using force.

![RAM module with inserted RAM](turris1x-with-ram.jpg)

If the card is in its place, you can now put back the RAM, top cover, and plug the power
cord into the router.

![RAM module without RAM and inserted SD card](turris1x-without-ram.jpg)

### Switch boot location to microSD card
Turn off your Turris 1.x router. Locate the `SW1` switch on your router and change its state to `011010`.
After you turn on your router again, you should boot into the new system on the microSD card.

![SW1 switch in state 011010](turris1x-sw1-011010.png)

To verify that the system is running from the microSD card, run the `mount` command and check its output.

You should see this in the output:

```
/dev/mmcblk0p1 on / type btrfs
```


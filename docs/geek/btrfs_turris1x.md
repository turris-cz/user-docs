# Btrfs migration on Turris 1.x routers

!!! warning
    This article is for [Turris 1.x routers](../hw/turris-1x/turris-1x.md)
    running on old [Turris OS 3.x](../basics/tos-versions.md) version.
    It's intention is to make it possible to easily use the latest major version
    of Turris OS version.

Btrfs is the default filesystem on Turris Omnia and Turris MOX while Turris 1.x
routers were using at first JFFS2 and these days UBIFS. In the recent versions, we
added the possibility to use the Btrfs filesystem for our first routers. It has
various advantages like providing backups via snapshots by using tool
[Schnapps](../geek/schnapps/schnapps.md) for managing snapshots. However, while
you can use the RESET button to rollback to previous snapshots on Turris Omnia, this
is not possible on Turris 1.x routers, yet.

## Requirements

You will need:

* a [Turris 1.0 or Turris 1.1](../hw/turris-1x/turris-1x.md) router,
* a microSD card with at least 4 GB free storage,
* a screwdriver.

### Preparation of Turris 1.0 routers

!!! warning
    You should be using UBIFS before you can proceed.

All Turris 1.0 routers comes by default with JFFS2 and this can be checked with
the `mount` command or in the advanced administration LuCI.  In Turris OS 3.10.9,
which we released at end the of the year 2018, we automatically updated the
operating system located in the NOR. It means that if you did a Factory Reset
afterwards, you should be running at least Turris OS 3.8.5 and if you were using JFFS2
before, you will switch to UBIFS just by resetting to the factory settings.

### Inserting microSD card

You will need to unplug the router from the power supply. You need to unscrew a
few screws from the top cover of the router to remove it. The microSD card slot is
located underneath the RAM slot. Very cautiously remove the RAM from its slot by
pressing the clips on both sides and the RAM should pop out itself. Then you can insert
the microSD card slowly and without using force.

![RAM module with inserted RAM](turris1x-with-ram.jpg)

If the card is in it is place, you can now put back the RAM, top cover and plug the power
cord into the router.

![RAM module without RAM and inserted SD card](turris1x-without-ram.jpg)

### Installing package

Before you are able to install any packages using LuCI/SSH, you need to update
the package lists and then you can install the `turris-btrfs` package.

```
opkg update
opkg install turris-btrfs
```

It does nothing by itself, so it is safe to install.

#### Formatting microSD card

The next step is to execute the `btrfs_migrate` command, which is a script that will
make sure that you want to really want to wipe all the data on the microSD card and
afterward it will format the card to Btrfs. Then it will copy all the current content on
the NAND (internal storage) to the microSD card and set the U-boot environment to boot
from the microSD card.

After the script is done, you will get a notification to reboot your router.

To check if you are booting from the microSD card, you can run the command `mount |
grep btrfs` to verify that there is something like `/dev/mmcblk0p2 on / **type
btrfs**`. If it is there, the migration was successful.

### When happens if you remove the microSD card

Turris boots from the NAND (internal storage) in the same state as before
the migration.

### How to use Turris OS 5.x

As for now, there is disabled opt-in migration for Turris 1.x routers, however
there is a way how to switch to the latest major version.

!!! warning
    By following this 5.x migration howto, you will loose your current settings 
    and will have to configure everything from scratch.

If you will run one by the following commands, it will download the medkit from the
[HBS branch](../geek/testing.md), import the medkit as the factory snapshot and
reset to the factory defaults using the latest version of Turris OS. Reboot will do
its thing that you will boot from the factory image.

```
cd /tmp
wget https://repo.turris.cz/hbs/medkit/turris1x-medkit-latest.tar.gz
schnapps import -f turris1x-medkit-*.tar.gz
schnapps rollback factory
reboot
```

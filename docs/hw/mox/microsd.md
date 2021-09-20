---
board: mox
competency: advanced
---
# Preparation of microSD card for Turris MOX

## Using rescue modes

If your Turris MOX A is connected to the Internet, you can insert the microSD
card into it and choose [rescue mode number
6](rescue-modes.md#flash-from-the-internet) when starting the
router. Turris MOX will download the latest image from the Internet, create a
partition if there is none, format your microSD card to the Btrfs filesystem to
be able to use snapshots. Those can be useful when you plan to make major
changes to the system. See [schnapps](../../geek/schnapps/schnapps.md) – a tool for
managing snapshots.

If you don't like the previous option – flashing from the cloud, you can
download the [image](https://repo.turris.cz/hbs/medkit/) and save it to your
microSD card or any USB drive. **Don't extract it**. We recommend to use Ext4
or Btrfs formatted drive although Fat32 should work as well. Then use [rescue
mode number 4](rescue-modes.md#re-flash-router) to reformat
your MicroSD card.

## Manual setup

You can also prepare your micro SD card manually. To do that you would most
likely need a Linux machine.

!!! tip
    You can use the manual setup to prepare any other media as well and MOX
    will boot out of it. For example USB flash drive.

### FS layout

You should have at least one partition on your micro SD card and the first one
should be used by Turris OS.

First, we need to format it to Btrfs. Let's assume, that your micro SD is
`/dev/mmcbkl0`. If your card reader exposes itself as something else, you have
to figure the device yourself, usually `dmesg` output is quite helpful.

To format your MicroSD, use the following command:

```
mkfs.btrfs -f -L turris /dev/mmcblk0p1
```

### Content

Now we need to get the actual content on the micro SD card. Turris routers by
default boot from `@` snaphot. So we need to create it and populate it.  For
that we need mounted filesystem, so let's assume, that you have `/mnt/turris`
directory empty to be used as mounting point of your microSD card. Also as you
need to create files owned by various users and various devices, you should run
the following as root.


```
mount /dev/mmcblk0p1 /mnt/turris
btrfs subvol create /mnt/turris/@
wget -O - https://repo.turris.cz/hbs/medkit/mox-medkit-latest.tar.gz | tar -C /mnt/turris/@ -xzvf -

```

If everything goes well, we are almost done. What is left is to create a
factory snapshot to be used during recovery and to create a symlink for boot
script so U-Boot can find it easily.

```
btrfs subvol snapshot /mnt/turris/@ /mnt/turris/@factory
ln -s @/boot/boot.scr /mnt/turris/boot.scr
umount /mnt/turris
```

Now you have a micro SD card with the latest medkit.

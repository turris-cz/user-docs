---
board: omnia
competency: expert
---
# Booting Turris Omnia from mSATA SSD

!!! warning
    This guide is only for Omnia 2019 or newer. For older series, please
    install the `turris-nor-update `package and run the `nor-update` command
    from CLI or update your NOR via [Serial cable](serial-boot.md#nor-recovery).

## Hardware installation

1. Ensure that your Omnia isn't plugged to the power supply.
2. Move the PCIe cards one position to the SIM card slot.
3. Insert your mSATA SSD to the remaining slot (the one which is close to
   the heatsink (CPU)) as is the only one, which supports also mSATA interface
   together with mini PCIe.

!!! tip
    Because it's a complex operation (which includes many steps) you can
    utilize our [video guide](https://www.youtube.com/watch?v=71_M2N3ga7s).

## Device detection

1. Plug your Omnia to the power supply.
2. Connect to the router via SSH and log in.
3. Check whether the new SSD can be detected: `ls /dev/sd*` It should display
   `/dev/sda`.

!!! notice
    If the SSD has been already partitioned you can see those partitions too.

## Preparation of SSD

1. Backup the current filesystem by creating and exporting a snapshot.
   See the [Schnapps documentation page](../../geek/schnapps/schnapps.md).

    !!! note
        If you no longer can access your eMMC or you want to start fresh,
        you can use the [medkit](https://repo.turris.cz/hbs/medkit/omnia-medkit-latest.tar.gz)
        instead of a backup of your eMMC.

2. Find out the size of the system partition (e.g. via `df`; the partition is
   named `mmcblk0p1`).
3. Install `cfdisk` if not yet installed:
```shell
opkg update && opkg install cfdisk
```
4. Run `cfdisk` now:
```shell
cfdisk /dev/sda
```
5. If no partition table exists it asks for a new one (its type should be
   `DOS`).
6. Delete all old partitions (if any).
7. Create a new primary partition. Its size must be at least the same as the
   original (eMMC) partition has (see above). Mark this partition as bootable.
8. Write the changes by `Write` and leave `cfdisk` by `Quit`.
9. Create a filesystem on the new partition:
```shell
mkfs.btrfs /dev/sda1
```
10. Create a mount point a mount the partition on it:
```shell
mkdir -p /mnt/ssd && mount /dev/sda1 /mnt/ssd
```
11. Create a Btrfs subvolume for the root directory:
```shell
btrfs subvolume create /mnt/ssd/@
```
12. Unpack the backup created in step (1) into the new subvolume:

    For example:
    ```shell
    tar -C /mnt/ssd/@ -xvzf backup.tar.gz
    ```
    Where you need to replace `backup.tar.gz` with the actual name of your backup.

    Or if you want to start from scratch:
    ```shell
    wget -O - https://repo.turris.cz/hbs/medkit/omnia-medkit-latest.tar.gz | tar -C /mnt/ssd/@ -xvzf -
    ```

13. Create a symlink to the boot.scr file:
```shell
cd /mnt/ssd && ln -s @/boot/boot.scr .
```
14. Leave the directory and unmount the drive
```shell
cd && umount /mnt/ssd
```

## Updating U-Boot to boot from SSD

To boot from SSD prepared in previous step, you need to modify the U-Boot
environment.

1. Connect to your router via a [serial cable](../serial.md).
2. Reboot your the router and immediately press _Enter_ repeatedly until
   the U-Boot prompt “=>” appears.
3. Run `printenv` to check how the environment variables are set. Its output
   should look like:
```shell
boot_targets=mmc0 scsi0 usb0 pxe dhcp
```
4. Set the variables to their new values for the next boot:
```shell
setenv boot_targets scsi0 mmc0 usb0 pxe dhcp
```
5. Try to boot using the new values: `run distro_bootcmd`
6. After booting, run the `mount` command to display what is actually mounted.
   It should look like:
```
/dev/sda1 on / type btrfs (rw,noatime,ssd,space_cache,commit=5,subvolid=257,subvol=/@)
```
7. If it is OK you can repeat the step 4 and then write the environment
   values permanently by running `saveenv`
8. Reboot your router by `run distro_bootcmd`

!!! info
    The `boot_prefixes` variable specifies where to search for the boot
    directory (which is located on the `@` subvolume now) whereas
    `boot_targets` defines the boot sequence (`scsi0` means the first
    virtual SCSI device which is presented by the SSD here).

## Creating factory image

The last thing to do is to create a factory image so you have something to return
to if you run into troubles. Starting from Turris OS 6.3.3, schnapps has a
command to do that.

You just need to run `schnapps update-factory` and after it finishes, you can
use the _Factory reset_ button in reForis and the `schnapps rollback factory` command.

!!! caution
    You should avoid using the LuCI mount plugin as it tries to unmount all
    external drives including your SSD and that would break your system till
    the reset. Also, there is a possibility that at some point we will update
    U-Boot and its environment in one of our future releases. This might
    override your setup and you would need to repeat the above steps to
    configure U-Boot again. Additionally, the most of the recovery options
    using the reset button will not work - reverting to the previous snapshot
    or factory reset. You can still manage your snapshots manually using
    `schnapps` if you set it up correctly.

## Credits

This guide utilizes instructions originally written by
[drhm](https://forum.turris.cz/u/drhm) on our
[forum](https://forum.turris.cz/t/boot-from-ssd-outdated-description/14510/11).

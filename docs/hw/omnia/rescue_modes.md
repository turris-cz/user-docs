---
board: omnia
---
# Factory reset on Turris Omnia

The Turris Omnia router has a reset button on its back panel. When you press
and immediately release the reset button the router resets and boots into
ordinary Turris OS ([mode 1](#standard-reboot)). To enter other reboot modes
press the reset button and wait for LEDs to indicate the number of the desired
mode. Then release the reset button.

LEDs represent a counter. The number of shining LEDs (regardless of the color)
indicates the current mode. The last LED transition from green to red. When it
turns red, next LED lights up and the counter is incremented. When the counter
reaches 12 (number of LEDs) it starts again from 1.

When the reset button is released the LED counter blink three times to confirm
the selected reset mode. If the selected mode is different from the required
just press the reset button again and start the mode selection process again.

Available reset modes:

* 1 LED: Standard (re)boot
* 2 LEDs: Rollback to latest snapshot
* 3 LEDs: Rollback to factory reset
* 4 LEDs: Re-flash router from flash drive
* 5 LEDs: Unsecure SSH on 192.168.1.1 (Omnia 2019 and newer)
* 6 LEDs: Flash from the internet (Omnia 2019 and newer)
* 7 LEDs: Rescue shell

!!! tip
    Release the reset button immediately after the required number of LEDs
    starts shining (regardless of color). Do not unnecessarily prolong holding
    the reset button when the last LED is lit. By this you decrease a chance of
    accidentally transitioning to the next mode at the same moment when the
    button is released.

After the selected mode indication is performed all LEDs turn blue for a moment
and then a light wave indicates the start the first stage boot during which
LEDs turn green.

!!! warning
    When LEDs turn red, it means that some highly sensitive operation is in
    process and data may be corrupted if it is interupted. Try not to reset
    router during the proccess or you might end up with corrupted
    filesystem. That one can be fixed using [mode 4](#re-flash-router) but with
    complete data loss.

How reset modes work is also explained in one of our video tutorials.

<iframe  
    width="560" 
    height="315" 
    src="https://www.youtube.com/embed/ZrWzpsxqaRU" 
    frameborder="0" 
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
    allowfullscreen
    >
</iframe>


## Standard (re)boot

1 LED (Power)

Router is going to reboot. During the boot process the LEDs indicate operation
of assigned peripherals. When the boot process is completed all LEDs turn green
for a moment and then transition back to operation indicator mode.

## Rollback to latest snapshot

2 LEDs (Power, 0)

This mode may help in situation when you lose network connectivity to your
Turris Omnia router during experiments or due to any other reason that is bound
to the internal state of the router. You can simply return to the latest
snapshot of the running system by selecting the proper reset mode. For more
information about the snapshots please visit schnapps.

During the course of the operation all LEDs are going to turn green. After a
while the LEDs turn red. From this moment, the router must not be restarted
or powered off. When the rollback operation is completed the router
automatically restarts. Completion of the snapshot rollback process is
indicated by turning all LEDs green for a moment during the boot into the
selected snapshot. After that the LEDs switch back to the standard operation
indicator mode.

!!! tip
    Your current state is saved in a snapshot. You can later cheery-pick changes
    you still want by using [Schnapps](../../geek/schnapps/schnapps.md).

## Rollback to factory reset

3 LEDs (Power, 0, 1)

All data, settings and software in the internal storage of the router are
erased and replaced by the factory defaults. Internally the file system rolls
back to a special snapshot (the one that has been created in the
factory). Please use this mode when you lose your password and all means of
access to the router or when the return to the latest snapshot (mode 2) is not
sufficient to repair broken system.

Indication of the process progress is the same as in case of rollback to the
latest snapshot (mode 2).

!!! tip
    Your current state is saved in a snapshot. You can later cheery-pick changes
    you still want by using [Schnapps](../../geek/schnapps/schnapps.md).

!!! tip
    You can achieve the same results by calling `schnapps rollback factory` from
    CLI.

## Re-flash router

!!! warning
    This operation erases all settings and all data stored in the router.

4 LEDs (Power, 0, 1, 2)

If the Turris Omnia router's operating system is broken beyond repair or if you
want to avoid long upgrades during initial setup, please use the following
method for restoring the operating system image.

Download the latest version of Turris Omnia's system image from
<https://repo.turris.cz/hbs/medkit/omnia-medkit-latest.tar.gz>. Save the
file `omnia-medkit-latest.tar.gz` to USB flash drive to the root directory. The
Turris Omnia router supports following filesystems: _ext4, Btrfs, XFS and
FAT32_. You can also download and put alongside `md5` or `sha256` file from the
same URL.  Connect the USB flash to the Turris Omnia router and use reset
button to select mode 4 (4 LEDs).

The Turris Omnia router will rewrite internal eMMC storage with the system
image from the USB flash drive.

Process of rewriting the internal storage takes considerably longer time than
snapshot rollback in the previous cases. However, indication of the process
progress is the same as in case of rollback to the latest snapshot (mode 2).

When the process has completed the task you may remove the USB flash.

## Unsecure SSH on 192.168.1.1

!!! warning
    When used incorrectly, this operation exposes your Omnia unprotected on the
    internet. Make sure to unplug all untrusted computers and internet
    connection first.

!!! info
    This mode is for now avaialble only on Omnia 2019 and newer.

5 LEDs (Power, 0, 1, 2, 3)

This mode is meant to help you debug your issues without need for serial cable
or rolling back snapshots. Before entering this mode, make sure that only your
computer is directly connected to LAN4 port.

When started, Omnia will set-up IPv4 network on it's LAN4 interface with static
IP address `192.168.1.1/24`. Pick a random IP address from the same network
(for example `192.168.1.2/24`) and set it up manually on your computer. After
that, you should be able to ssh as root to your router without need to enter
password. You will end up in rescue mode with limited capabilities, but you
have [Schnapps](../../geek/schnapps/schnapps.md) at your disposal and you can
mount rootfs from your micro SD card and do any changes you need.

After finishing your fixes, don't forget to unmount any mounted filesystems and
reboot the router.

## Flash from the internet

!!! warning
    This operation erases all settings and all data stored in the router.

!!! info
    This mode is for now avaialble only on Omnia 2019 and newer.

6 LEDs (Power, 0, 1, 2, 3, 4)

If the Turris Omnia router operating system is broken beyond repair or if you
want to avoid long upgrades during initial setup, please use the following
method for restoring the operating system image.

The Turris Omnia router will rewrite content of the internal memory with the
system image downloaded from the internet.

To use this mode, you need to plug your Turris Omnia to a network where it can
get internet connection using DHCP. It will try to use only the WAN port Once
it gets online, it will download latest medkit from our website alongside with
it's signature. Verifies it and if everything works well, it will reflash
itself.

Process of rewriting the internal memory takes considerably longer time than
snapshot rollback in the previous cases.

## Rescue shell

!!! warning
    This option is for true geeks.

7 LEDs (Power, 0, 1, 2, 3, 4, WAN)

This mode allows you to enter a read-only rescue image. You can use UART serial
console to connect to the router's rescue shell.

If you accidentally enter this mode you may reset the router by briefly
pressing the reset button. You can do this only in this particular mode. Do not
reset the router in mode 2-4!


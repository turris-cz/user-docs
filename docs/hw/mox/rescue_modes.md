# Factory reset on Turris MOX

The Turris MOX router has a multifunction button on its back panel. When you
press it during normal operation, it will reset the MOX gracefully. If you hold
the button for a while (more than 4 seconds) it will reset the MOX immediately
without shutting down your services first and without making sure they properly
stored all the data. Button handling is implemented in software so its function
depends on working system. If it seems that MOX is not restarting unplug it
from the power supply for few seconds and then reconnect it again.

## Triggering rescue mode

To enter various rescue modes, the button has to be pressed during the router
boot. The easiest way to do so is to pres the button and connect MOX to the
power source while still keeping the button pressed.

Once powered up, MOX will light up it's LED and when detecting pressed button,
it will switch to the rescue mode and turn LED back off. During normal boot,
LED is on till the MOX boots up. When the LED is off, you can stop pressing
the button.

Once rescue mode started, it will turn LED back on and it will use the LED to show you
the selected rescue mode by blinking. It will blink once to show you that mode one is selected.

If you don't like the selected mode, pres the button again and MOX will switch
to the next mode again blinking to denote mode number. If you missed it as you
were busy pressing the button, it will repeat it in three seconds once more.

If you are in correct mode, do not press the button and three seconds after
second time displaying the mode number router will execute it.

After finishing it, it will reboot itself and boot normally.

!!! warning
    Router will start blinking during execution of the mode to indicate that
    you shouldn't reset it or unplug it from power source. If you do so, you
    risk data corruption.

Following rescue modes are available:

1. Standard reboot
2. Rollback to latest snapshot
3. Rollback to factory reset
4. Re-flash router from flash drive/micro SD
5. Unsecure SSH on 192.168.1.1
6. Flash from the internet
7. Boot to rescue shell

### Sample scenario

Let's pretend we would like to set mode 4 – re-flash router from flash drive.
Here is the example of MOX communication.


| MOX LED     | Meaning                                                 | Button |
|------|----------------------------------------------------------------|--------|
| off         | MOX is off. Hold the button and plug in the power adapter. | Hold   |
| blink       |I know you are holding a button. You can release it now. | Hold   |
|off |I'm starting kernel. |Released |
|on |Kernel started, I'm starting rescue image. Prepare for announcements. |Released|
|blink |I'm going to do mode one (reset). Do you like it?|Released|
|on (about 3 seconds)|I'm waiting for your opinion. _We said that we want the mode 4. We don't like the mode 1 so we will press the button._|Pressed|
|Blink blink|Ok, if you don't like the mode one, what about the mode two (btrfs rollback)?|Released|
|on|_We don't like the mode two so we will press the button. We want the mode four._|Pressed|
|Blink blink blink|If you don't like the mode two, what about the mode three. I'm going to do it if you like it.|Released|
|on|_Let say we miss the announcement and we are not sure in which mode we are now. We can wait a little bit, there will be the second announcement._|Released|
|Blink blink blink|I'm saying that if you do nothing I'm going to mode three (factory reset).|Released|
|on|MOX is going to run mode three. It's something we don't like. We need to press the button.|Pressed|
|Blink blink blink blink| I'm going to mode 4 (USB flashing). Do you like it?|Released|
|on (about 3 seconds)|I'm waiting for your opinion.We said that we want mode four. We like that MOX is going to do mode four. We do nothing to interrupt it.|Do nothing|
|Blink blink blink blink|I'm saying that I'm going to mode 4 (second announcement).|Do nothing|
|on (about 3 seconds)|I'm waiting for your opinion. _Everything is fine. Do nothing._ |Do nothing|
|Slow blinking |Time's up. I'm going to mode 4. |Do nothing|

## Rescue Modes

### Standard reboot

Router is going to run rescue system, but as no other mode was selected, it
will simply reboot.

### Rollback to latest snapshot

This mode may help in situation when you lose network connectivity to your
Turris MOX router during experiments or due to any other reason that is bound
to the internal state of the router. You can simply return to the latest
snapshot of the running system by selecting the proper reset mode. For more
information about the snapshots please visit _schnapps_.

During the course of the operation the LED is blinking. When the rollback
operation is completed the router automatically restarts.

!!! tip
    Your current state is saved in a snapshot. You can later cheery-pick changes
    you still want by using _schnapps_.

## Rollback to factory reset

All data, settings and software in the internal storage of the router are
erased and replaced by the factory defaults. Internally the file system rolls
back to the first snapshot (the first snapshot has been created in the
factory). Please use this mode when you lose your password and all means of
access to the router or when the return to the latest snapshot (mode 2) is not
sufficient to repair broken system.

Indication of the process progress is the same as in case of rollback to the
latest snapshot (mode 2).

!!! tip
    Your current state is saved in a snapshot. You can later cheery-pick changes
    you still want by using _schnapps_.

## Re-flash router

!!! warning
    This operation erases all settings and all data stored in the router.

If the Turris MOX router operating system is broken beyond repair or if you
want to avoid long upgrades during initial setup, please use the following
method for restoring the operating system image.

!!! info
    Turris MOX does not have any internal storage apart from a micro SD card.
    But even so, you can use that card to provide system image and use this mode
    to reflash the card itself.

Download the latest version of Turris MOX image form
<https://repo.turris.cz/hbs/medkit/mox-medkit-latest.tar.gz>. Save the
file `mox-medkit-latest.tar.gz` to USB flash drive or micro SD card to the root
directory. The Turris MOX router supports following filesystems: _ext4, BtrFS
and FAT32_. You can also download and put alongside `md5`, `sha512` or `sig`
file from the same URL. Rescue mode will then verify the tarball first before
flashing it. Connect the USB flash/insert the micro SD card to the Turris MOX
router and use rescue mode mode 4.

The Turris MOX router will rewrite content of the micro SD card with the system
image from the USB flash drive/micro SD card.

Process of rewriting the micro SD card takes considerably longer time than
snapshot rollback in the previous cases. However, indication of the process
progress is the same as in case of rollback to the latest snapshot (mode 2).

## Unsecure SSH on 192.168.1.1

!!! warning
    When used incorrectly, this operation exposes your MOX unprotected on the
    internet. Make sure to unplug all untrusted computers and internet
    connection first.

This mode is meant to help you debug your issues without need for serial cable
or rolling back snapshots. Before entering this mode, unplug all untrusted
computers from your Turris MOX and connect your computer to the Ethernet port
on module A next to the power supply connector.

When started, MOX will set-up IPv4 network on it's interface with static IP
address `192.168.1.1/24`. Pick a random IP address from the same network (for
example `192.168.1.2/24`) and set it up manually on your computer. After that,
you should be able to ssh as root to your router without need to enter
password. You will end up in rescue mode with limited capabilities, but you
have _schnapps_ at your disposal and you can mount rootfs from your micro SD
card and do any changes you need.

After finishing your fixes, don't forget to unmount any mounted filesystems and
reboot the router.

## Flash from the internet

!!! warning
    This operation erases all settings and all data stored in the router.

If the Turris MOX router operating system is broken beyond repair or if you
want to avoid long upgrades during initial setup, please use the following
method for restoring the operating system image.

The Turris MOX router will rewrite content of the micro SD card with the system
image downloaded from the internet.

To use this mode, you need to plug your Turris MOX to a network where it can
get internet connection using DHCP. It will try to use only the port on module
A - next to the power source. Once it gets online, it will download latest
medkit from our website alongside with it's signature. Verifies it and if
everything works well, it will reflash itself.

Process of rewriting the micro SD card takes considerably longer time than
snapshot rollback in the previous cases. However, indication of the process
progress is the same as in case of rollback to the latest snapshot (mode 2).

## Rescue shell

!!! warning
    This option is for true geeks.

This mode allows you to enter a read-only rescue image. You can use UART serial
console to connect to the router's rescue shell.

If you accidentally enter this mode you may reset the router by briefly
pressing the reset button. You can do this only in this particular mode. Do not
reset the router in mode 2-4!


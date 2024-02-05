---
board: omnia
competency: advanced
---
# MCU firmware of Turris Omnia

!!! note
    This guide applies to Turris OS 6.5 and higher.

In October 2023, we released a new version of MCU firmware for Turris Omnia
along with a tool `omnia-mcutool` to manage the update of firmware and
configure automatic power on. This update brings many new quality-of-life
features for Turris Omnia, such as:

- The `poweroff` command now completely powers the device off (the power
consumption goes down to a minimum). To power the router on, the user
needs to press the front button.

- The device can be configured to automatically power on from the powered-off
state at a specific time or after a certain time.

- Several updates to Turris Omnia LED driver, such as gamma correction.
For more information, refer to our 
[Gitlab](https://gitlab.nic.cz/turris/os/build/-/merge_requests/674).

## MCU firmware update on Turris Omnia

### Through reForis

From Turris OS 6.5, we also introduced a way to update the MCU firmware of
your Turris device through reForis.

!!! Warning
    This feature is marked experimental as it is meant for testing at the
    moment.

Automatic updates can be turned on as a package via *Package Management*
-> *Packages*

![reForis MCU firmware update](mcu_packages.png)

![reforis MCU firmware update checked](mcu_packages_checked.png)

!!! Success
    Sometime after the MCU firmware update, all of the LEDs of the Omnia will
    start blinking bright green. This means a reboot is needed.

### Through CLI

In order to update the MCU firmware on your device, you need to install
the `omnia-mcutool`

```
opkg update && opkg install omnia-mcutool
```

Then run the `omnia-mcutool` to upgrade the firmware.

!!! warning
    Make sure your device stays plugged in throughout the whole process of
    firmware update!

```
omnia-mcutool --upgrade
```

After the update, you will be prompted to reboot your device.

```
reboot
```

## Setting up automatic wake-up

!!! note
    You need to upgrade the MCU firmware in order to set up the wake-up.

The `poweroff` command now completely powers down the Omnia.
In order to set up automatic wake-up after a certain time or at a specific
time, you can use the following option:

```
omnia-mcutool --wakeup 'TIMESTAMP'
```

The timestamp can be absolute, e.g., `'YYYY-MM-DD hh:mm:ss'`, or relative,
e.g., `'+60 minutes'`, or `'unset'` to deconfigure wake-up time.

To show the configured wake-up time, you can use the following option:

```
omnia-mcutool --wakeup-status
```

After setting up the wake-up time, you can power down the Omnia with a cron
job or with the `poweroff` command.

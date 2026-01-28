---
board: omnia, 1.x, mox
competency: advanced
---
# Firmware update on Turris devices

!!! warning
    This feature is currently experimental and intended for testing
    purposes.

While Turris OS updates automatically, the U-Boot bootloader, rescue
system, and the MCU firmware do not. These low-level components have received
significant improvements since the initial hardware release. This guide
explains how to update them manually to resolve issues caused by outdated
firmware.

!!! danger
    Older [revisions of Turris Omnia](../../hw/omnia/revisions.md), such
    as the CZ11NIC13, are susceptible to RAM training issues with newer
    U-Boot versions. Updating the U-Boot environment on these devices
    may result in a boot loop.

## Firmware update

!!! warning
    Ensure the device remains powered on throughout the entire update
    process. [Recovery from a failed firmware update](../../hw/omnia/serial-boot.md)
    is difficult.

### Via reForis

Starting with Turris OS 6.5, you can update the device firmware directly
through the reForis interface.

To enable automatic firmware updates in reForis:

Navigate to *Package Management* → *Packages*.

![reForis firmware update](nor_packages.png)

And check the relevant firmware update packages.

![reForis firmware update checked](nor_packages_checked.png)

### Via CLI

Install the `turris-nor-update` package.

```bash
opkg update && opkg install turris-nor-update
```

Run the utility.

```bash
nor-update
```

!!! note
    You may see a verification failure in the output:

    ```bash
    Verifying /dev/mtd0 against secure-firmware.bin
    1705eb30f3e7795d0805e97134515d91 - /dev/mtd0
    e12a263c63bd9860cff844763e81e56b - secure-firmware.bin
    Failed
    ```

    A `Failed` status indicates that your current U-Boot or rescue system
    is outdated and requires updating. This is expected behavior.

Reboot the device to complete the firmware update.

!!! important
    The update may disable the LEDs. To restore them, press the front
    LED button. If this fails or you require custom behavior, configure
    the LEDs via *System* → *LED Configuration* in LuCI.

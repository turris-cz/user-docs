---
board: 1.x
competency: advanced
---
# Migrating the system to a microSD card on Turris 1.x routers

This guide details creating a system that runs entirely from a microSD
card, bypassing the onboard NAND memory. The target system will run the
latest version of Turris OS and U-Boot.

## Requirements

You will need:

* a [Turris 1.0 or Turris 1.1](../hw/turris-1x/turris-1x.md) router,
* a microSD card with at least 8 GB capacity,
* an internet connection,
* a PH1 screwdriver,
* a Linux-running computer (tested on Ubuntu 24.04, 25.10, and Debian 13),
* a microSD card reader

!!! tip
    If you do not have a Linux system, you can create a
    bootable USB drive using Linux by following the [Ubuntu USB creation guide](https://documentation.ubuntu.com/desktop/en/latest/how-to/create-a-bootable-usb-stick/)
    to run the required script.

## Flashing the microSD card

Insert the microSD card into the Linux computer and install the necessary
dependencies.

```bash
sudo apt update && sudo apt install wget curl
```

Download the [microSD card formatting script](https://gitlab.nic.cz/turris/misc/-/blob/master/turris1x-sd/turris1xsdimg)
into a temporary directory.

```bash
cd /tmp && wget https://gitlab.nic.cz/turris/misc/-/raw/master/turris1x-sd/turris1xsdimg -O turris1xsdimg && chmod +x turris1xsdimg
```

!!! warning
    Check the correct device path to the microSD card. Running the
    script on the wrong disk will result in permanent data loss. Verify
    the path using `lsblk` or `fdisk -l`.

    ```bash
    lsblk
    ```

    The microSD card typically appears as `/dev/sdx` or `/dev/mmcblkx`.

Execute the script, passing the path to your microSD card.

```bash
sudo ./turris1xsdimg /dev/path/to/microSDcard
```

Once the script completes, remove the microSD card and proceed to the
next step.

### Installing the microSD card

1. Disconnect the router from the power source.
2. Remove the four screw securing the top panel and lift it off.
3. The microSD card slot is located underneath the RAM module.
4. Release the RAM module by pressing the metal clips on both ends of the slot simultaneously. The RAM will pop up.
5. Insert the microSD card into the slot gently until fully seated.

![RAM module without RAM and inserted SD card](turris1x-without-ram.jpg)

Reinstall the RAM module by pressing it down until the clips snap into place.

![RAM module with inserted RAM](turris1x-with-ram.jpg)

### Switching the boot location

Locate the `SW1` switch on the router board and set the state to `011010`.

![SW1 switch in state 011010](turris1x-sw1-011010.png)

Connect the power supply. The router will now boot into the new system
on the microSD card.

Follow the [initial configuration guide](https://docs.turris.cz/basics/reforis/guide/)
to set up the router.

#### Verification

To confirm the system is running from the microSD card, execute the
`mount` command and verify the output.

```bash
/dev/mmcblk0p1 on / type btrfs
```

If this entry is present, the migration was successful.

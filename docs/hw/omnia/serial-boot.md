---
board: omnia
competency: expert
---
# Booting Turris Omnia over serial

!!! warning
    This howto is targeting really advanced users. Under normal circumstances
    you should never ever need this except if you reflashed your NOR (not
    easily accessible) with something that is not working. If your router
    works, **do not attempt to reflash it**.

Turris Omnia is using U-Boot to boot. That U-Boot is typically loaded from the
beginning of the NOR memory and takes care of the rest of the booting process.
If you try to flash it with a different U-Boot and your new U-Boot is corrupted,
you'll end up with an unbootable device. To fix that, there is an option to
switch Omnia into a mode in which it will download U-Boot over serial line and
boot it.

## Requirements

You'll need a computer running Linux and a working serial cable connected to
your Omnia. How to connect the serial cable is documented in
[another part](../serial.md#turris-omnia) of this documentation.

### Tools

You will need the **kwboot** tool from the U-Boot tools package in
**v2022.04** or a newer version. You can install it via your Linux package
manager (e.g. on Debian/Ubuntu via `apt install u-boot-tools`, on Fedora
`dnf install uboot-tools`, on OpenSUSE `zypper install u-boot-tools`, ...).
Or you can get the binary for x86-64 CPU from
[our repository](https://repo.turris.cz/omnia/nor_fw/x86_64/).

!!! warning
    For example, the version of `kwboot` is older than required in the current
    Ubuntu version. In such case, you will need to download the binery
    (for x86-64 CPU only) from our repository as mentioned. Save it to your
    working directory and set it as runable:
    ```
    chmod +x kwboot
    ```
    Then, you can run it using `./kwboot` as follows:
    ```
    ./kwboot -t -b uboot /dev/ttyUSB0
    ```


### Images

You will also need the latest U-Boot image and the latest rescue system image.
You can find both
[in our GitLab](https://gitlab.nic.cz/turris/os/packages/-/tree/master/hardware/omnia/omnia-firmware/files).
What you are interested in are two binary files there - `rescue` and `uboot`.
You can use them to boot your Omnia over the serial line or to reflash
the content of your NOR memory.

## Booting

For the purpose of this tutorial, it is assumed that you have all the binaries
in your current working directory and that your serial line is _ttyUSB0_.

1. Disconnect your Omnia from power supply.
2. Run the following command.

    ```
    kwboot -t -b uboot /dev/ttyUSB0
    ```

3. Connect the power supply.

    kwboot will trigger the _boot over serial_ mode of your Omnia automatically

If everything works well, you should see the U-Boot being transferred to your
Omnia and once done, you'll see U-Boot prompt and you can use that to recover
your device.

Sometimes the `kwboot` command fails on the first try, but you can just run it
again and again till it succeeds.

You may append additional argument `-B 1500000` to increase transfer speed.
The default speed is 115200 bauds/sec. Omnia supports speeds up to the 5200000
bauds/sec, but not all serial cables can handle such high speed modes.

## NOR recovery

Once you have U-Boot running, you can get various images, for example via an USB
flash disk, tftp, serial console and write it to nor.

### Transfer via USB flash disk

Copy the image to a FAT or EXT4 formatted USB flash disk, connect it to the Omnia USB
port and run the following commands:

```
usb start
test -z "${loadaddr}" && setenv loadaddr 0x800000
load usb 0 ${loadaddr} image
usb stop
```

### Transfer from TFTP server

To download an image from TFTP server you need to get your network started,
decide where to load it and load it. Assuming you have a TFTP server running on
a computer with IP 192.168.1.1 on a WAN network, the following U-Boot commands
will get you a file named `image` into the RAM.

```
setenv autoload no
dhcp
setenv serverip 192.168.1.1
test -z "${loadaddr}" && setenv loadaddr 0x800000
tftpboot ${loadaddr} image
```

### Transfer via serial console

Alternativelly, you can transfer the image over the serial console via
the x-modem protocol. For this purpose you need the additional **sx** tool
from the `lrzsz` package.

1. Switch the U-Boot terminal from the command to the x-modem file transfer
    mode.

    ```
    test -z "${loadaddr}" && setenv loadaddr 0x800000
    loadx ${loadaddr}
    ```

2. Disconnected from the U-Boot terminal.

    If using kwboot, press **CTRL+\\** followed by **c**.

3. From the Linux console start x-modem file transfer for the file named
    `image` via **sx** tool.

    ```
    sh -c 'exec 0<>/dev/ttyUSB0 1>&0; sx image'
    ```

4. After transfer finish, connect back to the U-Boot terminal.

    You can connect via kwboot by omitting `-b` option: `kwboot -t /dev/ttyUSB0`

### Write image to NOR

Now you have a file originally called `image` in the RAM on your router.
To write to the NOR you have to know where it belongs.

!!! warning
    Make sure you don't mix an old U-Boot with the new rescue system or the new
    U-Boot with an old Turris OS, it might not work. Try to keep everything on
    the latest version if you are reflashing.

To reflash U-Boot, your image file on TFTP will be the `uboot` file from
the _[Images](#images)_ section and you need to write it from the beginning of
the NOR.

```
sf probe
sf update ${loadaddr} 0 ${filesize}
```

To recover the rescue system, your image file will be `rescue` from
the _[Images](#images)_ section and you need to start writing it after
the first megabyte that is reserved for U-Boot.

```
sf probe
sf update ${loadaddr} 0x00100000 ${filesize}
```

After that, you can call the `reset` command or hit the reset button and see
your router booting again.

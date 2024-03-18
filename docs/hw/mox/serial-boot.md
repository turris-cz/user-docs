---
board: mox
competency: expert
---
# Booting Turris MOX over serial

!!! warning
    The procedure described on this page is for developers and really advanced
    users only and you normally shouldn't be in a position to need it.
    If your router works, **do not attempt to reflash it**.

!!! warning
    This howto works only on a Linux computer. If you are using another operating
    system, the easiest way to execute the procedure described here is via
    Ubuntu installed in VirtualBox.

If you somehow managed to brick the U-Boot bootloader in your MOX and the device
cannot boot, there is a way to stop the booting procedure even before U-Boot is
loaded and upload another U-Boot via UART.

There are several ways how the bootloader on your board could have become
broken, including:

* You could have written an invalid image (for example U-Boot) into the
  `secure-firmware` MTD partition. In this case the board won't display anything
  on the UART console after power up.
* You could have written a broken U-Boot into the `u-boot` MTD partition. In
  this case the boards may or may not display some U-Boot prompts on the UART
  console.

## Connecting the UART adapter

You will need a 1.8V USB TTL serial cable. Connect the Tx, Rx, GND and potentially
VCC signals to pins 13, 14, 5 and 6 respectively, as described
[here](../serial.md#turris-mox).

After connecting the cable to correct pins and the USB connector of the UART
adapter to your PC, your system should create a device file in `/dev`
directory with a name beginning with `ttyUSB` followed by a number. If you
have several such files in `/dev`, the correct one is the one which was created
only after you stuck the UART adapter into the PC.

## Getting the recovery utility

You will need the [`mox-imager`](https://gitlab.nic.cz/turris/mox-imager) utility.
You can either download [precompiled binaries](https://gitlab.nic.cz/turris/mox-imager/uploads/ad55930e732f0689ded2933fc860e9c5/mox-imager-v0.1-binary-x86-amd64.tar.gz)
(for x86 and amd64 only) or download `mox-imager`'s source code and compile it.

### Downloading precompiled binaries

```
$ cd /tmp
$ mkdir mox-imager
$ cd mox-imager
$ wget https://gitlab.nic.cz/turris/mox-imager/uploads/ad55930e732f0689ded2933fc860e9c5/mox-imager-v0.1-binary-x86-amd64.tar.gz
$ tar xf mox-imager-v0.1-binary-x86-amd64.tar.gz
$ rm mox-imager-v0.1-binary-x86-amd64.tar.gz
$ ls
mox-imager.amd64  mox-imager.x86  trusted-uart-image.bin
```

Later you will use either the `mox-imager.amd64` or `mox-imager.x86` binary, depending
on your architecture.

### Compiling from source

The `mox-imager` utility depends on `glibc` and `openssl`/`libressl`. For building you
will also need build essentials installed. On Ubuntu, this means installling packages
`build-essential` and `libssl-dev`.

```
$ cd /tmp
$ wget https://gitlab.nic.cz/turris/mox-imager/-/archive/v0.1/mox-imager-v0.1.tar.gz
$ tar xf mox-imager-v0.1.tar.gz
$ rm mox-imager-v0.1.tar.gz
$ cd mox-imager-v0.1
$ make
```

After a successful build the directory should contain `mox-imager` binary.

## Getting the original bootloader images

Since the current bootloader in your device is broken, you will have to get the
original bootloader images. Download
[`secure-firmware.bin`](https://gitlab.nic.cz/turris/os/packages/-/raw/master/hardware/mox/mox-firmware/files/secure-firmware.bin)
and
[`uboot`](https://gitlab.nic.cz/turris/os/packages/-/raw/master/hardware/mox/mox-firmware/files/uboot)
and either place them into `/tmp`, put then on your MicroSD card or on a USB
flash disk.

## Other requirements

You will also need a serial communications program, like `minicom` or `PuTTY`.
In the examples below we will use `minicom`.

## Recovering

### Uploading U-Boot via UART

Now that the recovery utility is prepared and the correct device file for the
UART adapter is known (in following examples we will use `/dev/ttyUSB0`), the
recovery procedure may begin. Please replace `mox-imager` with
`mox-imager.amd64` or `mox-imager.x86` if you've downloaded the precompiled
binary of this utility.

1. Make sure that you MOX board is not powered.
2. Run `./mox-imager -D /dev/ttyUSB0 -E trusted-uart-image.bin && minicom -D /dev/ttyUSB0 -b 115200`
3. After 2-4 seconds power up your MOX and wait.
4. If the command fails or hangs for more than 20 seconds, power off your MOX
   and go to step 1. (This may happen several times.)
5. Otherwise the utility should print progress of image upload into the device.
   After successful upload the command from step 2 should start `minicom` which
   will print U-Boot loading messages. Interrupt U-Boot's booting procedure with
   a keystroke and you should be left in U-Boot's command prompt.
6. Flash the original bootloader images from MicroSD card, USB flash disk or
   from your PC, as described in the **Flashing** sections below.

#### Video

In the following video the download (via `git`) and compilation of `mox-imager`
sources, and execution of steps 1-5 from previous section is shown:

<video style="width:100%" controls>
  <source src="https://static.turris.com/docs/mox/serial-boot-booting-broken-board.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

### Flashing bootloader images from a MicroSD card

If you put the original bootloader images on a MicroSD card, put the card
into MOX and execute the following commands in U-Boot (the output is shown as
well):

```
=> ls mmc 0
<   >     853552  Tue Apr 28 20:31:14 2020  uboot
<   >     131072  Tue Apr 28 20:31:26 2020  secure-firmware.bin
=> load mmc 0 0x10000000 secure-firmware.bin
131072 bytes read in 31 ms (4 MiB/s)
=> sf probe
SF: Detected w25q64dw with page size 256 Bytes, erase size 4 KiB, total 8 MiB
=> sf update 0x10000000 0 0x20000
device 0 offset 0x0, size 0x20000
32768 bytes written, 98304 bytes skipped in 0.859s, speed 156067 B/s
=> load mmc 0 0x10000000 uboot
853552 bytes read in 63 ms (12.9 MiB/s)
=> sf update 0x10000000 0x20000 0x160000
device 0 offset 0x20000, size 0x160000
1323008 bytes written, 118784 bytes skipped in 27.176s, speed 54325 B/s
=>
```

### Flashing bootloader images from a USB flash disk

If you put the original bootloader images on a USB flash disk, connect it to MOX
and execute the following commands in U-Boot (the output is shown as well):

```
=> usb start
starting USB...
Bus usb@58000: Register 2000104 NbrPorts 2
Starting the controller
USB XHCI 1.00
Bus usb@5e000: USB EHCI 1.00
scanning bus usb@58000 for devices... 2 USB Device(s) found
scanning bus usb@5e000 for devices... 1 USB Device(s) found
       scanning usb for storage devices... 1 Storage Device(s) found
=> ls usb 0
   131072   secure-firmware.bin
   853552   uboot

2 file(s), 0 dir(s)

=> load usb 0 0x10000000 secure-firmware.bin
131072 bytes read in 6 ms (20.8 MiB/s)
=> sf probe
SF: Detected w25q64dw with page size 256 Bytes, erase size 4 KiB, total 8 MiB
=> sf update 0x10000000 0 0x20000
device 0 offset 0x0, size 0x20000
32768 bytes written, 98304 bytes skipped in 0.859s, speed 156067 B/s
=> load usb 0 0x10000000 uboot
853552 bytes read in 16 ms (50.9 MiB/s)
=> sf update 0x10000000 0x20000 0x160000
device 0 offset 0x20000, size 0x160000
1323008 bytes written, 118784 bytes skipped in 27.176s, speed 54325 B/s
=>
```

### Flashing bootloader images uploaded via UART

If you put your bootloader images into `/tmp` directory on your PC, it is
possible to upload them into the running U-Boot on MOX via UART, via the
YMODEM protocol. This text shows how to do this with `minicom`.

1. Run `loady 0x10000000` command in U-Boot. This should print something like
   `Ready for binary (ymodem) download...`.
2. Press `[CTRL+a]`, then `[z]`. The Minicom Command Summary window will be
   displayed.
3. Press `[s]` to send files. Upload window shall appear.
4. Select the `ymodem` option with arrow keys and confirm with `[Enter]`.
   A file selection window will appear.
5. Press `[Enter]`. Another window, titled `No file selected – enter filename`
   shall appear.
6. Write `/tmp/secure-firmware.bin` and press `[Enter]`. `minicom` shall start
   uploading the file. After the file is uploaded, a `Transfer complete` message
   will be displayed in the file uploading window.
7. Press any key to exit the file uploading window.
8. Run `sf probe` and then `sf update 0x10000000 0 0x20000` to flash
   `secure-firmware.bin` image.
9. Execute steps 1-8, but in step 6 use file `/tmp/uboot` instead of
   `/tmp/secure-firmware.bin`.
10. Run `sf probe` and then `sf update 0x10000000 0x20000 0x160000` to flash
   `uboot` image.

<video style="width:100%" controls>
  <source src="https://static.turris.com/docs/mox/serial-boot-uploading-images-uart.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>
